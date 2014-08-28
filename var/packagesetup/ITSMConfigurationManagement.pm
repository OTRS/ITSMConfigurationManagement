# --
# ITSMConfigurationManagement.pm - code to excecute during package installation
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::ITSMConfigurationManagement;    ## no critic

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Group',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Service',
    'Kernel::System::Stats',
    'Kernel::System::SysConfig',
    'Kernel::System::Valid',
);

=head1 NAME

ITSMConfigurationManagement.pm - code to excecute during package installation

=head1 SYNOPSIS

Functions for installing the ITSMConfigurationManagement package.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::ITSMConfigurationManagement');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # create needed sysconfig object
    $Self->{SysConfigObject} = $Kernel::OM->Get('Kernel::System::SysConfig');

    # rebuild ZZZ* files
    $Self->{SysConfigObject}->WriteDefault();

    # define the ZZZ files
    my @ZZZFiles = (
        'ZZZAAuto.pm',
        'ZZZAuto.pm',
    );

    # reload the ZZZ files (mod_perl workaround)
    for my $ZZZFile (@ZZZFiles) {

        PREFIX:
        for my $Prefix (@INC) {
            my $File = $Prefix . '/Kernel/Config/Files/' . $ZZZFile;
            next PREFIX if !-f $File;
            do $File;
            last PREFIX;
        }
    }

    # create additional objects
    $Self->{LogObject}            = $Kernel::OM->Get('Kernel::System::Log');
    $Self->{DBObject}             = $Kernel::OM->Get('Kernel::System::DB');
    $Self->{GroupObject}          = $Kernel::OM->Get('Kernel::System::Group');
    $Self->{ServiceObject}        = $Kernel::OM->Get('Kernel::System::Service');
    $Self->{ValidObject}          = $Kernel::OM->Get('Kernel::System::Valid');
    $Self->{GeneralCatalogObject} = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    $Self->{ConfigItemObject}     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    $Self->{LinkObject}           = $Kernel::OM->Get('Kernel::System::LinkObject');

    # the stats object needs a UserID parameter for the constructor
    # we need to discard any existing stats object before
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::System::Stats'],
    );

    # define UserID parameter for the constructor of the stats object
    $Kernel::OM->ObjectParamAdd(
        'Kernel::System::Stats' => {
            UserID => 1,
        },
    );
    $Self->{StatsObject} = $Kernel::OM->Get('Kernel::System::Stats');

    # define file prefix for stats
    $Self->{FilePrefix} = 'ITSMStats';

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # add the group itsm-configitem
    $Self->_GroupAdd(
        Name        => 'itsm-configitem',
        Description => 'Group for ITSM ConfigItem mask access in the agent interface.',
    );

    # install config item definitions
    $Self->_AddConfigItemDefinitions();

    # fillup empty last_version_id rows in configitem table
    $Self->_FillupEmptyLastVersionID();

    # fillup empty inci_state_id rows in configitem_version table
    $Self->_FillupEmptyVersionIncidentStateID();

    # fillup empty cur_depl_state_id or cur_inci_state_id rows in configitem table
    $Self->_FillupEmptyIncidentAndDeploymentStateID();

    # set preferences for some config items
    $Self->_SetPreferences();

    # set default permission group
    $Self->_SetDefaultPermission();

    # install stats
    $Self->{StatsObject}->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
    );

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # add the group itsm-configitem
    $Self->_GroupAdd(
        Name        => 'itsm-configitem',
        Description => 'Group for ITSM ConfigItem mask access in the agent interface.',
    );

    # install config item definitions
    $Self->_AddConfigItemDefinitions();

    # fillup empty last_version_id rows in configitem table
    $Self->_FillupEmptyLastVersionID();

    # fillup empty inci_state_id rows in configitem_version table
    $Self->_FillupEmptyVersionIncidentStateID();

    # fillup empty cur_depl_state_id or cur_inci_state_id rows in configitem table
    $Self->_FillupEmptyIncidentAndDeploymentStateID();

    # set preferences for some config items
    $Self->_SetPreferences();

    # set default permission group
    $Self->_SetDefaultPermission();

    # install stats
    $Self->{StatsObject}->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
    );

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # install config item definitions
    $Self->_AddConfigItemDefinitions();

    # fillup empty last_version_id rows in configitem table
    $Self->_FillupEmptyLastVersionID();

    # fillup empty inci_state_id rows in configitem_version table
    $Self->_FillupEmptyVersionIncidentStateID();

    # fillup empty cur_depl_state_id or cur_inci_state_id rows in configitem table
    $Self->_FillupEmptyIncidentAndDeploymentStateID();

    # set preferences for some config items
    $Self->_SetPreferences();

    # set default permission group
    $Self->_SetDefaultPermission();

    # install stats
    $Self->{StatsObject}->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
    );

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # delete all links with config items
    $Self->_LinkDelete();

    # deactivate the group itsm-configitem
    $Self->_GroupDeactivate(
        Name => 'itsm-configitem',
    );

    # delete 'CurInciStateTypeFromCIs' service preferences
    $Self->_DeleteServicePreferences();

    return 1;
}

