# --
# Kernel/System/ITSMConfigItem.pm - all config item function
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItem.pm,v 1.15 2009-08-19 22:31:31 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem::Definition;
use Kernel::System::ITSMConfigItem::Number;
use Kernel::System::ITSMConfigItem::Version;
use Kernel::System::ITSMConfigItem::XML;
use Kernel::System::LinkObject;
use Kernel::System::Time;
use Kernel::System::XML;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.15 $) [1];

@ISA = (
    'Kernel::System::ITSMConfigItem::Definition',
    'Kernel::System::ITSMConfigItem::Number',
    'Kernel::System::ITSMConfigItem::Version',
    'Kernel::System::ITSMConfigItem::XML',
);

=head1 NAME

Kernel::System::ITSMConfigItem - config item lib

=head1 SYNOPSIS

All config item functions.

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
    use Kernel::System::ITSMConfigItem;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
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
    my $ConfigItemObject = Kernel::System::ITSMConfigItem->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject EncodeObject LogObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    $Self->{TimeObject}           = Kernel::System::Time->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{LinkObject}           = Kernel::System::LinkObject->new( %{$Self} );
    $Self->{XMLObject}            = Kernel::System::XML->new( %{$Self} );

    return $Self;
}

=item ConfigItemCount()

count all records of a config item class

    my $Count = $ConfigItemObject->ConfigItemCount(
        ClassID => 123,
    );

=cut

sub ConfigItemCount {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ClassID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ClassID!',
        );
        return;
    }

    # get state list
    my $StateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
        Functionality => [ 'preproductive', 'productive' ],
    );

    return 0 if !%{$StateList};

    # create state string
    my $DeplStateString = join q{, }, keys %{$StateList};

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => "SELECT COUNT(id) FROM configitem WHERE class_id = ? AND "
            . "cur_depl_state_id IN ( $DeplStateString )",
        Bind  => [ \$Param{ClassID} ],
        Limit => 1,
    );

    # fetch the result
    my $Count = 0;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $Count = $Row[0];
    }

    return $Count;
}

=item ConfigItemResultList()

return a config item list as array hash reference

    my $ConfigItemListRef = $ConfigItemObject->ConfigItemResultList(
        ClassID => 123,
        Start   => 100,
        Limit   => 50,
    );

=cut

sub ConfigItemResultList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ClassID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ClassID!',
        );
        return;
    }

    # quote
    if ( $Param{Start} ) {
        $Param{Start} = $Self->{DBObject}->Quote( $Param{Start}, 'Integer' );
    }
    if ( $Param{Limit} ) {
        $Param{Limit} = $Self->{DBObject}->Quote( $Param{Limit}, 'Integer' );
    }

    # get state list
    my $StateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
        Functionality => [ 'preproductive', 'productive' ],
    );

    # create state string
    my $DeplStateString = join q{, }, keys %{$StateList};

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => "SELECT id FROM configitem "
            . "WHERE class_id = ? AND cur_depl_state_id IN ( $DeplStateString ) "
            . "ORDER BY change_time DESC",
        Bind => [ \$Param{ClassID} ],
        %Param,
    );

    # fetch the result
    my @ConfigItemIDList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemIDList, $Row[0];
    }

    # get last versions data
    my @ConfigItemList;
    for my $ConfigItemID (@ConfigItemIDList) {

        # get version data
        my $LastVersion = $Self->VersionGet(
            ConfigItemID => $ConfigItemID,
            XMLDataGet   => 0,
        );

        push @ConfigItemList, $LastVersion;
    }

    return \@ConfigItemList;
}

=item ConfigItemGet()

return a config item as hash reference

