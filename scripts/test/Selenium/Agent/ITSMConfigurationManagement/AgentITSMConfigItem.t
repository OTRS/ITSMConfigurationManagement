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

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        my $Helper               = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
        my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');

        my %ShowColumnsByClassSysConfig = $Kernel::OM->Get('Kernel::System::SysConfig')->SettingGet(
            Name => 'ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumnsByClass',
        );

        # Enable AgentITSMConfigItem###ShowColumnsByClass sysconfig item.
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumnsByClass',
            Value => $ShowColumnsByClassSysConfig{EffectiveValue},
        );

        # Get catalog class IDs.
        my @ConfigItemClassIDs;
        for my $ConfigItemClass (qw(Computer Hardware Location Network Software)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemClass,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # Get 'Production' deployment state ID.
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        # Create ConfigItem for each ConfigItem class.
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        for my $ITSMConfigItem (@ConfigItemClassIDs) {

            # Create ConfigItem number.
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ITSMConfigItem,
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber"
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            # Add the new ConfigItem.
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ITSMConfigItem,
                UserID  => 1,
            );
            $Self->True(
                $ConfigItemID,
                "ConfigItem is created - ID $ConfigItemID"
            );

            # Add a new version.
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => 'SeleniumTest',
                DefinitionID => 1,
                DeplStateID  => $DeplStateID,
                InciStateID  => 1,
                UserID       => 1,
                ConfigItemID => $ConfigItemID,
            );
            $Self->True(
                $VersionID,
                "Version is created - ID $VersionID"
            );
            push @ConfigItemIDs, $ConfigItemID;
        }

        # Create test user and login.
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AgentITSMConfigItem, sorted by created time.
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItem;Filter=All;View=;;SortBy=ChangeTime;OrderBy=Down"
        );

        # Check for created test ConfigItems with 'All' filter active
        for my $AllConfigItem (@ConfigItemNumbers) {
            $Self->True(
                $Selenium->find_element("//div[contains(\@title, \'$AllConfigItem\' )]"),
                "Test ConfigItem number $AllConfigItem - found",
            );
        }

        # Check each of ConfigItem class filters for there respective test ConfigItem
        my $Count = 0;
        for my $CheckConfigItem (@ConfigItemIDs) {

            # Click on ConfigItem class
            $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentITSMConfigItem;SortBy=ChangeTime;OrderBy=Down;View=;Filter=$ConfigItemClassIDs[$Count]' )]"
            )->VerifiedClick();

            # Check for table structure
            $Selenium->find_element( "#OverviewBody .TableSmall", 'css' );

            # Check for ConfigItem number
            $Self->True(
                $Selenium->find_element("//div[contains(\@title, \'$ConfigItemNumbers[$Count]\' )]"),
                "Test ConfigItem number $ConfigItemNumbers[$Count] - found",
            );
            $Count++;

            # Check if there is column Create Time for Computer class
            # See bug#14049
            my $ConfigItemData = $ConfigItemObject->ConfigItemGet(
                ConfigItemID => $CheckConfigItem,
            );
            if ( $ConfigItemData->{Class} eq 'Computer' ) {
                $Self->True(
                    $Selenium->find_element("//a[contains(.,'Create Time')]"),
                    "There is column 'CreateTime', enabled by sysconfig item  AgentITSMConfigItem###ShowColumnsByClass",
                );
            }
        }

        # Delete created test ConfigItems.
        for my $ConfigItemDelete (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemDelete",
            );
        }
    }
);

1;