=item _SetPreferences()

    my $Result = $CodeObject->_SetPreferences()

=cut

sub _SetPreferences {
    my ( $Self, %Param ) = @_;

    my %Map = (
        Expired     => 'productive',
        Inactive    => 'postproductive',
        Maintenance => 'productive',
        Pilot       => 'productive',
        Planned     => 'preproductive',
        Production  => 'productive',
        Repair      => 'productive',
        Retired     => 'postproductive',
        Review      => 'productive',
        'Test/QA'   => 'preproductive',
    );

    NAME:
    for my $Name ( sort keys %Map ) {
        my $Item = $Self->{GeneralCatalogObject}->ItemGet(
            Name  => $Name,
            Class => 'ITSM::ConfigItem::DeploymentState',
        );

        next NAME if !$Item;

        $Self->{GeneralCatalogObject}->GeneralCatalogPreferencesSet(
            ItemID => $Item->{ItemID},
            Key    => 'Functionality',
            Value  => $Map{$Name},
        );
    }
}

=item _SetDefaultPermission()

set the default group that has access rights

=cut

sub _SetDefaultPermission {
    my ( $Self, %Param ) = @_;

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # check if group already exists
    my $GroupID = $Self->{GroupObject}->GroupLookup(
        Group  => 'itsm-configitem',
        UserID => 1,
    );

    # check if a permission group is already set. If not, set default permission group
    for my $ClassID ( sort keys %{$ClassList} ) {
        my $Class = $Self->{GeneralCatalogObject}->ItemGet(
            ItemID => $ClassID,
        );

        if ( !$Class->{Permission} ) {
            $Self->{GeneralCatalogObject}->GeneralCatalogPreferencesSet(
                ItemID => $Class->{ItemID},
                Key    => 'Permission',
                Value  => $GroupID,
            );
        }
    }
}

=item _GroupAdd()

add a group

    my $Result = $CodeObject->_GroupAdd(
        Name        => 'the-group-name',
        Description => 'The group description.',
    );

=cut

sub _GroupAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name Description)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get list of all groups
    my %GroupList = $Self->{GroupObject}->GroupList();

    # reverse the group list for easier lookup
    my %GroupListReverse = reverse %GroupList;

    # check if group already exists
    my $GroupID = $GroupListReverse{ $Param{Name} };

    # reactivate the group
    if ($GroupID) {

        # get current group data
        my %GroupData = $Self->{GroupObject}->GroupGet(
            ID     => $GroupID,
            UserID => 1,
        );

        # reactivate group
        $Self->{GroupObject}->GroupUpdate(
            %GroupData,
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );

        return 1;
    }

    # add the group
    else {
        return if !$Self->{GroupObject}->GroupAdd(
            Name    => $Param{Name},
            Comment => $Param{Description},
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );
    }

    # lookup the new group id
    my $NewGroupID = $Self->{GroupObject}->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

    # add user root to the group
    $Self->{GroupObject}->GroupMemberAdd(
        GID        => $NewGroupID,
        UID        => 1,
        Permission => {
            ro        => 1,
            move_into => 1,
            create    => 1,
            owner     => 1,
            priority  => 1,
            rw        => 1,
        },
        UserID => 1,
    );

    return 1;
}

