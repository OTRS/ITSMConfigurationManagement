# --
# ITSMConfigurationManagement.pm - code to excecute during package installation
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigurationManagement.pm,v 1.3 2008-07-14 13:46:30 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package var::packagesetup::ITSMConfigurationManagement;

use strict;
use warnings;

use Kernel::System::Group;
use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;
use Kernel::System::Valid;

use vars qw(@ISA $VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

ITSMConfigurationManagement.pm - code to excecute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::DB;

    my $ConfigObject = Kernel::Config->new();
    my $LogObject    = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $CodeObject = ITSMConfigurationManagement->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject MainObject TimeObject DBObject XMLObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{GroupObject}          = Kernel::System::Group->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );
    $Self->{ValidObject}          = Kernel::System::Valid->new( %{$Self} );

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

    # install stats
    $Self->_AddConfigItemDefinitions();

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

    # install stats
    $Self->_AddConfigItemDefinitions();

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # install stats
    $Self->_AddConfigItemDefinitions();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # deactivate the group itsm-configitem
    $Self->_GroupDeactivate(
        Name => 'itsm-configitem',
    );

    return 1;
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

    # check if group already exists
    my $GroupID = $Self->{GroupObject}->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

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
                },
            },
            {
                Key => 'InstallDate',
                Name => 'Install Date',
                Searchable => 1,
                Input => {
                    Type => 'Date',
                    Required => 1,
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
                },
            },
            {
                Key => 'InstallDate',
                Name => 'Install Date',
                Searchable => 1,
                Input => {
                    Type => 'Date',
                    Required => 1,
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
                    Class => 'ITSM::Location::Type',
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
    for my $ClassName ( sort { lc($a) cmp lc($b) } keys %Definition ) {

        # check if class exists
        my $ClassID = $ReverseClassList{$ClassName};

        next CLASSNAME if !$ClassID;

        # check if definition already exists
        my $DefinitionRef = $Self->{ConfigItemObject}->DefinitionGet(
            DefinitionID => $ClassID,
        );

        next CLASSNAME if %{$DefinitionRef};

        # add the new definition
        $Self->{ConfigItemObject}->DefinitionAdd(
            ClassID    => $ClassID,
            Definition => $Definition{$ClassName},
            UserID     => 1,
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

$Revision: 1.3 $ $Date: 2008-07-14 13:46:30 $

=cut
