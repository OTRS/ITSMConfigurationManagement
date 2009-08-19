# --
# ITSMConfigItemHistory.t - config item tests
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemHistory.t,v 1.4 2009-08-19 22:32:16 mh Exp $
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
use Kernel::System::ITSMConfigItem::History;
use Kernel::System::User;

$Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
$Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );
$Self->{UserObject}           = Kernel::System::User->new( %{$Self} );
$Self->{HistoryObject}        = Kernel::System::ITSMConfigItem::History->new( %{$Self} );

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

    for my $Counter ( 1 .. 1 ) {

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

# add a new item
my $ItemID = $Self->{GeneralCatalogObject}->ItemAdd(
    Class   => $GeneralCatalogClass,
    Name    => 'HistoryCheck1',
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

# define the first test definition (all provided data types)
my @ConfigItemDefinitions = (
    " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
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
] ",
);

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
for ( 1 .. 1 ) {
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

    # all required values are given (check the calculation of deployment and incident state)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[0],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 1 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Planned},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 1 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[0],
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
                    Number           => $ConfigItemNumbers[0],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 1 Version 1',
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
                    Number           => $ConfigItemNumbers[0],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 1 Version 2',
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
            HistoryGet => [
                {
                    HistoryType   => 'ConfigItemCreate',
                    HistoryTypeID => 1,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'VersionCreate',
                    HistoryTypeID => 6,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'DefinitionUpdate',
                    HistoryTypeID => 8,
                    Comment       => $ConfigItemDefinitionIDs[0],
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'NameUpdate',
                    HistoryTypeID => 5,
                    Comment       => 'UnitTest - Class 1 ConfigItem 1 Version 1',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'IncidentStateUpdate',
                    HistoryTypeID => 9,
                    Comment       => $InciStateListReverse{Operational} . '%%',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'DeploymentStateUpdate',
                    HistoryTypeID => 10,
                    Comment       => $DeplStateListReverse{Planned} . '%%',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'VersionCreate',
                    HistoryTypeID => 6,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'NameUpdate',
                    HistoryTypeID => 5,
                    Comment       => 'UnitTest - Class 1 ConfigItem 1 Version 2',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'IncidentStateUpdate',
                    HistoryTypeID => 9,
                    Comment       => $InciStateListReverse{Incident} . '%%'
                        . $InciStateListReverse{Operational},
                    CreateBy => 1,
                },
                {
                    HistoryType   => 'DeploymentStateUpdate',
                    HistoryTypeID => 10,
                    Comment       => $DeplStateListReverse{Maintenance} . '%%'
                        . $DeplStateListReverse{Planned},
                    CreateBy => 1,
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

    # check history entries
    if (
        $Test->{ReferenceData}
        && $Test->{ReferenceData}->{HistoryGet}
        && @{ $Test->{ReferenceData}->{HistoryGet} }
        )
    {
        my $CompleteHistory = $Self->{HistoryObject}->HistoryGet(
            ConfigItemID => $ConfigItemID,
        );

        # check nr of history entries
        $Self->Is(
            scalar @{ $Test->{ReferenceData}->{HistoryGet} },
            scalar @{$CompleteHistory},
            "Test $TestCount: nr of history entries",
        );

        CHECKNR: for my $CheckNr ( 0 .. $#{$CompleteHistory} ) {
            my $Check = $Test->{ReferenceData}->{HistoryGet}->[$CheckNr];
            my $Data  = $CompleteHistory->[$CheckNr];

            next CHECKNR unless $Check && $Data;

            for my $Key ( keys %{$Check} ) {

                # check history data
                $Self->Is(
                    $Check->{$Key},
                    $Data->{$Key},
                    "Test $TestCount: $Key",
                );
            }
        }
    }

}
continue {
    $TestCount++;
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
