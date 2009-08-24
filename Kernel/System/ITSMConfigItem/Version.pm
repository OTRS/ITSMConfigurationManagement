# --
# Kernel/System/ITSMConfigItem/Version.pm - sub module of ITSMConfigItem.pm with version functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: Version.pm,v 1.13 2009-08-24 09:16:40 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Version;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.13 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::Version - sub module of Kernel::System::ITSMConfigItem

=head1 SYNOPSIS

All version functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item VersionZoomList()

return a config item version list as arrayhash reference

    my $VersionListRef = $ConfigItemObject->VersionZoomList(
        ConfigItemID => 123,
    );

=cut

sub VersionZoomList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID!',
        );
        return;
    }

    # get config item
    my $ConfigItem = $Self->ConfigItemGet(
        ConfigItemID => $Param{ConfigItemID},
    );

    # get version zoom list
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id, name, depl_state_id, inci_state_id, create_time, create_by '
            . 'FROM configitem_version WHERE configitem_id = ? ORDER BY id',
        Bind => [ \$Param{ConfigItemID} ],
    );

    # fetch the result
    my @VersionList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        my %Version;
        $Version{VersionID}   = $Row[0];
        $Version{Name}        = $Row[1];
        $Version{DeplStateID} = $Row[2];
        $Version{InciStateID} = $Row[3];
        $Version{CreateTime}  = $Row[4];
        $Version{CreateBy}    = $Row[5];

        push @VersionList, \%Version;
    }

    for my $Version (@VersionList) {

        # get deployment state functionality
        my $DeplState = $Self->{GeneralCatalogObject}->ItemGet(
            ItemID => $Version->{DeplStateID},
        );

        $Version->{DeplState}     = $DeplState->{Name};
        $Version->{DeplStateType} = $DeplState->{Functionality};

        # get incident state functionality
        my $InciState = $Self->{GeneralCatalogObject}->ItemGet(
            ItemID => $Version->{InciStateID},
        );

        $Version->{InciState}     = $InciState->{Name};
        $Version->{InciStateType} = $InciState->{Functionality};

        # add config item data
        $Version->{ClassID}          = $ConfigItem->{ClassID};
        $Version->{Class}            = $ConfigItem->{Class};
        $Version->{Number}           = $ConfigItem->{Number};
        $Version->{CurDeplStateID}   = $ConfigItem->{CurDeplStateID};
        $Version->{CurDeplState}     = $ConfigItem->{CurDeplState};
        $Version->{CurDeplStateType} = $ConfigItem->{CurDeplStateType};
        $Version->{CurInciStateID}   = $ConfigItem->{CurInciStateID};
        $Version->{CurInciState}     = $ConfigItem->{CurInciState};
        $Version->{CurInciStateType} = $ConfigItem->{CurInciStateType};
    }

    return \@VersionList;
}

=item VersionList()

return a config item version list as array reference

    my $VersionListRef = $ConfigItemObject->VersionList(
        ConfigItemID => 123,
    );

=cut

sub VersionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID!',
        );
        return;
    }

    # get version list
    $Self->{DBObject}->Prepare(
        SQL  => 'SELECT id FROM configitem_version WHERE configitem_id = ? ORDER BY id',
        Bind => [ \$Param{ConfigItemID} ],
    );

    # fetch the result
    my @VersionList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @VersionList, $Row[0];
    }

    return \@VersionList;
}

=item VersionGet()

return a version of a config item as hash reference

Return
    $Version{VersionID}
    $Version{ConfigItemID}
    $Version{Number}
    $Version{ClassID}
    $Version{Class}
    $Version{LastVersionID}
    $Version{Name}
    $Version{DefinitionID}
    $Version{DeplStateID}
    $Version{DeplState}
    $Version{DeplStateType}
    $Version{CurDeplStateID}
    $Version{CurDeplState}
    $Version{CurDeplStateType}
    $Version{InciStateID}
    $Version{InciState}
    $Version{InciStateType}
    $Version{CurInciStateID}
    $Version{CurInciState}
    $Version{CurInciStateType}
    $Version{XMLDefinition}
    $Version{XMLData}
    $Version{CreateTime}
    $Version{CreateBy}

    my $VersionRef = $ConfigItemObject->VersionGet(
        VersionID  => 123,
        XMLDataGet => 1,    # (optional) default 1 (0|1)
    );

    or

    my $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => 123,
    );

