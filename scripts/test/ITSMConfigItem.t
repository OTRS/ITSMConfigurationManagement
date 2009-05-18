# --
# ITSMConfigItem.t - config item tests
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItem.t,v 1.2 2009-05-18 09:57:21 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

use Data::Dumper;
use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;
use Kernel::System::User;

$Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
$Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );
$Self->{UserObject}           = Kernel::System::User->new( %{$Self} );

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #

# perform ConfigItemCount to fill the empty fields
$Self->{ConfigItemObject}->ConfigItemCount();

# create needed users
my @UserIDs;
{

    # disable email checks to create new user
    my $CheckEmailAddressesOrg = $Self->{ConfigObject}->Get('CheckEmailAddresses') || 1;
    $Self->{ConfigObject}->Set(
        Key   => 'CheckEmailAddresses',
        Value => 0,
    );

    for my $Counter ( 1 .. 3 ) {

        # create new users for the tests
        my $UserID = $Self->{UserObject}->UserAdd(
            UserFirstname => 'ITSMConfigItem' . $Counter,
            UserLastname  => 'UnitTest',
            UserLogin     => 'UnitTest-ITSMConfigItem-' . $Counter . int rand 1_000_000,
            UserEmail     => 'UnitTest-ITSMConfigItem-' . $Counter . '@localhost',
            ValidID       => 1,
            ChangeUserID  => 1,
        );

        push @UserIDs, $UserID;
    }

    # restore original email check param
    $Self->{ConfigObject}->Set(
        Key   => 'CheckEmailAddresses',
        Value => $CheckEmailAddressesOrg,
    );
}

my $GeneralCatalogClass = 'UnitTest' . int rand 1_000_000;

# add a general catalog test list
for my $Name (qw(Test1 Test2 Test3 Test4)) {

    # add a new item
    my $ItemID = $Self->{GeneralCatalogObject}->ItemAdd(
        Class   => $GeneralCatalogClass,
        Name    => $Name,
        ValidID => 1,
        UserID  => 1,
    );

    # check item id
    if ( !$ItemID ) {

        $Self->True(
            0,
            "Can't add new general catalog item.",
        );
    }
}

# define the first test definition (all provided data types)
my @ConfigItemDefinitions;
$ConfigItemDefinitions[0] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
    {
        Key        => 'Date1',
        Name       => 'Date 1',
        Searchable => 1,
        Input      => {
            Type => 'Date',
        },
    },
    {
        Key        => 'DateTime1',
        Name       => 'Date Time 1',
        Searchable => 1,
        Input      => {
            Type => 'DateTime',
        },
    },
    {
        Key   => 'Dummy1',
        Name  => 'Dummy 1',
        Input => {
            Type => 'Dummy',
        },
    },
    {
        Key        => 'GeneralCatalog1',
        Name       => 'GeneralCatalog 1',
        Searchable => 1,
        Input      => {
            Type  => 'GeneralCatalog',
            Class => '$GeneralCatalogClass',
        },
    },
    {
        Key        => 'Integer1',
        Name       => 'Integer 1',
        Searchable => 1,
        Input      => {
            Type => 'Integer',
        },
    },
    {
        Key        => 'Text1',
        Name       => 'Text 1',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
    },
    {
        Key        => 'TextArea1',
        Name       => 'TextArea 1',
        Searchable => 1,
        Input      => {
            Type => 'TextArea',
        },
    },
] ";

