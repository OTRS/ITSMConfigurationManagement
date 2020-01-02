# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars qw($Self);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $TestUserLogin = $Helper->TestUserCreate(
    Groups => [ 'admin', 'users' ],
);
my $UserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup( UserLogin => $TestUserLogin );

my $RandomID = $Helper->GetRandomID();

my $ClassID = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemAdd(
    Class   => 'ITSM::ConfigItem::Class',
    Name    => $RandomID,
    ValidID => 1,
    UserID  => $UserID,
);
$Self->True(
    $ClassID,
    "Class added to GeneralCatalog",
);

my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
my $DefinitionID1    = $ConfigItemObject->DefinitionAdd(
    ClassID    => $ClassID,
    UserID     => $UserID,
    CreateBy   => $UserID,
    Definition => << 'EOF',
---
- Key: Vendor
  Name: Vendor
  Searchable: 1
  Input:
    Type: Text
    Size: 50
    MaxLength: 50
EOF
);
$Self->True(
    $DefinitionID1,
    "DefinitionAdd()",
);
my $DefinitionID2 = $ConfigItemObject->DefinitionAdd(
    ClassID    => $ClassID,
    UserID     => $UserID,
    CreateBy   => $UserID,
    Definition => << 'EOF',
---
- Key: Vendor
  Name: Vendor
  Searchable: 0
  Input:
    Type: Text
    Size: 50
    MaxLength: 50
EOF
);

$Self->True(
    $DefinitionID2,
    "DefinitionAdd()",
);

my @Tests = (
    {
        Name    => 'Empty',
        Config  => {},
        Success => 0,
    },
    {
        Name   => 'By ClassID',
        Config => {
            ClassID => $ClassID,
        },
        Success         => 1,
        ExpectedResults => [
            {
                CreateBy   => $UserID,
                Definition => << 'EOF',
---
- Key: Vendor
  Name: Vendor
  Searchable: 1
  Input:
    Type: Text
    Size: 50
    MaxLength: 50
EOF
                Version      => 1,
                DefinitionID => $DefinitionID1,
            },
            {
                CreateBy   => $UserID,
                Definition => << 'EOF',
---
- Key: Vendor
  Name: Vendor
  Searchable: 0
  Input:
    Type: Text
    Size: 50
    MaxLength: 50
EOF
                Version      => 2,
                DefinitionID => $DefinitionID2,
            },
        ],
    },
);

TEST:
for my $Test (@Tests) {

    my $DefinitionList = $ConfigItemObject->DefinitionList( %{ $Test->{Config} } );

    if ( !$Test->{Success} ) {
        $Self->False(
            $DefinitionList,
            "$Test->{Name} DefinitionList() - With false",
        );
        next TEST;
    }

    for my $Definition ( @{$DefinitionList} ) {
        delete $Definition->{CreateTime};
    }

    $Self->IsDeeply(
        $DefinitionList,
        $Test->{ExpectedResults},
        "$Test->{Name} DefinitionList() - Definition"
    );
}

1;