Return
    $ConfigItem{ConfigItemID}
    $ConfigItem{Number}
    $ConfigItem{ClassID}
    $ConfigItem{Class}
    $ConfigItem{LastVersionID}
    $ConfigItem{CurDeplStateID}
    $ConfigItem{CurDeplState}
    $ConfigItem{CurDeplStateType}
    $ConfigItem{CurInciStateID}
    $ConfigItem{CurInciState}
    $ConfigItem{CurInciStateType}
    $ConfigItem{CreateTime}
    $ConfigItem{CreateBy}
    $ConfigItem{ChangeTime}
    $ConfigItem{ChangeBy}

    my $ConfigItemRef = $ConfigItemObject->ConfigItemGet(
        ConfigItemID => 123,
        Cache        => 0,    # (optional) default 1 (0|1)
    );

=cut

sub ConfigItemGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID!',
        );
        return;
    }

    # set cache
    if ( !defined $Param{Cache} ) {
        $Param{Cache} = 1;
    }

    # check if result is already cached
    return $Self->{Cache}->{ConfigItemGet}->{ $Param{ConfigItemID} }
        if $Param{Cache} && $Self->{Cache}->{ConfigItemGet}->{ $Param{ConfigItemID} };

    # ask database
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id, configitem_number, class_id, last_version_id, '
            . 'cur_depl_state_id, cur_inci_state_id, '
            . 'create_time, create_by, change_time, change_by '
            . 'FROM configitem WHERE id = ?',
        Bind  => [ \$Param{ConfigItemID} ],
        Limit => 1,
    );

    # fetch the result
    my %ConfigItem;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ConfigItem{ConfigItemID}   = $Row[0];
        $ConfigItem{Number}         = $Row[1];
        $ConfigItem{ClassID}        = $Row[2];
        $ConfigItem{LastVersionID}  = $Row[3];
        $ConfigItem{CurDeplStateID} = $Row[4];
        $ConfigItem{CurInciStateID} = $Row[5];
        $ConfigItem{CreateTime}     = $Row[6];
        $ConfigItem{CreateBy}       = $Row[7];
        $ConfigItem{ChangeTime}     = $Row[8];
        $ConfigItem{ChangeBy}       = $Row[9];
    }

    # check config item
    if ( !$ConfigItem{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No such ConfigItemID ($Param{ConfigItemID})!",
        );
        return;
    }

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    $ConfigItem{Class} = $ClassList->{ $ConfigItem{ClassID} };

    return \%ConfigItem if !$ConfigItem{CurDeplStateID} || !$ConfigItem{CurInciStateID};

    # get deployment state functionality
    my $DeplState = $Self->{GeneralCatalogObject}->ItemGet(
        ItemID => $ConfigItem{CurDeplStateID},
    );

    $ConfigItem{CurDeplState}     = $DeplState->{Name};
    $ConfigItem{CurDeplStateType} = $DeplState->{Functionality};

    # get incident state functionality
    my $InciState = $Self->{GeneralCatalogObject}->ItemGet(
        ItemID => $ConfigItem{CurInciStateID},
    );

    $ConfigItem{CurInciState}     = $InciState->{Name};
    $ConfigItem{CurInciStateType} = $InciState->{Functionality};

    # cache user result
    $Self->{Cache}->{ConfigItemGet}->{ $Param{ConfigItemID} } = \%ConfigItem;

    return \%ConfigItem;
}

=item ConfigItemAdd()

add a new config item

    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        Number  => '111',  # (optional)
        ClassID => 123,
        UserID  => 1,
    );

=cut