=item _GroupDeactivate()

deactivate a group

    my $Result = $CodeObject->_GroupDeactivate(
        Name => 'the-group-name',
    );

=cut

sub _GroupDeactivate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Name!',
        );
        return;
    }

    # lookup group id
    my $GroupID = $Self->{GroupObject}->GroupLookup(
        Group => $Param{Name},
    );

    return if !$GroupID;

    # get valid list
    my %ValidList = $Self->{ValidObject}->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get current group data
    my %GroupData = $Self->{GroupObject}->GroupGet(
        ID     => $GroupID,
        UserID => 1,
    );

    # deactivate group
    $Self->{GroupObject}->GroupUpdate(
        %GroupData,
        ValidID => $ValidListReverse{invalid},
        UserID  => 1,
    );

    return 1;
}

=item _AddConfigItemDefinitions()

installs ConfigItem definitions

    my $Result = $CodeObject->_AddConfigItemDefinitions();

=cut

sub _AddConfigItemDefinitions {
    my ( $Self, %Param ) = @_;

    # config item definitions
    my %Definition = (
        Computer => "[
    {
        Key => 'Vendor',
        Name => 'Vendor',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,

            # Example for CI attribute syntax check for text and textarea fields
            #RegEx             => '^ABC.*',
            #RegExErrorMessage => 'Value must start with \"ABC\"!',
        },
    },
    {
        Key => 'Model',
        Name => 'Model',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'Description',
        Name => 'Description',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
        },
    },
    {
        Key => 'Type',
        Name => 'Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Computer::Type',
            Translation => 1,
        },
    },
    {
        Key => 'Owner',
        Name => 'Owner',
        Searchable => 1,
        Input => {
            Type => 'Customer',
        },
    },
    {
        Key => 'SerialNumber',
        Name => 'Serial Number',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'OperatingSystem',
        Name => 'Operating System',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'CPU',
        Name => 'CPU',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
        CountMax => 16,
    },
    {
        Key => 'Ram',
        Name => 'Ram',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
        CountMax => 10,
    },
    {
        Key => 'HardDisk',
        Name => 'Hard Disk',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
        CountMax => 10,
        Sub => [
            {
                Key => 'Capacity',
                Name => 'Capacity',
                Input => {
                    Type => 'Text',
                    Size => 20,
                    MaxLength => 10,
                },
            },
        ],
    },
    {
        Key => 'FQDN',
        Name => 'FQDN',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'NIC',
        Name => 'Network Adapter',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
            Required => 1,
        },
        CountMin => 0,
        CountMax => 10,
        CountDefault => 1,
        Sub => [
            {
                Key => 'IPoverDHCP',
                Name => 'IP over DHCP',
                Input => {
                    Type => 'GeneralCatalog',
                    Class => 'ITSM::ConfigItem::YesNo',
                    Translation => 1,
                    Required => 1,
                },
            },
            {
                Key => 'IPAddress',
                Name => 'IP Address',
                Searchable => 1,
                Input => {
                    Type => 'Text',
                    Size => 40,
                    MaxLength => 40,
                    Required => 1,
                },
                CountMin => 0,
                CountMax => 20,
                CountDefault => 0,
            },
        ],
    },
    {
        Key => 'GraphicAdapter',
        Name => 'Graphic Adapter',
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'OtherEquipment',
        Name => 'Other Equipment',
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountDefault => 0,
    },
    {
        Key => 'WarrantyExpirationDate',
        Name => 'Warranty Expiration Date',
        Searchable => 1,
        Input => {
            Type => 'Date',
            YearPeriodPast => 20,
            YearPeriodFuture => 10,
        },
    },
    {
        Key => 'InstallDate',
        Name => 'Install Date',
        Searchable => 1,
        Input => {
            Type => 'Date',
            Required => 1,
            YearPeriodPast => 20,
            YearPeriodFuture => 10,
        },
        CountMin => 0,
        CountDefault => 0,
    },
    {
        Key => 'Note',
        Name => 'Note',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountDefault => 0,
    },
];",
        Hardware => "[
    {
        Key => 'Vendor',
        Name => 'Vendor',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'Model',
        Name => 'Model',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'Description',
        Name => 'Description',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
        },
    },
    {
        Key => 'Type',
        Name => 'Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Hardware::Type',
            Translation => 1,
        },
    },
    {
        Key => 'Owner',
        Name => 'Owner',
        Searchable => 1,
        Input => {
            Type => 'Customer',
        },
    },
    {
        Key => 'SerialNumber',
        Name => 'Serial Number',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'WarrantyExpirationDate',
        Name => 'Warranty Expiration Date',
        Searchable => 1,
        Input => {
            Type => 'Date',
            YearPeriodPast => 20,
            YearPeriodFuture => 10,
        },
    },
    {
        Key => 'InstallDate',
        Name => 'Install Date',
        Searchable => 1,
        Input => {
            Type => 'Date',
            Required => 1,
            YearPeriodPast => 20,
            YearPeriodFuture => 10,
        },
        CountMin => 0,
        CountMax => 1,
        CountDefault => 0,
    },
    {
        Key => 'Note',
        Name => 'Note',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountMax => 1,
        CountDefault => 0,
    },
];",
        Location => "[
    {
        Key => 'Type',
        Name => 'Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Location::Type',
            Translation => 1,
        },
    },
    {
        Key => 'Phone1',
        Name => 'Phone 1',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'Phone2',
        Name => 'Phone 2',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'Fax',
        Name => 'Fax',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'E-Mail',
        Name => 'E-Mail',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 100,
        },
    },
    {
        Key => 'Address',
        Name => 'Address',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
        },
    },
    {
        Key => 'Note',
        Name => 'Note',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountDefault => 0,
    },
];",
        Network => "[
    {
        Key => 'Description',
        Name => 'Description',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
        },
    },
    {
        Key => 'Type',
        Name => 'Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Network::Type',
            Translation => 1,
        },
    },
    {
        Key => 'NetworkAddress',
        Name => 'Network Address',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 30,
            MaxLength => 20,
            Required => 1,
        },
        CountMin => 0,
        CountMax => 100,
        CountDefault => 1,
        Sub => [
            {
                Key => 'SubnetMask',
                Name => 'Subnet Mask',
                Input => {
                    Type => 'Text',
                    Size => 30,
                    MaxLength => 20,
                    ValueDefault => '255.255.255.0',
                    Required => 1,
                },
                CountMin => 0,
                CountMax => 1,
                CountDefault => 0,
            },
            {
                Key => 'Gateway',
                Name => 'Gateway',
                Input => {
                    Type => 'Text',
                    Size => 30,
                    MaxLength => 20,
                    Required => 1,
                },
                CountMin => 0,
                CountMax => 10,
                CountDefault => 0,
            },
        ],
    },
    {
        Key => 'Note',
        Name => 'Note',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountMax => 1,
        CountDefault => 0,
    },
];",
        Software => "[
    {
        Key => 'Vendor',
        Name => 'Vendor',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'Version',
        Name => 'Version',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'Description',
        Name => 'Description',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
        },
    },
    {
        Key => 'Type',
        Name => 'Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Software::Type',
            Translation => 1,
        },
    },
    {
        Key => 'Owner',
        Name => 'Owner',
        Searchable => 1,
        Input => {
            Type => 'Customer',
        },
    },
    {
        Key => 'SerialNumber',
        Name => 'Serial Number',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
        },
    },
    {
        Key => 'LicenceType',
        Name => 'Licence Type',
        Searchable => 1,
        Input => {
            Type => 'GeneralCatalog',
            Class => 'ITSM::ConfigItem::Software::LicenceType',
            Translation => 1,
        },
    },
    {
        Key => 'LicenceKey',
        Name => 'Licence Key',
        Searchable => 1,
        Input => {
            Type => 'Text',
            Size => 50,
            MaxLength => 50,
            Required => 1,
        },
        CountMin => 0,
        CountMax => 100,
        CountDefault => 0,
        Sub => [
            {
                Key => 'Quantity',
                Name => 'Quantity',
                Input => {
                    Type => 'Integer',
                    ValueMin => 1,
                    ValueMax => 1000,
                    ValueDefault => 1,
                    Required => 1,
                },
                CountMin => 0,
                CountMax => 1,
                CountDefault => 0,
            },
            {
                Key => 'ExpirationDate',
                Name => 'Expiration Date',
                Input => {
                    Type => 'Date',
                    Required => 1,
                    YearPeriodPast => 20,
                    YearPeriodFuture => 10,
                },
                CountMin => 0,
                CountMax => 1,
                CountDefault => 0,
            },
        ],
    },
    {
        Key => 'Media',
        Name => 'Media',
        Input => {
            Type => 'Text',
            Size => 40,
            MaxLength => 20,
        },
    },
    {
        Key => 'Note',
        Name => 'Note',
        Searchable => 1,
        Input => {
            Type => 'TextArea',
            Required => 1,
        },
        CountMin => 0,
        CountMax => 1,
        CountDefault => 0,
    },
];",
    );

    # get list of installed config item classes
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );
    my %ReverseClassList = reverse %{$ClassList};

    CLASSNAME:
    for my $ClassName ( sort { lc $a cmp lc $b } keys %Definition ) {

        # check if class exists
        my $ClassID = $ReverseClassList{$ClassName};

        next CLASSNAME if !$ClassID;

        # check if definition already exists
        my $DefinitionList = $Self->{ConfigItemObject}->DefinitionList(
            ClassID => $ClassID,
        );

        next CLASSNAME if !defined $DefinitionList;
        next CLASSNAME if $DefinitionList && ref $DefinitionList eq 'ARRAY' && @{$DefinitionList};

        # add the new definition
        $Self->{ConfigItemObject}->DefinitionAdd(
            ClassID    => $ClassID,
            Definition => $Definition{$ClassName},
            UserID     => 1,
        );
    }

    return 1;
}