# define the second test definition (sub data types)
$ConfigItemDefinitions[1] = " [
    {
        Key        => 'Main1',
        Name       => 'Main 1',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
        CountMax => 10,
        Sub => [
            {
                Key        => 'Main1Sub1',
                Name       => 'Main 1 Sub 1',
                Searchable => 1,
                Input      => {
                    Type      => 'Text',
                    Size      => 50,
                    MaxLength => 50,
                },
                CountMax => 10,
                Sub => [
                    {
                        Key        => 'Main1Sub1SubSub1',
                        Name       => 'Main 1 Sub 1 SubSub 1',
                        Searchable => 1,
                        Input      => {
                            Type      => 'Text',
                            Size      => 50,
                            MaxLength => 50,
                        },
                        CountMax => 10,
                    },
                    {
                        Key        => 'Main1Sub1SubSub2',
                        Name       => 'Main 1 Sub 1 SubSub 2',
                        Searchable => 1,
                        Input      => {
                            Type => 'TextArea',
                        },
                        CountMax => 10,
                    },
                ],
            },
            {
                Key        => 'Main1Sub2',
                Name       => 'Main 1 Sub 2',
                Searchable => 1,
                Input      => {
                    Type => 'TextArea',
                },
                CountMax => 10,
            },
        ],
    },
    {
        Key        => 'Main2',
        Name       => 'Main 2',
        Searchable => 1,
        Input      => {
            Type => 'TextArea',
        },
        CountMax => 10,
        Sub => [
            {
                Key        => 'Main2Sub1',
                Name       => 'Main 2 Sub 1',
                Searchable => 1,
                Input      => {
                    Type      => 'Text',
                    Size      => 50,
                    MaxLength => 50,
                },
                CountMax => 10,
            },
            {
                Key        => 'Main2Sub2',
                Name       => 'Main 2 Sub 2',
                Searchable => 1,
                Input      => {
                    Type => 'TextArea',
                },
                CountMax => 10,
            },
        ],
    },
] ";

# define the third test definition (only for search tests)
$ConfigItemDefinitions[2] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
] ";

# define the fouth test definition (only for search tests)
$ConfigItemDefinitions[3] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
] ";

# add the test classes
my @ConfigItemClassIDs;
my @ConfigItemClasses;
my @ConfigItemDefinitionIDs;
for my $Definition (@ConfigItemDefinitions) {

    # generate a random name
    my $ClassName = 'UnitTest' . int rand 1_000_000;

    # add an unittest config item class
    my $ClassID = $Self->{GeneralCatalogObject}->ItemAdd(
        Class   => 'ITSM::ConfigItem::Class',
        Name    => $ClassName,
        ValidID => 1,
        UserID  => 1,
    );

    # check class id
    if ( !$ClassID ) {

        $Self->True(
            0,
            "Can't add new config item class.",
        );
    }

    push @ConfigItemClassIDs, $ClassID;
    push @ConfigItemClasses,  $ClassName;

    # add a definition to the class
    my $DefinitionID = $Self->{ConfigItemObject}->DefinitionAdd(
        ClassID    => $ClassID,
        Definition => $Definition,
        UserID     => 1,
    );

    # check definition id
    if ( !$DefinitionID ) {

        $Self->True(
            0,
            "Can't add new config item definition.",
        );
    }

    push @ConfigItemDefinitionIDs, $DefinitionID;
}

# create some random numbers
my @ConfigItemNumbers;
for ( 1 .. 100 ) {
    push @ConfigItemNumbers, int rand 1_000_000;
}

# get class list
my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::ConfigItem::Class',
);
my %ClassListReverse = reverse %{$ClassList};

# get deployment state list
my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::ConfigItem::DeploymentState',
);
my %DeplStateListReverse = reverse %{$DeplStateList};

# get incident state list
my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::Core::IncidentState',
);
my %InciStateListReverse = reverse %{$InciStateList};

# get general catalog test list
my $GeneralCatalogList = $Self->{GeneralCatalogObject}->ItemList(
    Class => $GeneralCatalogClass,
);
my %GeneralCatalogListReverse = reverse %{$GeneralCatalogList};

# ------------------------------------------------------------ #
# define general config item tests
# ------------------------------------------------------------ #