sub ConfigItemAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    return if !$ClassList;
    return if ref $ClassList ne 'HASH';

    # check the class id
    if ( !$ClassList->{ $Param{ClassID} } ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'No valid class id given!',
        );
        return;
    }

    # create config item number
    if ( $Param{Number} ) {

        # find existing config item number
        my $Exists = $Self->ConfigItemNumberLookup(
            ConfigItemNumber => $Param{Number},
        );

        if ($Exists) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => 'Config item number already exists!',
            );
            return;
        }
    }
    else {

        # create config item number
        $Param{Number} = $Self->ConfigItemNumberCreate(
            Type    => $Self->{ConfigObject}->Get('ITSMConfigItem::NumberGenerator'),
            ClassID => $Param{ClassID},
        );
    }

    # insert new config item
    my $Success = $Self->{DBObject}->Do(
        SQL => 'INSERT INTO configitem '
            . '(configitem_number, class_id, create_time, create_by, change_time, change_by) '
            . 'VALUES (?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [ \$Param{Number}, \$Param{ClassID}, \$Param{UserID}, \$Param{UserID} ],
    );

    return if !$Success;

    # find id of new item
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM configitem WHERE '
            . 'configitem_number = ? AND class_id = ? ORDER BY id DESC',
        Bind => [ \$Param{Number}, \$Param{ClassID} ],
        Limit => 1,
    );

    # fetch the result
    my $ConfigItemID;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        $ConfigItemID = $Row[0];
    }

    # trigger ConfigItemCreate
    $Self->ConfigItemEventHandlerPost(
        ConfigItemID => $ConfigItemID,
        Event        => 'ConfigItemCreate',
        UserID       => $Param{UserID},
        Comment      => $ConfigItemID . '%%' . $Param{Number},
    );

    return $ConfigItemID;
}

=item ConfigItemDelete()

delete an existing config item

    my $True = $ConfigItemObject->ConfigItemDelete(
        ConfigItemID => 123,
        UserID       => 1,
    );

=cut

sub ConfigItemDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConfigItemID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # delete existing versions
    $Self->VersionDelete(
        ConfigItemID => $Param{ConfigItemID},
        UserID       => $Param{UserID},
    );

    # trigger ConfigItemDelete event
    $Self->ConfigItemEventHandlerPost(
        ConfigItemID => $Param{ConfigItemID},
        Event        => 'ConfigItemDelete',
        UserID       => $Param{UserID},
        Comment      => $Param{ConfigItemID},
    );

    # delete config item
    return $Self->{DBObject}->Do(
        SQL  => 'DELETE FROM configitem WHERE id = ?',
        Bind => [ \$Param{ConfigItemID} ],
    );
}

=item ConfigItemSearchExtended()

return a config item list as an array reference

    my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearchExtended(
        Number       => 'The ConfigItem Number',  # (optional)
        Name         => 'The Name',               # (optional)
        ClassIDs     => [9, 8, 7, 6],             # (optional)
        DeplStateIDs => [1, 2, 3, 4],             # (optional)
        InciStateIDs => [1, 2, 3, 4],             # (optional)

        # config items with created time after ...
        ConfigItemCreateTimeNewerDate => '2006-01-09 00:00:01',  # (optional)
        # config items with created time before then ....
        ConfigItemCreateTimeOlderDate => '2006-01-19 23:59:59',  # (optional)

        # config items with changed time after ...
        ConfigItemChangeTimeNewerDate => '2006-01-09 00:00:01',  # (optional)
        # config items with changed time before then ....
        ConfigItemChangeTimeOlderDate => '2006-01-19 23:59:59',  # (optional)

        What => [
            # each array element is a and condition
            {
                # or condition in hash
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => '%contentA%',
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => '%contentA%',
            },
            {
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => '%contentB%',
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => '%contentB%',
            }
            {
                # use array reference if different content with same key was searched
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => ['%contentC%', '%contentD%', '%contentE%'],
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => ['%contentC%', '%contentD%', '%contentE%'],
            },
        ],

        PreviousVersionSearch => 1,  # (optional) default 0 (0|1)

        OrderBy => 'Number',  # (optional) default ConfigItemID
        # (ConfigItemID, Number, ClassID, DeplStateID, InciStateID,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        Limit          => 122,  # (optional)
        UsingWildcards => 0,    # (optional) default 1
    );

=cut

