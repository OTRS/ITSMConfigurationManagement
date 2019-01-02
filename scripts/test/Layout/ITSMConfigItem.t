# --
# Copyright (C) 2001-2019 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# Set timezone variables.
$ConfigObject->Set(
    Key   => 'TimeZone',
    Value => '+0',
);
$ConfigObject->Set(
    Key   => 'TimeZoneUser',
    Value => 1,
);
$ConfigObject->Set(
    Key   => 'TimeZoneUserBrowserAutoOffset',
    Value => 0,
);

# Set layout object to time zone west of UTC.
$Kernel::OM->ObjectParamAdd(
    'Kernel::Output::HTML::Layout' => {
        Lang         => 'en',
        UserTimeZone => '-6',
    },
);
my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

# Test ITSMConfigItemInputCreate() to check bug#14174 (https://bugs.otrs.org/show_bug.cgi?id=14174).
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