=cut

sub VersionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{VersionID} && !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need VersionID or ConfigItemID!',
        );
        return;
    }

    if ( !defined $Param{XMLDataGet} ) {
        $Param{XMLDataGet} = 1;
    }

    if ( $Param{VersionID} ) {

        # check if result is already cached
        return $Self->{Cache}->{VersionGet}->{ $Param{VersionID} }
            if $Self->{Cache}->{VersionGet}->{ $Param{VersionID} };

        # get version
        $Self->{DBObject}->Prepare(
            SQL => 'SELECT id, configitem_id, name, definition_id, '
                . 'depl_state_id, inci_state_id, create_time, create_by '
                . 'FROM configitem_version WHERE id = ?',
            Bind  => [ \$Param{VersionID} ],
            Limit => 1,
        );
    }
    else {

        # get version
        $Self->{DBObject}->Prepare(
            SQL => 'SELECT id, configitem_id, name, definition_id, '
                . 'depl_state_id, inci_state_id, create_time, create_by '
                . 'FROM configitem_version '
                . 'WHERE configitem_id = ? ORDER BY id DESC',
            Bind  => [ \$Param{ConfigItemID} ],
            Limit => 1,
        );
    }

    # fetch the result
    my %Version;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Version{VersionID}    = $Row[0];
        $Version{ConfigItemID} = $Row[1];
        $Version{Name}         = $Row[2];
        $Version{DefinitionID} = $Row[3];
        $Version{DeplStateID}  = $Row[4];
        $Version{InciStateID}  = $Row[5];
        $Version{CreateTime}   = $Row[6];
        $Version{CreateBy}     = $Row[7];
    }

    # check version
    if ( !$Version{VersionID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No such config item version!',
        );
        return;
    }

    # get deployment state functionality
    my $DeplState = $Self->{GeneralCatalogObject}->ItemGet(
        ItemID => $Version{DeplStateID},
    );

    $Version{DeplState}     = $DeplState->{Name};
    $Version{DeplStateType} = $DeplState->{Functionality};

    # get incident state functionality
    my $InciState = $Self->{GeneralCatalogObject}->ItemGet(
        ItemID => $Version{InciStateID},
    );

    $Version{InciState}     = $InciState->{Name};
    $Version{InciStateType} = $InciState->{Functionality};

    # get config item
    my $ConfigItem = $Self->ConfigItemGet(
        ConfigItemID => $Version{ConfigItemID},
        Cache        => 0,
    );

    # check config item data
    if ( !$ConfigItem || ref $ConfigItem ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get config item $Version{ConfigItemID}!",
        );
        return;
    }

    $Version{ClassID}          = $ConfigItem->{ClassID};
    $Version{Class}            = $ConfigItem->{Class};
    $Version{LastVersionID}    = $ConfigItem->{LastVersionID};
    $Version{Number}           = $ConfigItem->{Number};
    $Version{CurDeplStateID}   = $ConfigItem->{CurDeplStateID};
    $Version{CurDeplState}     = $ConfigItem->{CurDeplState};
    $Version{CurDeplStateType} = $ConfigItem->{CurDeplStateType};
    $Version{CurInciStateID}   = $ConfigItem->{CurInciStateID};
    $Version{CurInciState}     = $ConfigItem->{CurInciState};
    $Version{CurInciStateType} = $ConfigItem->{CurInciStateType};

    return \%Version if !$Param{XMLDataGet};

    # get xml definition
    my $Definition = $Self->DefinitionGet(
        DefinitionID => $Version{DefinitionID},
    );
    $Version{XMLDefinition} = $Definition->{DefinitionRef};

    # get xml data
    $Version{XMLData} = $Self->_XMLVersionGet(
        ClassID   => $ConfigItem->{ClassID},
        VersionID => $Version{VersionID},
    );

    # cache the result
    $Self->{Cache}->{VersionGet}->{ $Version{VersionID} } = \%Version;

    return \%Version;
}

=item VersionConfigItemIDGet()

return the config item id of a version

    my $ConfigItemID = $ConfigItemObject->VersionConfigItemIDGet(
        VersionID => 123,
    );

=cut