my $ConfigItemTests = [

    # ConfigItemAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                UserID => 1,
            },
        },
    },

    # ConfigItemAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[0],
            },
        },
    },

    # invalid class id is given (check return false)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[-1] + 1,
                UserID  => 1,
            },
        },
    },

    # all required config item values are given (check returned config item values)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
        },
        ReferenceData => {
            ConfigItemGet => {
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # all required config item values are given (check number attribute)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[0],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => $UserIDs[1],
            },
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[0],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
        },
    },

    # config item with this number already exists (check return false)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[0],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[1],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[1],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[2],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name        => 'UnitTest - Class 1 ConfigItem 2 Version 1',
                    DeplStateID => $DeplStateListReverse{Production},
                    InciStateID => $InciStateListReverse{Operational},
                    UserID      => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[2],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[3],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 3 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[3],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[4],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 4 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[4],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[5],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => $UserIDs[1],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 5 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[5],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
        },
    },

    # invalid deployment state id is given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[6],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 6 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => 9999999,
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[6],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # invalid incident state id is given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[7],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 7 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => 9999999,
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[7],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # all required values are given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[8],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 8 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[8],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[8],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 8 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # all required values are given (general check with two versions)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[9],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 9 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 9 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[9],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[9],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 9 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[9],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 9 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },

    # all required values are given (check the calculation of deployment and incident state)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[10],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 10 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Planned},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 10 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[10],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[10],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 10 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Planned},
                    DeplState        => 'Planned',
                    DeplStateType    => 'preproductive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[10],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 10 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[50],
                ClassID => $ConfigItemClassIDs[2],
                UserID  => $UserIDs[2],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 1 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => $UserIDs[2],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[50],
                ClassID          => $ConfigItemClassIDs[2],
                Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => $UserIDs[2],
                ChangeBy         => $UserIDs[2],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[50],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 1 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => $UserIDs[2],
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[51],
                ClassID => $ConfigItemClassIDs[2],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 2 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 2 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[51],
                ClassID          => $ConfigItemClassIDs[2],
                Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[51],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 2 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[51],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 2 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[60],
                ClassID => $ConfigItemClassIDs[3],
                UserID  => $UserIDs[1],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 4 ConfigItem 1 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[60],
                ClassID          => $ConfigItemClassIDs[3],
                Class            => $ClassList->{ $ConfigItemClassIDs[3] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[60],
                    ClassID          => $ConfigItemClassIDs[3],
                    Class            => $ClassList->{ $ConfigItemClassIDs[3] },
                    Name             => 'UnitTest - Class 4 ConfigItem 1 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },
];

# ------------------------------------------------------------ #
# run general config item tests
# ------------------------------------------------------------ #

my $TestCount = 1;
my @ConfigItemIDs;