sub ConfigItemSearchExtended {
    my ( $Self, %Param ) = @_;

    # set limit
    my $Limit = $Param{Limit};
    $Param{Limit} = undef;

    # config item search is required if one of this params are given
    my @ConfigItemSearchParams = (
        'Number',
        'ConfigItemCreateTimeNewerDate',
        'ConfigItemCreateTimeOlderDate',
        'ConfigItemChangeTimeNewerDate',
        'ConfigItemChangeTimeOlderDate'
    );

    # check, if config item search is required
    my %RequiredSearch;
    CONFIGITEMPARAM:
    for my $ConfigItemParam (@ConfigItemSearchParams) {
        next CONFIGITEMPARAM if !$Param{$ConfigItemParam};

        $RequiredSearch{ConfigItem} = 1;
        last CONFIGITEMPARAM;
    }

    # version search is required if Name, What or PreviousVersionSearch is given
    if ( $Param{Name} || $Param{What} || $Param{PreviousVersionSearch} ) {
        $RequiredSearch{Version} = 1;
    }

    # xml version search is required if What is given
    if ( $Param{What} ) {
        $RequiredSearch{XMLVersion} = 1;
    }

    # use config item search as fallback
    if ( !%RequiredSearch ) {
        $RequiredSearch{ConfigItem} = 1;
    }

    # start config item search
    my %ConfigItemLists;
    if ( $RequiredSearch{ConfigItem} ) {

        # search config items
        $ConfigItemLists{ConfigItem} = $Self->ConfigItemSearch(%Param);

        return if !$ConfigItemLists{ConfigItem};
        return if ref $ConfigItemLists{ConfigItem} ne 'ARRAY';
        return [] if !@{ $ConfigItemLists{ConfigItem} };
    }

    # start version search
    if ( $RequiredSearch{Version} ) {

        # search versions
        $ConfigItemLists{Version} = $Self->VersionSearch(%Param);

        return if !$ConfigItemLists{Version};
        return if ref $ConfigItemLists{Version} ne 'ARRAY';
        return [] if !@{ $ConfigItemLists{Version} };
    }

    # start xml version search
    if ( $RequiredSearch{XMLVersion} ) {

        # search xml versions
        my $XMLVersionList = $Self->_XMLVersionSearch(%Param);

        return if !$XMLVersionList;
        return if ref $XMLVersionList ne 'HASH';
        return [] if !%{$XMLVersionList};

        # get config item ids
        my %ConfigItemListTmp;
        for my $VersionID ( keys %{$XMLVersionList} ) {
            my $ConfigItemID = $Self->VersionConfigItemIDGet(
                VersionID => $VersionID,
            );
            $ConfigItemListTmp{$ConfigItemID} = 1;
        }

        # add ids to config item list
        $ConfigItemLists{XMLVersion} = \%ConfigItemListTmp;
    }

    # create the result list
    my @ResultList;
    if ( $RequiredSearch{ConfigItem} && $RequiredSearch{Version} ) {

        my %VersionTempList;
        for my $ConfigItemID ( @{ $ConfigItemLists{Version} } ) {
            $VersionTempList{$ConfigItemID} = 1;
        }

        CONFIGITEMID:
        for my $ConfigItemID ( @{ $ConfigItemLists{ConfigItem} } ) {

            next CONFIGITEMID if !$VersionTempList{$ConfigItemID};

            push @ResultList, $ConfigItemID;
        }
    }
    elsif ( $RequiredSearch{ConfigItem} ) {
        @ResultList = @{ $ConfigItemLists{ConfigItem} };
    }
    elsif ( $RequiredSearch{Version} ) {
        @ResultList = @{ $ConfigItemLists{Version} };
    }

    # consider the XML result
    if ( $RequiredSearch{XMLVersion} ) {
        @ResultList = grep { $ConfigItemLists{XMLVersion}->{$_} } @ResultList;
    }

    # consider limit
    if ( $Limit && $Limit < scalar @ResultList ) {

        # extract the limited ids
        $Limit--;
        @ResultList = @ResultList[ 0 .. $Limit ];
    }

    return \@ResultList;
}

=item ConfigItemSearch()