=item _LinkDelete()

delete all existing links to config items

    my $Result = $CodeObject->_LinkDelete();

=cut

sub _LinkDelete {
    my ( $Self, %Param ) = @_;

    # get all config items
    my $ConfigItemIDs = $Self->{ConfigItemObject}->ConfigItemSearch();

    return if !$ConfigItemIDs;
    return if ref $ConfigItemIDs ne 'ARRAY';

    # delete the config item links
    for my $ConfigItemID ( @{$ConfigItemIDs} ) {
        $Self->{LinkObject}->LinkDeleteAll(
            Object => 'ITSMConfigItem',
            Key    => $ConfigItemID,
            UserID => 1,
        );
    }

    return 1;
}

=item _FillupEmptyLastVersionID()

fillup empty entries in the last_version_id column of the configitem table

    my $Result = $CodeObject->_FillupEmptyLastVersionID();

=cut

sub _FillupEmptyLastVersionID {
    my ( $Self, %Param ) = @_;

    # get config items with empty last_version_id
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM configitem WHERE '
            . 'last_version_id = 0 OR last_version_id IS NULL',
    );

    # fetch the result
    my @ConfigItemIDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemIDs, $Row[0];
    }

    CONFIGITEMID:
    for my $ConfigItemID (@ConfigItemIDs) {

        # get the last version of this config item
        $Self->{DBObject}->Prepare(
            SQL => 'SELECT id FROM configitem_version '
                . 'WHERE configitem_id = ? ORDER BY id DESC',
            Bind  => [ \$ConfigItemID ],
            Limit => 1,
        );

        # fetch the result
        my $VersionID;
        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $VersionID = $Row[0];
        }

        next CONFIGITEMID if !$VersionID;

        # update inci_state_id
        $Self->{DBObject}->Do(
            SQL => 'UPDATE configitem '
                . 'SET last_version_id = ? '
                . 'WHERE id = ?',
            Bind => [ \$VersionID, \$ConfigItemID ],
        );
    }

    return 1;
}