TEST:
for my $Test ( @{$ConfigItemTests} ) {

    # check SourceData attribute
    if ( !$Test->{SourceData} || ref $Test->{SourceData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceData found for this test.",
        );

        next TEST;
    }

    # extract source data
    my $SourceData = $Test->{SourceData};

    # add a new config item
    my $ConfigItemID;
    if ( $SourceData->{ConfigItemAdd} ) {

        # add the new config item
        $ConfigItemID = $Self->{ConfigItemObject}->ConfigItemAdd(
            %{ $SourceData->{ConfigItemAdd} },
        );

        if ($ConfigItemID) {
            push @ConfigItemIDs, $ConfigItemID;
        }
    }

    # check the config item
    if ( $Test->{ReferenceData} && $Test->{ReferenceData}->{ConfigItemGet} ) {

        $Self->True(
            $ConfigItemID,
            "Test $TestCount: ConfigItemAdd() - Add new config item. Insert success.",
        );

        next TEST if !$ConfigItemID;
    }
    else {

        $Self->False(
            $ConfigItemID,
            "Test $TestCount: ConfigItemAdd() - Add new config item. Return false.",
        );
    }

    # add all defined versions
    my @VersionIDs;
    if ( $SourceData->{VersionAdd} ) {

        for my $Version ( @{ $SourceData->{VersionAdd} } ) {

            if ($ConfigItemID) {
                $Version->{ConfigItemID} = $ConfigItemID;
            }

            # add a new version
            my $VersionID = $Self->{ConfigItemObject}->VersionAdd(
                %{$Version},
            );

            if ($VersionID) {
                push @VersionIDs, $VersionID;
            }
        }
    }

    # check the config item
    my $ConfigItemData;
    if ( $Test->{ReferenceData} && $Test->{ReferenceData}->{ConfigItemGet} ) {

        # get the confi item data
        $ConfigItemData = $Self->{ConfigItemObject}->ConfigItemGet(
            ConfigItemID => $ConfigItemID,
        );

        if ( !$ConfigItemData ) {

            $Self->True(
                0,
                "Test $TestCount: ConfigItemGet() - get config item data."
            );
        }

        # check all config item attributes
        my $Counter = 0;
        for my $Attribute ( keys %{ $Test->{ReferenceData}->{ConfigItemGet} } ) {

            # set content if values are undef
            if ( !defined $ConfigItemData->{$Attribute} ) {
                $ConfigItemData->{$Attribute} = 'UNDEF-unittest';
            }
            if ( !defined $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute} ) {
                $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute} = 'UNDEF-unittest';
            }

            # check attributes
            $Self->Is(
                $ConfigItemData->{$Attribute},
                $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute},
                "Test $TestCount: ConfigItemGet() - $Attribute",
            );

            $Counter++;
        }
    }

    # check the versions
    if (
        $Test->{ReferenceData}
        && $Test->{ReferenceData}->{VersionGet}
        && @{ $Test->{ReferenceData}->{VersionGet} }
        )
    {

        $Self->Is(
            scalar @VersionIDs,
            scalar @{ $Test->{ReferenceData}->{VersionGet} },
            "Test $TestCount: VersionAdd() - correct number of versions",
        );

        next TEST if !$ConfigItemID;
    }
    else {

        $Self->False(
            scalar @VersionIDs,
            "Test $TestCount: VersionAdd() - no versions exits",
        );
    }

    next TEST if !$Test->{ReferenceData};
    next TEST if !$Test->{ReferenceData}->{VersionGet};

    my $Counter           = 0;
    my $LastVersionIDMust = 'UNDEF-unittest';
    VERSIONID:
    for my $VersionID (@VersionIDs) {

        # get this version
        my $VersionData = $Self->{ConfigItemObject}->VersionGet(
            VersionID  => $VersionID,
            XMLDataGet => 1,
        );

        if ( !$VersionData ) {

            $Self->True(
                0,
                "Test $TestCount: VersionGet() - get version data."
            );

            next VERSIONID;
        }

        # save last version id
        $LastVersionIDMust = $VersionData->{VersionID};

        # check all version attributes
        for my $Attribute ( keys %{ $Test->{ReferenceData}->{VersionGet}->[$Counter] } ) {

            # extract the needed attributes
            my $VersionAttribute   = $VersionData->{$Attribute};
            my $ReferenceAttribute = $Test->{ReferenceData}->{VersionGet}->[$Counter]->{$Attribute};

            # set content if values are undef
            if ( !defined $VersionAttribute ) {
                $VersionAttribute = 'UNDEF-unittest';
            }
            if ( !defined $ReferenceAttribute ) {
                $ReferenceAttribute = 'UNDEF-unittest';
            }

            if ( $Attribute eq 'XMLDefinition' || $Attribute eq 'XMLData' ) {

                # turn off all pretty print
                $Data::Dumper::Indent = 0;

                # dump the attribute from VersionGet()
                $VersionAttribute = Data::Dumper::Dumper($VersionAttribute);

                # dump the reference attribute
                $ReferenceAttribute = Data::Dumper::Dumper($ReferenceAttribute);
            }

            # check attributes
            $Self->Is(
                $VersionAttribute,
                $ReferenceAttribute,
                "Test $TestCount: VersionGet() - $Attribute",
            );
        }

        $Counter++;
    }

    # prepare last version id
    my $LastVersionIDActual = 'UNDEF-unittest';
    if ( $ConfigItemData->{LastVersionID} ) {
        $LastVersionIDActual = $ConfigItemData->{LastVersionID};
    }

    # check last version id
    $Self->Is(
        $ConfigItemData->{LastVersionID},
        $LastVersionIDMust,
        "Test $TestCount: last version id identical",
    );
}
continue {
    $TestCount++;
}

# ------------------------------------------------------------ #
# define general config item search tests
# ------------------------------------------------------------ #