return a config item list as an array reference

    my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearch(
        Number       => 'The ConfigItem Number',  # (optional)
        ClassIDs     => [9, 8, 7, 6],             # (optional)
        DeplStateIDs => [1, 2, 3, 4],             # (optional)
        InciStateIDs => [1, 2, 3, 4],             # (optional)
        CreateBy     => [1, 2, 3],                # (optional)
        ChangeBy     => [3, 2, 1],                # (optional)

        # config items with created time after ...
        ConfigItemCreateTimeNewerDate => '2006-01-09 00:00:01',  # (optional)
        # config items with created time before then ....
        ConfigItemCreateTimeOlderDate => '2006-01-19 23:59:59',  # (optional)

        # config items with changed time after ...
        ConfigItemChangeTimeNewerDate => '2006-01-09 00:00:01',  # (optional)
        # config items with changed time before then ....
        ConfigItemChangeTimeOlderDate => '2006-01-19 23:59:59',  # (optional)

        OrderBy => 'Number',  # (optional) default ConfigItemID
        # (ConfigItemID, Number, ClassID, DeplStateID, InciStateID,
        # CreateTime, CreateBy, ChangeTime, ChangeBy)

        Limit          => 122,  # (optional)
        UsingWildcards => 0,    # (optional) default 1
    );

=cut

sub ConfigItemSearch {
    my ( $Self, %Param ) = @_;

    # set default values
    if ( !defined $Param{UsingWildcards} ) {
        $Param{UsingWildcards} = 1;
    }
    $Param{OrderBy} ||= 'id';

    # add number to sql where array
    my @SQLWhere;
    if ( $Param{Number} ) {

        # quote
        $Param{Number} = $Self->{DBObject}->Quote( $Param{Number} );

        if ( $Param{UsingWildcards} ) {

            # prepare like string
            $Self->_PrepareLikeString( \$Param{Number} );

            push @SQLWhere, "LOWER(configitem_number) LIKE LOWER('$Param{Number}')";
        }
        else {
            push @SQLWhere, "LOWER(configitem_number) = LOWER('$Param{Number}')";
        }
    }

    # set array params
    my %ArrayParams = (
        ClassIDs     => 'class_id',
        DeplStateIDs => 'cur_depl_state_id',
        InciStateIDs => 'cur_inci_state_id',
        CreateBy     => 'create_by',
        ChangeBy     => 'change_by',
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

        next ARRAYPARAM if !$InString;

        push @SQLWhere, "$ArrayParams{ $ArrayParam } IN ($InString)";
    }

    # set time params
    my %TimeParams = (
        ConfigItemCreateTimeNewerDate => 'create_time >=',
        ConfigItemCreateTimeOlderDate => 'create_time <=',
        ConfigItemChangeTimeNewerDate => 'change_time >=',
        ConfigItemChangeTimeOlderDate => 'change_time <=',
    );

    TIMEPARAM:
    for my $TimeParam ( keys %TimeParams ) {

        next TIMEPARAM if !$Param{$TimeParam};

        if ( $Param{$TimeParam} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Invalid date format found!",
            );
            return;
        }

        # quote
        $Param{$TimeParam} = $Self->{DBObject}->Quote( $Param{$TimeParam} );

        push @SQLWhere, "$TimeParams{ $TimeParam } '$Param{ $TimeParam }'";
    }

    # create where string
    my $WhereString = @SQLWhere ? ' WHERE ' . join q{ AND }, @SQLWhere : '';

    # define order table
    my %OrderByTable = (
        ConfigItemID => 'id',
        Number       => 'configitem_number',
        ClassID      => 'class_id',
        DeplStateID  => 'cur_depl_state_id',
        InciStateID  => 'cur_inci_state_id',
        CreateTime   => 'create_time',
        CreateBy     => 'create_by',
        ChangeTime   => 'change_time',
        ChangeBy     => 'change_by',
    );

    # set order by
    my $OrderBy = $OrderByTable{ $Param{OrderBy} } || $OrderByTable{ConfigItemID};

    # set limit
    if ( $Param{Limit} ) {
        $Param{Limit} = $Self->{DBObject}->Quote( $Param{Limit}, 'Integer' );
    }

    # ask database
    $Self->{DBObject}->Prepare(
        SQL   => "SELECT id FROM configitem $WhereString ORDER BY $OrderBy ASC",
        Limit => $Param{Limit},
    );

    # fetch the result
    my @ConfigItemList;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemList, $Row[0];
    }

    return \@ConfigItemList;
}

