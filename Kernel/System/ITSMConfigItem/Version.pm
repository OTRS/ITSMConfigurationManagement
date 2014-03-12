# --
# Kernel/System/ITSMConfigItem/Version.pm - sub module of ITSMConfigItem.pm with version functions
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Version;

use strict;
use warnings;
use Kernel::System::VariableCheck qw(:all);

use Storable;

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

returns a version of a config item as hash reference.
The returned hash contains following attributes.

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

When the date from the XML storage is not needed then fetching the XML data can be
explicitly turned off by passing XMLDataGet => 0.

    my $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => 123,
        XMLDataGet   => 0,
    );

The result of this call is not cached, as the next call to VersionGet() might need
the XML data. On the other hand, when the cache is already filled, the cached
version hash is returned with the XML data. So you get more than you asked for, which isn't
a bad thing.

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
        if ( $Self->{Cache}->{VersionGet}->{ $Param{VersionID} } ) {

            # return a clone of the cache, as the caller should not be able do change the cache
            return Storable::dclone( $Self->{Cache}->{VersionGet}->{ $Param{VersionID} } );
        }

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

    # do not cache the version without the XML data,
    # the next caller might need the XML data
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

    # return a clone of the cache, as the caller should not be able to change the cache
    return Storable::dclone( $Self->{Cache}->{VersionGet}->{ $Version{VersionID} } );
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

    # check, whether the feature to check for a unique name is enabled
    if ( $Self->{ConfigObject}->Get('UniqueCIName::EnableUniquenessCheck') ) {

        my $NameDuplicates = $Self->UniqueNameCheck(
            ConfigItemID => $Param{ConfigItemID},
            ClassID      => $ConfigItemInfo->{ClassID},
            Name         => $Param{Name},
        );

        # stop processing if the name is not unique
        if ( IsArrayRefWithData($NameDuplicates) ) {

            # build a string of all duplicate IDs
            my $Duplicates = join ', ', @{$NameDuplicates};

            # write an error log message containing all the duplicate IDs
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "The name $Param{Name} is already in use (ConfigItemIDs: $Duplicates)!",
            );
            return;
        }
    }

    my $Events = $Self->_GetEvents(
        Param          => \%Param,
        ConfigItemInfo => $ConfigItemInfo,
    );

    my $ReturnVersionID = scalar @{$VersionList} ? $VersionList->[-1] : 0;
    return $ReturnVersionID if !( $Events && keys %{$Events} );

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
    $Self->EventHandler(
        Event => 'VersionCreate',
        Data  => {
            ConfigItemID => $Param{ConfigItemID},
            Comment      => $VersionID,
        },
        UserID => $Param{UserID},
    );

    # compare current and old values
    if ( $Events->{ValueUpdate} ) {
        $Self->_EventHandlerForChangedXMLValues(
            ConfigItemID => $Param{ConfigItemID},
            UpdateValues => $Events->{ValueUpdate},
            UserID       => $Param{UserID},
        );
    }

    # trigger definition update event
    if ( $Events->{DefinitionUpdate} ) {
        $Self->EventHandler(
            Event => 'DefinitionUpdate',
            Data  => {
                ConfigItemID => $Param{ConfigItemID},
                Comment      => $Events->{DefinitionUpdate},
            },
            UserID => $Param{UserID},
        );
    }

    # check old and new name
    if ( $Events->{NameUpdate} ) {
        $Self->EventHandler(
            Event => 'NameUpdate',
            Data  => {
                ConfigItemID => $Param{ConfigItemID},
                Comment      => $Events->{NameUpdate},
            },
            UserID => $Param{UserID},
        );
    }

    # trigger incident state update event
    if ( $Events->{IncidentStateUpdate} ) {
        $Self->EventHandler(
            Event => 'IncidentStateUpdate',
            Data  => {
                ConfigItemID => $Param{ConfigItemID},
                Comment      => $Events->{IncidentStateUpdate},
            },
            UserID => $Param{UserID},
        );
    }

    # trigger deployment state update event
    if ( $Events->{DeploymentStateUpdate} ) {
        $Self->EventHandler(
            Event => 'DeploymentStateUpdate',
            Data  => {
                ConfigItemID => $Param{ConfigItemID},
                Comment      => $Events->{DeploymentStateUpdate},
            },
            UserID => $Param{UserID},
        );
    }

    # recalculate the current incident state of all linked config items
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

    my $Success;
    for my $VersionID ( @{$VersionList} ) {

        # get config item id for version (needed for event handling)
        my $ConfigItemID = $Param{ConfigItemID};
        if ( $Param{VersionID} ) {
            $ConfigItemID = $Self->VersionConfigItemIDGet(
                VersionID => $Param{VersionID},
            );
        }

        # delete the xml version data
        $Self->_XMLVersionDelete(
            VersionID => $VersionID,
            UserID    => $Param{UserID},
        );

        # delete version
        $Success = $Self->{DBObject}->Do(
            SQL  => "DELETE FROM configitem_version WHERE id = ?",
            Bind => [ \$VersionID ],
        );

        # trigger VersionDelete event when deletion was successful
        if ($Success) {

            $Self->EventHandler(
                Event => 'VersionDelete',
                Data  => {
                    ConfigItemID => $ConfigItemID,
                    Comment      => $VersionID,
                },
                UserID => $Param{UserID},
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

        OrderBy => [ 'ConfigItemID', 'Number' ],                  # (optional)
        # default: [ 'ConfigItemID' ]
        # (ConfigItemID, Name, Number, ClassID, DeplStateID, InciStateID
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        # Additional information for OrderBy:
        # The OrderByDirection can be specified for each OrderBy attribute.
        # The pairing is made by the array indices.

        OrderByDirection => [ 'Up', 'Down' ],                    # (optional)
        # default: [ 'Up' ]
        # (Down | Up)

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

    # verify that all passed array parameters contain an arrayref
    ARGUMENT:
    for my $Argument (
        qw(
        OrderBy
        OrderByDirection
        )
        )
    {
        if ( !defined $Param{$Argument} ) {
            $Param{$Argument} ||= [];

            next ARGUMENT;
        }

        if ( ref $Param{$Argument} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$Argument must be an array reference!",
            );
            return;
        }
    }

    # set default order and order direction
    if ( !@{ $Param{OrderBy} } ) {
        $Param{OrderBy} = ['ConfigItemID'];
    }
    if ( !@{ $Param{OrderByDirection} } ) {
        $Param{OrderByDirection} = ['Up'];
    }

    # define order table
    my %OrderByTable = (
        ConfigItemID => 'vr.configitem_id',
        Name         => 'vr.name',
        Number       => 'ci.configitem_number',
        ClassID      => 'ci.class_id',
        DeplStateID  => 'vr.depl_state_id',
        InciStateID  => 'vr.inci_state_id',
        CreateTime   => 'ci.create_time',
        CreateBy     => 'ci.create_by',

        # the change time of the CI is the same as the create time of the version!
        ChangeTime => 'vr.create_time',

        ChangeBy => 'ci.change_by',
    );

    # check if OrderBy contains only unique valid values
    my %OrderBySeen;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        if ( !$OrderBy || !$OrderByTable{$OrderBy} || $OrderBySeen{$OrderBy} ) {

            # found an error
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "OrderBy contains invalid value '$OrderBy' "
                    . 'or the value is used more than once!',
            );
            return;
        }

        # remember the value to check if it appears more than once
        $OrderBySeen{$OrderBy} = 1;
    }

    # check if OrderByDirection array contains only 'Up' or 'Down'
    DIRECTION:
    for my $Direction ( @{ $Param{OrderByDirection} } ) {

        # only 'Up' or 'Down' allowed
        next DIRECTION if $Direction eq 'Up';
        next DIRECTION if $Direction eq 'Down';

        # found an error
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "OrderByDirection can only contain 'Up' or 'Down'!",
        );
        return;
    }

    # assemble the ORDER BY clause
    my @SQLOrderBy;
    my $Count = 0;
    my @OrderBySelectColumns;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        # set the default order direction
        my $Direction = 'DESC';

        # add the given order direction
        if ( $Param{OrderByDirection}->[$Count] ) {
            if ( $Param{OrderByDirection}->[$Count] eq 'Up' ) {
                $Direction = 'ASC';
            }
            elsif ( $Param{OrderByDirection}->[$Count] eq 'Down' ) {
                $Direction = 'DESC';
            }
        }

        # add SQL
        push @SQLOrderBy,           "$OrderByTable{$OrderBy} $Direction";
        push @OrderBySelectColumns, $OrderByTable{$OrderBy};

    }
    continue {
        $Count++;
    }

    # get like escape string needed for some databases (e.g. oracle)
    my $LikeEscapeString = $Self->{DBObject}->GetDatabaseFunction('LikeEscapeString');

    # add name to sql where array
    my @SQLWhere;
    if ( defined $Param{Name} && defined $Param{Name} ne '' ) {

        # duplicate the name
        my $Name = $Param{Name};

        # quote
        $Name = $Self->{DBObject}->Quote($Name);

        if ( $Param{UsingWildcards} ) {

            # prepare like string
            $Self->_PrepareLikeString( \$Name );

            push @SQLWhere, "LOWER(vr.name) LIKE LOWER('$Name') $LikeEscapeString";
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
    for my $ArrayParam ( sort keys %ArrayParams ) {

        next ARRAYPARAM if !$Param{$ArrayParam};

        if ( ref $Param{$ArrayParam} ne 'ARRAY' ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "$ArrayParam must be an array reference!",
            );
            return;
        }

        next ARRAYPARAM if !@{ $Param{$ArrayParam} };

        # quote as integer
        for my $OneParam ( @{ $Param{$ArrayParam} } ) {
            $OneParam = $Self->{DBObject}->Quote( $OneParam, 'Integer' );
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

    # set limit, quote as integer
    if ( $Param{Limit} ) {
        $Param{Limit} = $Self->{DBObject}->Quote( $Param{Limit}, 'Integer' );
    }

    # add the order by columns also to the selected columns
    my $OrderBySelectString = '';
    if (@OrderBySelectColumns) {
        $OrderBySelectString = join ', ', @OrderBySelectColumns;
        $OrderBySelectString = ', ' . $OrderBySelectString;
    }

    # build SQL
    my $SQL = "SELECT DISTINCT vr.configitem_id $OrderBySelectString "
        . 'FROM configitem ci, configitem_version vr '
        . $WhereString;

    # add the ORDER BY clause
    if (@SQLOrderBy) {
        $SQL .= ' ORDER BY ';
        $SQL .= join ', ', @SQLOrderBy;
        $SQL .= ' ';
    }

    # ask the database
    $Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Limit => $Param{Limit},
    );

    # fetch the result
    my @ConfigItemList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemList, $Row[0];
    }

    return \@ConfigItemList;
}