sub VersionConfigItemIDGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{VersionID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need VersionID!',
        );
        return;
    }

    # check if result is already cached
    return $Self->{Cache}->{VersionConfigItemIDGet}->{ $Param{VersionID} }
        if $Self->{Cache}->{VersionConfigItemIDGet}->{ $Param{VersionID} };

    # get config item id
    $Self->{DBObject}->Prepare(
        SQL   => 'SELECT configitem_id FROM configitem_version WHERE id = ?',
        Bind  => [ \$Param{VersionID} ],
        Limit => 1,
    );

    # fetch the result
    my $ConfigItemID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ConfigItemID = $Row[0];
    }

    # cache the result
    $Self->{Cache}->{VersionConfigItemIDGet}->{ $Param{VersionID} } = $ConfigItemID;

    return $ConfigItemID;
}

=item VersionAdd()

add a new version

    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => 123,
        Name         => 'The Name',
        DefinitionID => 1212,
        DeplStateID  => 8,
        InciStateID  => 4,
        XMLData      => $ArrayHashRef,  # (optional)
        UserID       => 1,
    );

=cut

sub VersionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(ConfigItemID Name DefinitionID DeplStateID InciStateID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    return if !$DeplStateList;
    return if ref $DeplStateList ne 'HASH';

    # check the deployment state id
    if ( !$DeplStateList->{ $Param{DeplStateID} } ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No valid deployment state id given!',
        );
        return;
    }

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    return if !$InciStateList;
    return if ref $InciStateList ne 'HASH';

    # check the incident state id
    if ( !$InciStateList->{ $Param{InciStateID} } ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No valid incident state id given!',
        );
        return;
    }

    # get VersionList
    my $VersionList = $Self->VersionList(
        ConfigItemID => $Param{ConfigItemID},
    );

    my $ConfigItemInfo = {};

    if ( @{$VersionList} ) {

        # get old version info for comparisons with current version
        # this is needed to trigger some events
        $ConfigItemInfo = $Self->VersionGet(
            ConfigItemID => $Param{ConfigItemID},
            XMLDataGet   => 0,
        );
    }
    else {

        # get config item
        $ConfigItemInfo = $Self->ConfigItemGet(
            ConfigItemID => $Param{ConfigItemID},
        );
    }

    return if !$ConfigItemInfo;
    return if ref $ConfigItemInfo ne 'HASH';

    # insert new version
    my $Success = $Self->{DBObject}->Do(
        SQL => 'INSERT INTO configitem_version '
            . '(configitem_id, name, definition_id, '
            . 'depl_state_id, inci_state_id, create_time, create_by) VALUES '
            . '(?, ?, ?, ?, ?, current_timestamp, ?)',
        Bind => [
            \$Param{ConfigItemID},
            \$Param{Name},
            \$Param{DefinitionID},
            \$Param{DeplStateID},
            \$Param{InciStateID},
            \$Param{UserID},
        ],
    );

    return if !$Success;

    # delete cache
    for my $VersionID ( @{$VersionList} ) {
        delete $Self->{Cache}->{VersionGet}->{$VersionID};
    }

    # get id of new version
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id, create_time FROM configitem_version WHERE '
            . 'configitem_id = ? ORDER BY id DESC',
        Bind  => [ \$Param{ConfigItemID} ],
        Limit => 1,
    );

    # fetch the result
    my $VersionID;
    my $CreateTime;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $VersionID  = $Row[0];
        $CreateTime = $Row[1];
    }

    # check version id
    if ( !$VersionID ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the new version id!",
        );
        return;
    }

    # add xml data
    if ( $Param{XMLData} && ref $Param{XMLData} eq 'ARRAY' ) {
        $Self->_XMLVersionAdd(
            ClassID      => $ConfigItemInfo->{ClassID},
            ConfigItemID => $Param{ConfigItemID},
            VersionID    => $VersionID,
            XMLData      => $Param{XMLData},
        );
    }

    # update last_version_id, cur_depl_state_id, cur_inci_state_id, change_time and change_by
    $Self->{DBObject}->Do(
        SQL => 'UPDATE configitem SET last_version_id = ?, '
            . 'cur_depl_state_id = ?, cur_inci_state_id = ?, '
            . 'change_time = ?, change_by = ? '
            . 'WHERE id = ?',
        Bind => [
            \$VersionID,
            \$Param{DeplStateID},
            \$Param{InciStateID},
            \$CreateTime,
            \$Param{UserID},
            \$Param{ConfigItemID},
        ],
    );

    # trigger VersionCreate event
    $Self->ConfigItemEventHandlerPost(
        ConfigItemID => $Param{ConfigItemID},
        Event        => 'VersionCreate',
        UserID       => $Param{UserID},
        Comment      => $VersionID,
    );

    # compare current and old values
    $Self->_CheckValues(%Param);

    # check old and new definition_id
    my $OldDefinitionID = $ConfigItemInfo->{DefinitionID} || '';
    my $NewDefinitionID = $Param{DefinitionID}            || '';

    if ( $OldDefinitionID ne $NewDefinitionID ) {
        $Self->ConfigItemEventHandlerPost(
            ConfigItemID => $Param{ConfigItemID},
            Event        => 'DefinitionUpdate',
            UserID       => $Param{UserID},
            Comment      => $NewDefinitionID,
        );
    }

    # check old and new definition_id
    my $OldName = $ConfigItemInfo->{Name} || '';
    my $NewName = $Param{Name}            || '';

    if ( $OldName ne $NewName ) {
        $Self->ConfigItemEventHandlerPost(
            ConfigItemID => $Param{ConfigItemID},
            Event        => 'NameUpdate',
            UserID       => $Param{UserID},
            Comment      => $NewName,
        );
    }

    # if incistate is updated
    my $LastInciStateID = $ConfigItemInfo->{InciStateID} || '';
    my $CurInciStateID  = $Param{InciStateID}            || '';

    if ( $LastInciStateID ne $CurInciStateID ) {
        $Self->ConfigItemEventHandlerPost(
            ConfigItemID => $Param{ConfigItemID},
            Event        => 'IncidentStateUpdate',
            UserID       => $Param{UserID},
            Comment      => $CurInciStateID . '%%' . $LastInciStateID
        );
    }

    # if depl_state is updated
    my $LastDeplStateID = $ConfigItemInfo->{DeplStateID} || '';
    my $CurDeplStateID  = $Param{DeplStateID}            || '';

    if ( $LastDeplStateID ne $CurDeplStateID ) {
        $Self->ConfigItemEventHandlerPost(
            ConfigItemID => $Param{ConfigItemID},
            Event        => 'DeploymentStateUpdate',
            UserID       => $Param{UserID},
            Comment      => $CurDeplStateID . '%%' . $LastDeplStateID,
        );
    }

    # recalculate the current incident state of alle linked config items
    $Self->CurInciStateRecalc(
        ConfigItemID => $Param{ConfigItemID},
    );

    return $VersionID;
}

