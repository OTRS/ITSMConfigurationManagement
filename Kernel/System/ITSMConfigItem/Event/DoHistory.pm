# --
# Kernel/System/ITSMConfigItem/Event/DoHistory.pm - a event module for default ticket free text settings
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: DoHistory.pm,v 1.2 2009-07-31 12:19:52 reb Exp $
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
$VERSION = qw($Revision: 1.2 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (qw(ConfigObject ConfigItemObject LogObject DBObject MainObject EncodeObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    $Self->{HistoryObject} = Kernel::System::ITSMConfigItem::History->new(
        %{$Self},
    );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(ConfigItemID Event UserID)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    $Param{HistoryType} = $Param{Event};

    my %Dispatcher = (
        NewConfigItem         => \&_NewConfigItem,
        DeleteConfigItem      => \&_DeleteConfigItem,
        LinkAdd               => \&_LinkAdd,
        LinkDelete            => \&_LinkDelete,
        NameChange            => \&_NameChange,
        IncidentStateChange   => \&_InciStateChange,
        DeploymentStateChange => \&_DeplStateChange,
        DefinitionChange      => \&_DefinitionChange,
        VersionAdd            => \&_VersionAdd,
        ValueChange           => \&_ValueChange,
    );

    if ( exists $Dispatcher{ $Param{Event} } ) {
        my $Sub = $Dispatcher{ $Param{Event} };
        $Self->$Sub( %Param );
    }

    return 1;
}

sub _NewConfigItem {
    my ( $Self, %Params ) = @_;

    my $ConfigItemData = $Self->{ConfigItemObject}->ConfigItemGet(
        ConfigItemID => $Params{ConfigItemID},
    );

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $Params{ConfigItemID} . '%%' . $ConfigItemData->{Number},
    );

    return 1;
}

sub _DeleteConfigItem {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryDelete(
        ConfigItemID => $Params{ConfigItemID},
    );

    return 1;
}

sub _LinkAdd {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
    );

    return 1;
}

sub _LinkDelete {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
    );

    return 1;
}

sub _NameChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $Params{NewValue},
    );

    return 1;
}

sub _InciStateChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $Params{NewValue},
    );

    return 1;
}

sub _DeplStateChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $Params{NewValue},
    );

    return 1;
}

sub _ValueChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
    );

    return 1;
}

sub _DefinitionChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $Params{NewValue},
    );

    return 1;
}

sub _VersionAdd {
    my ( $Self, %Params ) = @_;

    my $VersionList = $Self->{ConfigItemObject}->VersionList(
        ConfigItemID => $Params{ConfigItemID},
    );

    my $NewVersion  = $VersionList->[-1];

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
        Comment => $NewVersion,
    );

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=head1 VERSION

$Id: DoHistory.pm,v 1.2 2009-07-31 12:19:52 reb Exp $

=cut