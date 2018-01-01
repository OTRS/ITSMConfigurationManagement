# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get layout object
my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

my $XMLDefinition = [
    {
        Key        => 'Vendor',
        Name       => 'Vendor',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
    },
    {
        Key        => 'Model',
        Name       => 'Model',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
    },
    {
        Key        => 'Description',
        Name       => 'Description',
        Searchable => 1,
        Input      => {
            Type => 'TextArea',
        },
    },
    {
        Key        => 'Type',
        Name       => 'Type',
        Searchable => 1,
        Input      => {
            Type        => 'GeneralCatalog',
            Class       => 'ITSM::ConfigItem::Computer::Type',
            Translation => 1,
        },
    },
    {
        Key        => 'Owner',
        Name       => 'Owner',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
    {
        Key        => 'SerialNumber',
        Name       => 'Serial Number',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
    },
    {
        Key   => 'OperatingSystem',
        Name  => 'Operating System',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
    },
    {
        Key   => 'CPU',
        Name  => 'CPU',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
        CountMax => 16,
    },
    {
        Key   => 'Ram',
        Name  => 'Ram',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
        CountMax => 10,
    },
    {
        Key   => 'HardDisk',
        Name  => 'Hard Disk',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
        CountMax => 100,
        Sub      => [
            {
                Key   => 'Capacity',
                Name  => 'Capacity',
                Input => {
                    Type      => 'Text',
                    Size      => 20,
                    MaxLength => 10,
                },
                CountMax => 100,
                Sub      => [
                    {
                        Key   => 'Capacity',
                        Name  => 'Capacity',
                        Input => {
                            Type      => 'Text',
                            Size      => 20,
                            MaxLength => 10,
                        },
                        CountMax => 100,
                        Sub      => [
                            {
                                Key   => 'Capacity',
                                Name  => 'Capacity',
                                Input => {
                                    Type      => 'Text',
                                    Size      => 20,
                                    MaxLength => 10,
                                },
                                CountMax => 100,
                            },
                        ],
                    },
                ],
            },
        ],
    },
    {
        Key        => 'FQDN',
        Name       => 'FQDN',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
    },
    {
        Key   => 'NIC',
        Name  => 'Network Adapter',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
            Required  => 1,
        },
        CountMin     => 0,
        CountMax     => 10,
        CountDefault => 1,
        Sub          => [
            {
                Key   => 'IPoverDHCP',
                Name  => 'IP over DHCP',
                Input => {
                    Type        => 'GeneralCatalog',
                    Class       => 'ITSM::ConfigItem::YesNo',
                    Translation => 1,
                    Required    => 1,
                },
            },
            {
                Key        => 'IPAddress',
                Name       => 'IP Address',
                Searchable => 1,
                Input      => {
                    Type      => 'Text',
                    Size      => 40,
                    MaxLength => 40,
                    Required  => 1,
                },
                CountMin     => 0,
                CountMax     => 20,
                CountDefault => 0,
            },
        ],
    },
    {
        Key   => 'GraphicAdapter',
        Name  => 'Graphic Adapter',
        Input => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 100,
        },
    },
    {
        Key   => 'OtherEquipment',
        Name  => 'Other Equipment',
        Input => {
            Type     => 'TextArea',
            Required => 1,
        },
        CountMin     => 0,
        CountDefault => 0,
    },
    {
        Key        => 'WarrantyExpirationDate',
        Name       => 'Warranty Expiration Date',
        Searchable => 1,
        Input      => {
            Type             => 'Date',
            YearPeriodPast   => 20,
            YearPeriodFuture => 10,
        },
    },
    {
        Key        => 'InstallDate',
        Name       => 'Install Date',
        Searchable => 1,
        Input      => {
            Type             => 'Date',
            Required         => 1,
            YearPeriodPast   => 20,
            YearPeriodFuture => 10,
        },
        CountMin     => 0,
        CountDefault => 0,
    },
    {
        Key        => 'Note',
        Name       => 'Note',
        Searchable => 1,
        Input      => {
            Type     => 'TextArea',
            Required => 1,
        },
        CountMin     => 0,
        CountDefault => 0,
    },
];

my $XMLData = {
    HardDisk => [
        undef,
        {
            Content  => 'HD1',
            Capacity => [
                undef,
                {
                    Content => '42 GB',
                }
                ]
        },
        {
            Content  => 'HD2',
            Capacity => [
                undef,
                {
                    Content => '780 GB',
                }
                ]
        },
    ],
};

my @ShowColumnsByClass = (
    'Name',
    'CurDeplState',
    'CPU::1',
    'HardDisk::1::Capacity::1',
    'HardDisk::2',
    'HardDisk::2::Capacity::1',
    'WarrantyExpirationDate::1',
    'CreateTime',
);

my $Result = $LayoutObject->XMLData2Hash(
    XMLDefinition => $XMLDefinition,
    XMLData       => $XMLData,
    Attributes    => \@ShowColumnsByClass,
);

my $Expected = {
    'CPU::1' => {
        Value => '',
        Name  => 'CPU',
    },
    'HardDisk::1::Capacity::1' => {
        Value => '42 GB',
        Name  => 'Capacity',
    },
    'HardDisk::2' => {
        Value => 'HD2',
        Name  => 'Hard Disk',
    },
    'HardDisk::2::Capacity::1' => {
        Value => '780 GB',
        Name  => 'Capacity',
    },
    'WarrantyExpirationDate::1' => {
        Name  => 'Warranty Expiration Date',
        Value => ''
        }
};

$Self->IsDeeply(
    $Result,
    $Expected,
    'XML Data converts into Hash structure',
);

1;
