# --
# Kernel/System/ITSMConfigItem/Event/DoHistory.pm - a event module for default ticket free text settings
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: DoHistory.pm,v 1.1 2009-07-30 11:44:24 reb Exp $
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
$VERSION = qw($Revision: 1.1 $) [1];

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
    );

    return 1;
}

sub _InciStateChange {
    my ( $Self, %Params ) = @_;

    $Self->{HistoryObject}->HistoryAdd(
        %Params,
    );

    return 1;
}

sub _DeplStateChange {
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

    if ( scalar @{$VersionList} > 1 ) {
        my %ChangedValues = $Self->_FindChangedValues(
            %Params,
            NewVersionID => $VersionList->[-1],
            OldVersionID => $VersionList->[-2],
        );

        for my $Key ( keys %ChangedValues ) {
            $Self->{HistoryObject}->HistoryAdd(
                %Params,
                HistoryType => 'ValueChange',
                Comment     => $Key . '%%' . $ChangedValues{$Key},
            );
        }
    }

    return 1;
}

sub _FindChangedValues {
    my ( $Self, %Params ) = @_;

    my $CurrentVersion = $Self->{ConfigItemObject}->VersionGet(
        VersionID => $Params{NewVersionID},
    );
    my $OldVersion     = $Self->{ConfigItemObject}->VersionGet(
        VersionID => $Params{OldVersionID},
    );

    my $CurrentXMLData = $CurrentVersion->{XMLData};
    my $OldXMLData     = $OldVersion->{XMLData};

    my @TagKeysNew     = $Self->_GrabTagKeys( $CurrentXMLData );
    my @TagKeysOld     = $Self->_GrabTagKeys( $OldXMLData );

    # save all existing tag keys in one hash
    my %TagKeys;
    @TagKeys{ @TagKeysNew, @TagKeysOld } = ( @TagKeysNew, @TagKeysOld );

    my %Changes;

    # do the check
    for my $Key ( keys %TagKeys ) {
        my $NewValue = eval '$CurrentXMLData->' . $Key . '->{Content}';
        my $OldValue = eval '$OldXMLData ->' . $Key . '->{Content}';

        next if $NewValue eq $OldValue;

        $Changes{$Key} = sprintf "%s%%%%%s", $OldValue, $NewValue;
    }

    return %Changes;
}

sub _GrabTagKeys {
    my ( $Self, $Ref ) = @_;

    my @TagKeys;
    my $Type = ref $Ref;

    if ( $Type && $Type eq 'ARRAY' ) {
        for my $Elem ( @{$Ref} ) {
            next if !$Elem;
            my $ElemType = ref $Elem;
            push @TagKeys, $Self->_GrabTagKeys( $Elem ) if $ElemType;
        }
    }
    elsif ( $Type && $Type eq 'HASH' ) {
        for my $Key ( keys %{$Ref} ) {
            if ( $Key eq 'TagKey' ) {
                push @TagKeys, $Ref->{$Key};
            }
            elsif ( ref $Ref->{$Key} ) {
                push @TagKeys, $Self->_GrabTagKeys( $Ref->{$Key} );
            }
        }
    }

    return @TagKeys;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=head1 VERSION

$Id: DoHistory.pm,v 1.1 2009-07-30 11:44:24 reb Exp $

=cut