=item VersionDelete()

delete an existing version or versions

    my $True = $ConfigItemObject->VersionDelete(
        VersionID => 123,
        UserID    => 1,
    );

    or

    my $True = $ConfigItemObject->VersionDelete(
        ConfigItemID => 321,
        UserID       => 1,
    );

=cut

sub VersionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }
    if ( !$Param{VersionID} && !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need VersionID or ConfigItemID!',
        );
        return;
    }

    my $VersionList = [];
    if ( $Param{VersionID} ) {

        push @{$VersionList}, $Param{VersionID};
    }
    else {

        # get version list
        $VersionList = $Self->VersionList(
            ConfigItemID => $Param{ConfigItemID},
        );
    }

    return 1 if !scalar @{$VersionList};

    # delete the xml version data
    for my $VersionID ( @{$VersionList} ) {
        $Self->_XMLVersionDelete(
            VersionID => $VersionID,
            UserID    => $Param{UserID},
        );
    }

    # quote
    for my $VersionID ( @{$VersionList} ) {
        $VersionID = $Self->{DBObject}->Quote( $VersionID, 'Integer' );
    }

    # create the version id string
    my $VersionIDString = join ',', @{$VersionList};

    # get config item id for version (needed for event handling)
    my $ConfigItemID = $Param{ConfigItemID};
    if ( $Param{VersionID} ) {
        $ConfigItemID = $Self->VersionConfigItemIDGet(
            VersionID => $Param{VersionID},
        );
    }

    # delete versions
    my $Success = $Self->{DBObject}->Do(
        SQL => "DELETE FROM configitem_version WHERE id IN ( $VersionIDString )",
    );

    # trigger VersionDelete event when deletion was successful
    if ($Success) {
        for my $VersionID ( @{$VersionList} ) {
            $Self->ConfigItemEventHandlerPost(
                ConfigItemID => $ConfigItemID,
                Event        => 'VersionDelete',
                UserID       => $Param{UserID},
                Comment      => $VersionID,
            );

            # delete cache
            delete $Self->{Cache}->{VersionGet}->{$VersionID};
            delete $Self->{Cache}->{VersionConfigItemIDGet}->{$VersionID};
        }
    }

    return $Success;
}

