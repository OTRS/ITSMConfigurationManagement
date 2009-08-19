# --
# Kernel/System/ITSMConfigItem/Event/DoHistory.pm - a event module for config items
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: DoHistory.pm,v 1.5 2009-08-19 12:55:41 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Event::DoHistory;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem::History;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.5 $) [1];

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
    use Kernel::System::ITSMConfigItem;
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
        LogObject    => $LogObject,
        EncodeObject => $EncodeObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ConfigItemObject = Kernel::System::ITSMConfigItem->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
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
    for my $Needed (
        qw(ConfigObject ConfigItemObject LogObject DBObject
        MainObject EncodeObject TimeObject)
        )
    {
        $Self->{$Needed} = $Param{$Needed} || die "Got no $Needed!";
    }

    $Self->{HistoryObject} = Kernel::System::ITSMConfigItem::History->new( %{$Self} );

    return $Self;
}

=item Run()

This method handles the event.

    $DoHistoryObject->Run(
        Event        => 'ConfigItemCreate',
        Comment      => 'new value: 1',
        ConfigItemID => 123,
        UserID       => 1,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID Event UserID Comment)) {
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
    $Self->$Sub(%Param);

    return 1;
}

=item _ConfigItemDelete()

history's event handler for ConfigItemDelete

=cut

sub _ConfigItemDelete {
    my ( $Self, %Param ) = @_;

    # delete history
    $Self->{HistoryObject}->HistoryDelete(
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
    $Self->{HistoryObject}->HistoryAdd(
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
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=head1 VERSION

$Id: DoHistory.pm,v 1.5 2009-08-19 12:55:41 reb Exp $

=cut
