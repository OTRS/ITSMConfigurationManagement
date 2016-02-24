# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::TicketStatusLink;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::User',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::LinkObject',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Data Event Config)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return;
        }
    }

    #$Kernel::OM->Get('Kernel::System::Log')->Dumper('Param', %Param);

    if ( $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::SetIncidentState') ) {

        my $Return = 0;

        my $CorrectEvent = 0;
        for my $Event (qw(LinkAdd LinkDelete TicketStateUpdate TicketTypeUpdate)) {
            if ( $Param{Event} eq $Event ) {
                $CorrectEvent = 1;
            }
        }

        return if $CorrectEvent == 0;

        my $TicketID     = 0;
        my $ConfigItemID = 0;
        my $NewCIVersion = 0;

        # get ticket object
        my $TicketObject         = $Kernel::OM->Get('Kernel::System::Ticket');
        my $ITSMConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        if ( $Param{Event} eq 'LinkAdd' || $Param{Event} eq 'LinkDelete' ) {

            # TicketID
            if ( $Param{Data}->{Comment} ) {
                $TicketID = $Param{Data}->{Comment};
                $TicketID = substr( $TicketID, 0, index( $TicketID, '%%' ) );
            }
            return if !$TicketID;

            # get ticket
            my %Ticket = $TicketObject->TicketGet(
                TicketID => $TicketID,
                UserID   => 1,
            );
            return if !%Ticket;

            # ConfigItemID
            $ConfigItemID = $Param{Data}->{ConfigItemID};
            return if !$ConfigItemID;

            # Link Add = check + set
            if ( $Param{Event} eq 'LinkAdd' ) {

                # if ticket is new/open/pending
                # set INCIDENT
                my $StateOK = 0;
                my @StateArray = ( 'new', 'open', 'pending reminder', 'pending auto' );
                for my $State (@StateArray) {
                    $StateOK = 1 if $Ticket{State} eq $State;
                }
                if ($StateOK) {
                    $NewCIVersion = $Self->_SetCIStatus(
                        ConfigItemID  => $ConfigItemID,
                        IncidentState => 'Incident',
                    );
                }
            }
            elsif ( $Param{Event} eq 'LinkDelete' ) {

                #TODO: check for still open links
                $NewCIVersion = $Self->_SetCIStatus(
                    ConfigItemID  => $ConfigItemID,
                    IncidentState => 'Operational',
                );
            }
        }

        # Ticket state Update
        elsif ( $Param{Event} eq 'TicketStateUpdate' ) {

            # TicketID
            if ( $Param{Data}->{TicketID} ) {
                $TicketID = $Param{Data}->{TicketID};
            }
            return if !$TicketID;

            # get ticket
            my %Ticket = $TicketObject->TicketGet(
                TicketID => $TicketID,
                UserID   => 1,
            );
            return if !%Ticket;

            # state-update only for closed tickets check
            my $StateOK = 0;
            if ( $Ticket{StateType} eq 'closed' ) {
                $StateOK = 1;
            }

            if ($StateOK) {

                # check for more linked open tickets
                my $MoreOpenLinks = $Self->_CheckLinks(
                    TicketID => $TicketID,
                );

                $NewCIVersion = $Self->_SetCIStatus(
                    ConfigItemID  => $ConfigItemID,
                    IncidentState => 'Operational',
                );
            }
        }

        if ( $NewCIVersion && $NewCIVersion > 0 ) {
            $Return = 1;
        }

        if ($Return) {
            $TicketObject->HistoryAdd(
                TicketID     => $TicketID,
                HistoryType  => 'Misc',
                Name         => "Status of CI set.",
                CreateUserID => $Param{UserID},
            );

            return 1;
        }
        else {
            $TicketObject->HistoryAdd(
                TicketID     => $TicketID,
                HistoryType  => 'Misc',
                Name         => "Status of CI already set!",
                CreateUserID => $Param{UserID},
            );

            return 1;
        }
    }

    # Do not change any state
    return 1;
}

sub _SetCIStatus {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID IncidentState)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return;
        }
    }

    my $Version = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
        ConfigItemID => $Param{ConfigItemID},
        XMLDataGet   => 1,
    );

    return if !$Version;
    return if ref $Version ne 'HASH';

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    return if !$InciStateList;
    return if ref $InciStateList ne 'HASH';

    # reverse the incident state list
    my %ReverseInciStateList = reverse %{$InciStateList};

    # check if incident state is valid
    if ( !$ReverseInciStateList{ $Param{IncidentState} } ) {

        # log error
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid incident state '$Param{IncidentState}'!",
        );

        return;
    }

    # add a new version with the new incident state
    my $VersionID = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionAdd(
        %{$Version},
        InciStateID => $ReverseInciStateList{ $Param{IncidentState} },
        UserID      => 1,
    );

    return $VersionID;
}

# returns an array of linked ConfiItemIDs
# maybe empty if no link left
#TODO !
sub _CheckLinks {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(TicketID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return [];
        }
    }
    my $TicketID = $Param{TicketID};

    my @ReturnArray;

    my $LinkList = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkList(
        Object    => 'Ticket',
        Key       => $TicketID,
        Object2   => 'ITSMConfigItem',
        State     => 'Valid',
        Direction => 'Both',
        UserID    => 1,
    );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $LinkTypes;
    if ( $ConfigObject->Get('ITSMConfigItem::LinkStatus::LinkTypes') ) {
        $LinkTypes = $ConfigObject->Get('ITSMConfigItem::LinkStatus::LinkTypes');
        for my $Type ( @{$LinkTypes} ) {
            for my $Direction (qw(Source Target)) {
                my %Links = $LinkList->{ITSMConfigItem}->{$Type}->{$Direction};
                for my $Item (%Links) {
                    push @ReturnArray, $Item;
                }
            }
        }
        return @ReturnArray;
    }
    else {
        $LinkTypes = $ConfigObject->Get('LinkObject::Type');
    }

    return [];
}

1;