=item VersionSearch()

return a config item list as an array reference

    my $ConfigItemIDs = $ConfigItemObject->VersionSearch(
        Name         => 'The Name',      # (optional)
        ClassIDs     => [ 9, 8, 7, 6 ],  # (optional)
        DeplStateIDs => [ 321, 123 ],    # (optional)
        InciStateIDs => [ 321, 123 ],    # (optional)

        PreviousVersionSearch => 1,  # (optional) default 0 (0|1)

        OrderBy => 'Name',  # (optional) default ConfigItemID
        # (ConfigItemID, Name, ClassID, DeplStateID, InciStateID)

        Limit          => 122,  # (optional)
        UsingWildcards => 0,    # (optional) default 1
    );

=cut

sub VersionSearch {
    my ( $Self, %Param ) = @_;

    # set default values
    if ( !defined $Param{UsingWildcards} ) {
        $Param{UsingWildcards} = 1;
    }
    $Param{OrderBy} ||= 'id';

    # add name to sql where array
    my @SQLWhere;
    if ( $Param{Name} ) {

        # duplicate the name
        my $Name = $Param{Name};

        # quote
        $Name = $Self->{DBObject}->Quote($Name);

        if ( $Param{UsingWildcards} ) {

            # prepare like string
            $Self->_PrepareLikeString( \$Name );

            push @SQLWhere, "LOWER(vr.name) LIKE LOWER('$Name')";
        }
        else {
            push @SQLWhere, "LOWER(vr.name) = LOWER('$Name')";
        }
    }

    # set array params
    my %ArrayParams = (
        ClassIDs     => 'ci.id = vr.configitem_id AND ci.class_id',
        DeplStateIDs => 'vr.depl_state_id',
        InciStateIDs => 'vr.inci_state_id',
    );

    ARRAYPARAM:
    for my $ArrayParam ( keys %ArrayParams ) {

        next ARRAYPARAM if !$Param{$ArrayParam};

        if ( ref $Param{$ArrayParam} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$ArrayParam must be an array reference!",
            );
            return;
        }

        next ARRAYPARAM if !@{ $Param{$ArrayParam} };

        # quote
        for my $OneParam ( @{ $Param{$ArrayParam} } ) {
            $OneParam = $Self->{DBObject}->Quote($OneParam);
        }

        # create string
        my $InString = join q{, }, @{ $Param{$ArrayParam} };

        push @SQLWhere, "$ArrayParams{ $ArrayParam } IN ($InString)";
    }

    # add previous version param
    if ( !$Param{PreviousVersionSearch} ) {
        push @SQLWhere, 'ci.last_version_id = vr.id';
    }

    # create where string
    my $WhereString = @SQLWhere ? ' WHERE ' . join q{ AND }, @SQLWhere : '';

    # define order table
    my %OrderByTable = (
        ConfigItemID => 'vr.configitem_id',
        Name         => 'vr.name',
        ClassID      => 'ci.class_id',
        DeplStateID  => 'vr.depl_state_id',
        InciStateID  => 'vr.inci_state_id',
    );

    # set order by
    my $OrderBy = $OrderByTable{ $Param{OrderBy} } || $OrderByTable{ConfigItemID};

    # set limit
    if ( $Param{Limit} ) {
        $Param{Limit} = $Self->{DBObject}->Quote( $Param{Limit}, 'Integer' );
    }

    # ask the database
    $Self->{DBObject}->Prepare(
        SQL => "SELECT DISTINCT(vr.configitem_id) "
            . "FROM configitem ci, configitem_version vr "
            . "$WhereString ORDER BY $OrderBy ASC",
        Limit => $Param{Limit},
    );

    # fetch the result
    my @ConfigItemList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemList, $Row[0];
    }

    return \@ConfigItemList;
}