=begin Internal:

=item _GetEvents()

This method checks what values were changed and what events have to be triggered.
It returns a hash reference with all event names as keys that should be triggered.

    my $Events = $CIObject->_GetEvents(
        Param => {
            DeplStateID => 123,
        },
        ConfigItemInfo => {
            DeplStateID => 234,
        },
    );

    print keys %{$Events}; # prints "DeploymentStateUpdate"

=cut

sub _GetEvents {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemInfo Param)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my $Events = {};

    # check old and new name
    my $OldName = $Param{ConfigItemInfo}->{Name} || '';
    my $NewName = $Param{Param}->{Name}          || '';

    if ( $OldName ne $NewName ) {
        $Events->{NameUpdate} = $NewName . '%%' . $OldName;
    }

    # if depl_state is updated
    my $LastDeplStateID = $Param{ConfigItemInfo}->{DeplStateID} || '';
    my $CurDeplStateID  = $Param{Param}->{DeplStateID}          || '';

    if ( $LastDeplStateID ne $CurDeplStateID ) {
        $Events->{DeploymentStateUpdate} = $CurDeplStateID . '%%' . $LastDeplStateID;
    }

    # if incistate is updated
    my $LastInciStateID = $Param{ConfigItemInfo}->{InciStateID} || '';
    my $CurInciStateID  = $Param{Param}->{InciStateID}          || '';

    if ( $LastInciStateID ne $CurInciStateID ) {
        $Events->{IncidentStateUpdate} = $CurInciStateID . '%%' . $LastInciStateID;
    }

    # check old and new definition_id
    my $OldDefinitionID = $Param{ConfigItemInfo}->{DefinitionID} || '';
    my $NewDefinitionID = $Param{Param}->{DefinitionID}          || '';

    if ( $OldDefinitionID ne $NewDefinitionID ) {
        $Events->{DefinitionUpdate} = $NewDefinitionID;
    }

    # check for changes in XML data
    if ( $Param{Param}->{XMLData} && ref $Param{Param}->{XMLData} eq 'ARRAY' ) {
        my %UpdateValues = $Self->_FindChangedXMLValues(
            ConfigItemID => $Param{Param}->{ConfigItemID},
            NewXMLData   => $Param{Param}->{XMLData},
        );
        if ( keys %UpdateValues ) {
            $Events->{ValueUpdate} = \%UpdateValues;
        }
    }

    return $Events;
}