my $ConfigItemSearchTests = [

    # search ALL config items in the two test classes
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the number param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number => $ConfigItemNumbers[50],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the number param with wildcards
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number => '*' . $ConfigItemNumbers[50] . '*',
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the number param with wildcards but with deactivated wildcard feature
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number         => '*' . $ConfigItemNumbers[50] . '*',
            UsingWildcards => 0,
        },
        ReferenceData => [],
    },

    # test the deployment state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Production} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Maintenance} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the deployment state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Operational} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Incident} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Incident},
                $InciStateListReverse{Operational},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the order by param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            OrderBy => 'CreateBy',
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
            $ConfigItemNumbers[50],
        ],
    },

    # test the limit param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 100,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 3,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 2,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the limit param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 0,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the create by param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            CreateBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the create by param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            CreateBy => [ $UserIDs[1],            $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[60],
        ],
    },

    # test the change by param
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ChangeBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the change by param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [1],
        },
        ReferenceData => [],
    },

    # test the change by param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [ $UserIDs[1] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the change by param in combination of the class id
    {
        Function => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # search ALL config items in the two test classes using the version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name => 'UnitTest - Class 3 ConfigItem 1 Version 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the name param with an wildcard
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name => 'UnitTest - * 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param with an wildcard and a previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name                  => 'UnitTest - * 1',
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param with wildcards
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name => 'UnitTest - Class 3*',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the name param with wildcards but with deactivated wildcard feature
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name           => 'UnitTest - Class 3*',
            ClassIDs       => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            UsingWildcards => 0,
        },
        ReferenceData => [],
    },

    # test the last version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name => 'UnitTest - Class 3 ConfigItem 2 Version 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [],
    },

    # test the PreviousVersionSearch param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name                  => 'UnitTest - Class 3 ConfigItem 2 Version 1',
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 100,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 3,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 2,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Production} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Maintenance} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs          => [ $DeplStateListReverse{Production} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs          => [ $DeplStateListReverse{Maintenance} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Operational},
                $InciStateListReverse{Incident},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Operational} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Incident} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Operational},
                $InciStateListReverse{Incident},
            ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs          => [ $InciStateListReverse{Operational} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs          => [ $InciStateListReverse{Incident} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },
];

# ------------------------------------------------------------ #
# run general config item search tests
# ------------------------------------------------------------ #

TEST:
for my $Test ( @{$ConfigItemSearchTests} ) {

    # check SearchData attribute
    if ( !$Test->{SearchData} || ref $Test->{SearchData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SearchData found for this test.",
        );

        next TEST;
    }

    if ( !$Test->{Function} || ref $Test->{Function} ne 'ARRAY' || !@{ $Test->{Function} } ) {
        $Test->{Function} = ['ConfigItemSearchExtended'];
    }

    for my $Function ( @{ $Test->{Function} } ) {

        # start search
        my $ConfigItemList = $Self->{ConfigItemObject}->$Function(
            %{ $Test->{SearchData} },
        );

        # check the config item list
        if ( $Test->{ReferenceData} ) {

            $Self->True(
                $ConfigItemList && ref $ConfigItemList eq 'ARRAY',
                "Test $TestCount: $Function() - List is an array reference.",
            );

            next TEST if !$ConfigItemList;
        }
        else {

            $Self->False(
                $ConfigItemList,
                "Test $TestCount: $Function() - Return false.",
            );

            next TEST if !$ConfigItemList;
        }

        # check number of founded config items
        $Self->Is(
            scalar @{$ConfigItemList},
            scalar @{ $Test->{ReferenceData} },
            "Test $TestCount: $Function() - correct number of founded config items",
        );

        my @ReferenceList;
        for my $Number ( @{ $Test->{ReferenceData} } ) {

            # find id of the item
            $Self->{DBObject}->Prepare(
                SQL => "SELECT id FROM configitem WHERE "
                    . "configitem_number = '$Number' "
                    . "ORDER BY id DESC",
                Limit => 1,
            );

            # fetch the result
            my $ConfigItemID;
            while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
                $ConfigItemID = $Row[0];
            }

            push @ReferenceList, $ConfigItemID;
        }

        # turn off all pretty print
        $Data::Dumper::Indent = 0;

        # dump the list from ConfigItemSearchExtended()
        my $ConfigItemString = Data::Dumper::Dumper($ConfigItemList);

        # dump the reference string
        my $ReferenceString = Data::Dumper::Dumper( \@ReferenceList );

        # check arrays
        $Self->Is(
            $ConfigItemString,
            $ReferenceString,
            "Test $TestCount: $Function() - List",
        );
    }
}

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# get current class list
$ClassList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::ConfigItem::Class',
);

# set unittest classes invalid
ITEMID:
for my $ItemID ( keys %{$ClassList} ) {

    next ITEMID if $ClassList->{$ItemID} !~ m{ \A UnitTest }xms;

    # update item
    $Self->{GeneralCatalogObject}->ItemUpdate(
        ItemID  => $ItemID,
        Name    => $ClassList->{$ItemID},
        ValidID => 2,
        UserID  => 1,
    );
}

# delete the test config items
for my $ConfigItemID (@ConfigItemIDs) {
    $Self->{ConfigItemObject}->ConfigItemDelete(
        ConfigItemID => $ConfigItemID,
        UserID       => 1,
    );
}

1;