=item _CheckValues()

This method calles for each change value of the config item the event handler.
Please note that this only handles values inside the XML structure, not general
attributes like "CurInciState".

    $ConfigItemObject->_CheckValues(
        ConfigItemID => 123,
    );

=cut

sub _CheckValues {
    my ( $Self, %Params ) = @_;

    # get a list with all versionnumbers that exist for the
    # given config item
    my $VersionList = $Self->VersionList(
        ConfigItemID => $Params{ConfigItemID},
    );

    # do the comparison only when the item is not a new one
    if ( scalar @{$VersionList} > 1 ) {

        # find all changed values
        my %ChangedValues = $Self->_FindChangedValues(
            %Params,
            NewVersionID => $VersionList->[-1],
            OldVersionID => $VersionList->[-2],
        );

        # trigger ValueUpdate event for each changed value
        for my $Key ( keys %ChangedValues ) {
            $Self->ConfigItemEventHandlerPost(
                ConfigItemID => $Params{ConfigItemID},
                Event        => 'ValueUpdate',
                UserID       => $Params{UserID},
                NewValue     => $VersionList->[-1],
                Comment      => $Key . '%%' . $ChangedValues{$Key},
            );
        }
    }

    return 1;
}

=item _FindChangedValues()

C<_FindChangedValues> checks for each found TagKey, if its value changed in the
current version. If so, the TagKey and the new value is stored in a hash. This
hash is returned...

    $ConfigItemObject->_FindChangedValues(
        ConfigItemID => 123,
        NewVersionID => 12345,
        OldVersionID => 12344,
    );

=cut

sub _FindChangedValues {
    my ( $Self, %Params ) = @_;

    # get the current version
    my $CurrentVersion = $Self->VersionGet(
        VersionID => $Params{NewVersionID},
    );

    # get old version
    my $OldVersion = $Self->VersionGet(
        VersionID => $Params{OldVersionID},
    );

    my $CurrentXMLData = $CurrentVersion->{XMLData};
    my $OldXMLData     = $OldVersion->{XMLData};

    # get all tagkeys in xml data
    my @TagKeysNew = $Self->_GrabTagKeys( Data => $CurrentXMLData );
    my @TagKeysOld = $Self->_GrabTagKeys( Data => $OldXMLData );

    # save all existing tag keys in one hash
    my %TagKeys;
    @TagKeys{ @TagKeysNew, @TagKeysOld } = ( @TagKeysNew, @TagKeysOld );

    # do the check
    my %Changes;
    KEY:
    for my $Key ( keys %TagKeys ) {
        my $NewValue = eval '$CurrentXMLData->' . $Key . '->{Content}' || '';
        my $OldValue = eval '$OldXMLData ->' . $Key . '->{Content}'    || '';

        next KEY if $NewValue eq $OldValue;

        $Changes{$Key} = join '%%', $OldValue, $NewValue;
    }

    return %Changes;
}

=item _GrabTagKeys()

This method checks a perl datastructure for the Hash key 'TagKey' and returns a
list of all TagKeys.

    my @List = $ConfigItemObject->_GrabTagKeys(
        $XMLHashReferenz,
    );

=cut

sub _GrabTagKeys {
    my ( $Self, %Params ) = @_;

    return () if !$Params{Data};

    my @TagKeys;
    if ( ref $Params{Data} eq 'ARRAY' ) {

        ELEM:
        for my $Elem ( @{ $Params{Data} } ) {

            next ELEM if !$Elem;
            next ELEM if !ref $Elem;

            push @TagKeys, $Self->_GrabTagKeys( Data => $Elem );
        }
    }

    elsif ( ref $Params{Data} eq 'HASH' ) {

        for my $Key ( keys %{ $Params{Data} } ) {

            if ( $Key eq 'TagKey' ) {
                push @TagKeys, $Params{Data}->{$Key};
            }
            elsif ( ref $Params{Data}->{$Key} ) {
                push @TagKeys, $Self->_GrabTagKeys( Data => $Params{Data}->{$Key} );
            }
        }
    }

    return @TagKeys;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.13 $ $Date: 2009-08-24 09:16:40 $

=cut