=item _EventHandlerForChangedXMLValues()

This method calls the event handler for each changed value of the config item.
The changed values are passed in C<UpdateValues> as an hashref with tagkeys as keys.
Please note that this only handles values inside the XML structure, not general
attributes like C<CurInciState>.

    my $Success = $ConfigItemObject->_EventHandlerForChangedXMLValues(
        ConfigItemID => 123,
        UpdateValues =>
            {
               "[1]{'Version'}[1]{'Vendor'}[1]" => 'OldVendor%%NewVendor',
               "[1]{'Version'}[1]{'Type'}[1]"   => '127%%128',
            }
        UserID       => 1,
    );

=cut

sub _EventHandlerForChangedXMLValues {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(UpdateValues ConfigItemID UserID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # trigger ValueUpdate event for each changed value
    for my $Key ( sort keys %{ $Param{UpdateValues} } ) {
        $Self->EventHandler(
            Event => 'ValueUpdate',
            Data  => {
                ConfigItemID => $Param{ConfigItemID},
                Comment      => $Key . '%%' . $Param{UpdateValues}->{$Key},
            },
            UserID => $Param{UserID},
        );
    }

    return 1;
}

=item _FindChangedXMLValues()

compares the new xml data C<NewXMLData> with the xml data of the latest version
of the config item C<ConfigItemID>. Note that the new XML data does not contain tag keys.
All values of the two data sets are compared.
When a changed value is encountered, the tag key and the old and the new value are stored in a hash.
The hash with the updata values is returned.

    my %UpdateValues = $ConfigItemObject->_FindChangedXMLValues(
        ConfigItemID => 123,
        NewXMLData   =>
            [
                undef,
                {
                    'Version' =>
                        [
                            undef,
                            {
                                'Owner' =>
                                    [
                                       undef,
                                       {
                                           'Content' => ''
                                       },
                                    ],
                            },
                        ],
                },
            ],
    );

The returned hash looks like:

    %UpdateValues = (
       "[1]{'Version'}[1]{'Vendor'}[1]" => 'OldVendor%%NewVendor',
       "[1]{'Version'}[1]{'Type'}[1]"   => '127%%128',
    );

The key is a tag key. The values contains the old and the new XML value.

=cut

sub _FindChangedXMLValues {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Needed (qw(ConfigItemID NewXMLData)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get a list with all versionnumbers that exist for the
    # given config item
    my $VersionList = $Self->VersionList(
        ConfigItemID => $Param{ConfigItemID},
    );

    # skip the check if this is the first version of the item
    return if !@{$VersionList};

    # get old version
    my $OldVersion = $Self->VersionGet(
        VersionID => $VersionList->[-1],
    );

    # the short names for new and old xml data are used in the 'eval' below
    my $NewXMLData = $Param{NewXMLData};
    my $OldXMLData = $OldVersion->{XMLData};

    # get all tagkeys in new and old XML data
    # use a side effect of XMLHash2D(), which adds the tag keys to the passed in data structure
    $Self->{XMLObject}->XMLHash2D( XMLHash => $NewXMLData );
    my @TagKeys = $Self->_GrabTagKeys( Data => [ $OldXMLData, $NewXMLData ] );

    # get an unique list of all tag keys
    my %UniqueTagKeys = map { $_ => 1 } @TagKeys;

    # do the check
    my %UpdateValues;
    for my $TagKey ( sort keys %UniqueTagKeys ) {
        my $NewContent = eval '$NewXMLData->' . $TagKey . '->{Content}' || '';    ## no critic
        my $OldContent = eval '$OldXMLData->' . $TagKey . '->{Content}' || '';    ## no critic

        if ( $NewContent ne $OldContent ) {

            # a change was found
            $UpdateValues{$TagKey} = join '%%', $OldContent, $NewContent;
        }
    }

    return %UpdateValues;
}

=item _GrabTagKeys()

recursively scans a perl datastructure for the hash key 'TagKey' and returns a
list of all the values for that key.

    my @TagKeys = $ConfigItemObject->_GrabTagKeys(
        Data => $XMLHashReferenz,
    );

=cut

sub _GrabTagKeys {
    my ( $Self, %Param ) = @_;

    return () if !$Param{Data};

    my @TagKeys;
    if ( ref $Param{Data} eq 'ARRAY' ) {

        ELEM:
        for my $Elem ( @{ $Param{Data} } ) {

            next ELEM if !$Elem;
            next ELEM if !ref $Elem;

            push @TagKeys, $Self->_GrabTagKeys( Data => $Elem );
        }
    }
    elsif ( ref $Param{Data} eq 'HASH' ) {

        for my $Key ( sort keys %{ $Param{Data} } ) {

            if ( $Key eq 'TagKey' ) {
                push @TagKeys, $Param{Data}->{$Key};
            }
            elsif ( ref $Param{Data}->{$Key} ) {
                push @TagKeys, $Self->_GrabTagKeys( Data => $Param{Data}->{$Key} );
            }
        }
    }

    return @TagKeys;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