=item CurInciStateRecalc()

return a config item list as array hash reference

    my $ConfigItemListRef = $ConfigItemObject->CurInciStateRecalc(
        ConfigItemID => 123,
    );

=cut

sub CurInciStateRecalc {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ConfigItemID!',
        );
        return;
    }

    my $LinkType = $Self->{ConfigObject}->Get('ITSM::Core::IncidentLinkType');
    my %ScannedConfigItemIDs;

    # find all config items with an incident state
    $Self->_FindInciConfigItems(
        ConfigItemID         => $Param{ConfigItemID},
        LinkType             => $LinkType,
        ScannedConfigItemIDs => \%ScannedConfigItemIDs,
    );

    # investigate all config items with an warning state
    CONFIGITEMID:
    for my $ConfigItemID ( keys %ScannedConfigItemIDs ) {

        next CONFIGITEMID if $ScannedConfigItemIDs{$ConfigItemID}->{Type} ne 'incident';

        $Self->_FindWarnConfigItems(
            ConfigItemID         => $ConfigItemID,
            LinkType             => $LinkType,
            ScannedConfigItemIDs => \%ScannedConfigItemIDs,
        );
    }

    # get the incident state list of warnings
    my $WarnStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class         => 'ITSM::Core::IncidentState',
        Functionality => 'warning',
    );

    my %ReverseWarnStateList = reverse %{$WarnStateList};
    my @SortedWarnList       = sort keys %ReverseWarnStateList;
    my $WarningStateID
        = $ReverseWarnStateList{Warning} || $ReverseWarnStateList{ $SortedWarnList[0] };

    CONFIGITEMID:
    for my $ConfigItemID ( keys %ScannedConfigItemIDs ) {

        # extract incident state type
        my $InciStateType = $ScannedConfigItemIDs{$ConfigItemID}{Type};

        next CONFIGITEMID if $InciStateType eq 'incident';

        my $CurInciStateID = $WarningStateID;
        if ( $InciStateType eq 'operational' ) {

            # get last version
            my $LastVersion = $Self->VersionGet(
                ConfigItemID => $ConfigItemID,
                XMLDataGet   => 0,
            );

            $CurInciStateID = $LastVersion->{InciStateID};
        }

        # update current incident state
        $Self->{DBObject}->Do(
            SQL => "UPDATE configitem SET cur_inci_state_id = $CurInciStateID "
                . "WHERE id = $ConfigItemID",
        );
    }

    return 1;
}

sub _FindInciConfigItems {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{ConfigItemID};

    # ignore already scanned ids (infinite loop protection)
    return if $Param{ScannedConfigItemIDs}->{ $Param{ConfigItemID} };
    $Param{ScannedConfigItemIDs}->{ $Param{ConfigItemID} }->{Type} = 'operational';

    # find all linked config items (childs)
    my %LinkedConfigItemIDs = $Self->{LinkObject}->LinkKeyList(
        Object1   => 'ITSMConfigItem',
        Key1      => $Param{ConfigItemID},
        Object2   => 'ITSMConfigItem',
        State     => 'Valid',
        Type      => $Param{LinkType},
        Direction => 'Both',
        UserID    => 1,
    );

    CONFIGITEMID:
    for my $ConfigItemID ( keys %LinkedConfigItemIDs ) {

        # get config item data
        my $ConfigItem = $Self->ConfigItemGet(
            ConfigItemID => $ConfigItemID,
            Cache        => 0,
        );

        # set incident state
        if ( $ConfigItem->{CurInciStateType} eq 'incident' ) {
            $Param{ScannedConfigItemIDs}->{$ConfigItemID}->{Type} = 'incident';
            next CONFIGITEMID;
        }

        # start recursion
        $Self->_FindInciConfigItems(
            ConfigItemID         => $ConfigItemID,
            LinkType             => $Param{LinkType},
            ScannedConfigItemIDs => $Param{ScannedConfigItemIDs},
        );
    }

    return 1;
}

