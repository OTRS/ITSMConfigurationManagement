# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

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

# Test ITSMConfigItemInputCreate() to check bug#14174 (https://bugs.otrs.org/show_bug.cgi?id=14174).
# Set OTRSTimeZone to UTC.
$Helper->ConfigSettingChange(
    Valid => 1,
    Key   => 'OTRSTimeZone',
    Value => 'UTC',
);

# Get Layout object with EST user time zone.
$Kernel::OM->ObjectsDiscard(
    Objects => ['Kernel::Output::HTML::Layout'],
);
$Kernel::OM->ObjectParamAdd(
    'Kernel::Output::HTML::Layout' => {
        Lang         => 'en',
        UserTimeZone => 'EST',
    },
);
$LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

my %Param = (
    'Item' => {
        'Searchable' => 1,
        'Form'       => {
            'InstallDate::1' => {}
        },
        'Key'      => 'InstallDate',
        'CountMax' => 1,
        'Name'     => 'Install Date',
        'CountMin' => 0,
        'Input'    => {
            'Type'             => 'Date',
            'YearPeriodFuture' => 10,
            'Required'         => 1,
            'YearPeriodPast'   => 20
        },
        'CountDefault' => 0
    },
    'Invalid'  => 0,
    'Value'    => '2018-01-16',
    'Key'      => 'InstallDate::1',
    'Required' => 1,
    'ItemId'   => 'Item140'
);

my @Tests = (
    {
        OverrideTimeZone => 0,
        Expected         => '<option \s value="15" \s selected="selected">15</option>',
        Comment          => 'date is changed',
    },
    {
        OverrideTimeZone => 1,
        Expected         => '<option \s value="16" \s selected="selected">16<\/option>',
        Comment          => 'date is not changed',
    },
);

for my $Test (@Tests) {
    my $String = $LayoutObject->ITSMConfigItemInputCreate(
        %Param,
        OverrideTimeZone => $Test->{OverrideTimeZone},
    );

    my $Success;
    if ( $String =~ m{ $Test->{Expected} }msx ) {
        $Success = 1;
    }

    $Self->True(
        $Success,
        "OverrideTimeZone = $Test->{OverrideTimeZone} - $Test->{Comment}",
    );
}

1;