=item _FillupEmptyVersionIncidentStateID()

fillup empty entries in the inci_state_id column of the configitem_version table

    my $Result = $CodeObject->_FillupEmptyVersionIncidentStateID();

=cut

sub _FillupEmptyVersionIncidentStateID {
    my ( $Self, %Param ) = @_;

    # get operational incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class       => 'ITSM::Core::IncidentState',
        Preferences => {
            Functionality => 'operational',
        },
    );

    # error handling
    if ( !$InciStateList || ref $InciStateList ne 'HASH' || !%{$InciStateList} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::Core::IncidentState!",
        );
        return;
    }

    # sort ids
    my @InciStateKeyList = sort keys %{$InciStateList};

    # update inci_state_id
    return $Self->{DBObject}->Do(
        SQL => 'UPDATE configitem_version '
            . 'SET inci_state_id = ? '
            . 'WHERE inci_state_id = 0 OR inci_state_id IS NULL',
        Bind => [ \$InciStateKeyList[0] ],
    );
}

=item _FillupEmptyIncidentAndDeploymentStateID()

fillup empty entries in the cur_depl_state_id or cur_inci_state_id column of the configitem table

    my $Result = $CodeObject->_FillupEmptyIncidentAndDeploymentStateID();

=cut

sub _FillupEmptyIncidentAndDeploymentStateID {
    my ( $Self, %Param ) = @_;

    # get config items with empty cur_depl_state_id or cur_inci_state_id
    $Self->{DBObject}->Prepare(
        SQL => 'SELECT id FROM configitem WHERE '
            . 'cur_depl_state_id = 0 OR cur_depl_state_id IS NULL OR '
            . 'cur_inci_state_id = 0 OR cur_inci_state_id IS NULL',
    );

    # fetch the result
    my @ConfigItemIDs;
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
        push @ConfigItemIDs, $Row[0];
    }

    CONFIGITEMID:
    for my $ConfigItemID (@ConfigItemIDs) {

        # get last version
        my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        next CONFIGITEMID if !$LastVersion;
        next CONFIGITEMID if ref $LastVersion ne 'HASH';
        next CONFIGITEMID if !$LastVersion->{DeplStateID};
        next CONFIGITEMID if !$LastVersion->{InciStateID};

        # complete config item
        $Self->{DBObject}->Do(
            SQL => 'UPDATE configitem SET '
                . 'cur_depl_state_id = ?, '
                . 'cur_inci_state_id = ? '
                . 'WHERE id = ?',
            Bind => [
                \$LastVersion->{DeplStateID},
                \$LastVersion->{InciStateID},
                \$ConfigItemID,
            ],
        );
    }

    return 1;
}

=item _DeleteServicePreferences()

Deletes the service preferences for the key 'CurInciStateTypeFromCIs'.

    my $Result = $CodeObject->_DeleteServicePreferences();

=cut

sub _DeleteServicePreferences {
    my ( $Self, %Param ) = @_;

    # get service list
    my %ServiceList = $Self->{ServiceObject}->ServiceList(
        Valid  => 0,
        UserID => 1,
    );

    SERVICEID:
    for my $ServiceID ( sort keys %ServiceList ) {

        # delete the current incident state type from CIs of the service
        $Self->{ServiceObject}->ServicePreferencesSet(
            ServiceID => $ServiceID,
            Key       => 'CurInciStateTypeFromCIs',
            Value     => '',
            UserID    => 1,
        );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
