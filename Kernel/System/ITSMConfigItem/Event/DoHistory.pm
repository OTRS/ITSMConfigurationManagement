# --
# Kernel/System/ITSMConfigItem/Event/DoHistory.pm - a event module for config items
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Event::DoHistory;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;

=head1 NAME

Kernel::System::ITSMConfigItem::Event::DoHistory - Event handler that does the history

=head1 SYNOPSIS

All event handler functions for history.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::Time;
    use Kernel::System::ITSMConfigItem::Event::DoHistory;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $TimeObject = Kernel::System::Time->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $DoHistoryObject = Kernel::System::ITSMConfigItem::Event::DoHistory->new(
        ConfigItemObject => $ConfigItemObject,
        ConfigObject     => $ConfigObject,
        DBObject         => $DBObject,
        EncodeObject     => $EncodeObject,
        LogObject        => $LogObject,
        MainObject       => $MainObject,
        TimeObject       => $TimeObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for my $Needed (qw(ConfigObject LogObject DBObject MainObject EncodeObject TimeObject)) {
        $Self->{$Needed} = $Param{$Needed} || die "Got no $Needed!";
    }

    # create needed objects
    $Self->{ConfigItemObject} = Kernel::System::ITSMConfigItem->new( %{$Self} );

    return $Self;
}

=item Run()

This method handles the event.

    $DoHistoryObject->Run(
        Event => 'ConfigItemCreate',
        Data  => {
            Comment      => 'new value: 1',
            ConfigItemID => 123,
        },
        UserID => 1,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # as DefinitionCreate does not belong to an item, we don't create
    # a history entry
    if ( $Param{Event} && $Param{Event} eq 'DefinitionCreate' ) {
        return;
    }

    # check needed stuff
    for my $Needed (qw(Data Event UserID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # due to consistency with ticket history, we need HistoryType
    $Param{HistoryType} = $Param{Event};

    # dispatch table for all events
    my %Dispatcher = (
        ConfigItemCreate      => \&_HistoryAdd,
        ConfigItemDelete      => \&_ConfigItemDelete,
        LinkAdd               => \&_HistoryAdd,
        LinkDelete            => \&_HistoryAdd,
        NameUpdate            => \&_HistoryAdd,
        IncidentStateUpdate   => \&_HistoryAdd,
        DeploymentStateUpdate => \&_HistoryAdd,
        DefinitionUpdate      => \&_HistoryAdd,
        VersionCreate         => \&_HistoryAdd,
        ValueUpdate           => \&_HistoryAdd,
        DefinitionCreate      => \&_HistoryAdd,
        VersionDelete         => \&_HistoryAdd,
        AttachmentAddPost     => \&_HistoryAdd,
        AttachmentDeletePost  => \&_HistoryAdd,
    );

    # error handling
    if ( !exists $Dispatcher{ $Param{Event} } ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'non existant history type: ' . $Param{Event},
        );

        return;
    }

    # call callback
    my $Sub = $Dispatcher{ $Param{Event} };
    $Self->$Sub(
        %Param,
        %{ $Param{Data} },
    );

    return 1;
}

=item _ConfigItemDelete()

history's event handler for ConfigItemDelete

=cut

sub _ConfigItemDelete {
    my ( $Self, %Param ) = @_;

    # delete history
    $Self->{ConfigItemObject}->HistoryDelete(
        ConfigItemID => $Param{ConfigItemID},
    );

    return 1;
}

=item _HistoryAdd()

history's default event handler.

=cut

sub _HistoryAdd {
    my ( $Self, %Param ) = @_;

    # add history entry
    $Self->{ConfigItemObject}->HistoryAdd(
        %Param,
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