sub _FindWarnConfigItems {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{ConfigItemID};

    # ignore already scanned ids (infinite loop protection)
    return if $Param{ScannedConfigItemIDs}->{ $Param{ConfigItemID} }->{FindWarn};
    $Param{ScannedConfigItemIDs}->{ $Param{ConfigItemID} }->{FindWarn} = 1;

    # find all linked config items (parents)
    my %LinkedConfigItemIDs = $Self->{LinkObject}->LinkKeyList(
        Object1   => 'ITSMConfigItem',
        Key1      => $Param{ConfigItemID},
        Object2   => 'ITSMConfigItem',
        State     => 'Valid',
        Type      => $Param{LinkType},
        Direction => 'Both',
        UserID    => 1,
    );

    CONFIGITEMID:
    for my $ConfigItemID ( keys %LinkedConfigItemIDs ) {

        # start recursion
        $Self->_FindWarnConfigItems(
            ConfigItemID         => $ConfigItemID,
            LinkType             => $Param{LinkType},
            ScannedConfigItemIDs => $Param{ScannedConfigItemIDs},
        );

        next CONFIGITEMID
            if $Param{ScannedConfigItemIDs}->{$ConfigItemID}->{Type}
                && $Param{ScannedConfigItemIDs}->{$ConfigItemID}->{Type} eq 'incident';

        # set warning state
        $Param{ScannedConfigItemIDs}->{$ConfigItemID}->{Type} = 'warning';
    }

    return 1;
}

=item _PrepareLikeString()

internal function to prepare like strings

    $ConfigItemObject->_PrepareLikeString( $StringRef );

=cut

sub _PrepareLikeString {
    my ( $Self, $Value ) = @_;

    return if !$Value;
    return if ref $Value ne 'SCALAR';

    # Quote
    ${$Value} = $Self->{DBObject}->Quote( ${$Value}, 'Like' );

    # replace * with %
    ${$Value} =~ s{ \*+ }{%}xmsg;

    return;
}

=item ConfigItemEventHandlerPost()

call config item event post handler, returns true if it's executed successfully

    $ConfigItemObject->ConfigItemEventHandlerPost(
        ConfigItemID => 123,
        Event        => 'NewConfigItem',
        UserID       => 123,
    );

events available:

ConfigItemCreate, VersionCreate, DeploymentStateUpdate, IncidentStateUpdate,
ConfigItemDelete, LinkAdd, LinkDelete, DefinitionUpdate, NameUpdate, ValueUpdate
DefinitionCreate

=cut

sub ConfigItemEventHandlerPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Event UserID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # if it is not a DefinitionCreate event, the config item id is needed
    if ( $Param{Event} ne 'DefinitionCreate' && !$Param{ConfigItemID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need ConfigItemID!",
        );
        return;
    }

    # load config item event module
    my $Modules = $Self->{ConfigObject}->Get('ITSMConfigItem::EventModulePost');

    return if !$Modules;
    return if ref $Modules ne 'HASH';

    # try to load the event modules
    MODULE:
    for my $Module ( sort keys %{$Modules} ) {

        my $Event = $Modules->{$Module}->{Event};

        next MODULE if $Event && $Param{Event} !~ m{ \Q $Event \E }xmsi;

        my $ModuleName = $Modules->{$Module}->{Module};

        next MODULE if !$Self->{MainObject}->Require($ModuleName);

        my $Generic = $ModuleName->new(
            %{$Self},
            ConfigItemObject => $Self,
        );

        # run event handler
        $Generic->Run(
            %Param,
            Config => $Modules->{$Module},
        );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.15 $ $Date: 2009-08-19 22:31:31 $

=cut
