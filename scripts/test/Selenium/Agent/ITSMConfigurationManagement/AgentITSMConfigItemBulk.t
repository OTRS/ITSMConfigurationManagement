# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get selenium object
my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # get needed objects
        my $Helper               = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get 'Computer' catalog class IDs
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Computer',
        );
        my $ComputerConfigItemID = $ConfigItemDataRef->{ItemID};

        # get 'Production' and 'Repair' deployment state IDs
        my @DeplStateIDs;
        for my $DeplState (qw (Production Repair)) {
            my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::DeploymentState',
                Name  => $DeplState,
            );
            push @DeplStateIDs, $DeplStateDataRef->{ItemID}
        }

        # get config item object
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        # create three test config items for 'Computer' config item class
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        for my $ITSMConfigItem ( 1 .. 3 ) {

            # create config item number
            my $Number = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ComputerConfigItemID,
            );
            push @ConfigItemNumbers, $Number;

            # add the new config item
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $Number,
                ClassID => $ComputerConfigItemID,
                UserID  => 1,
            );

            # add a new version
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => 'SeleniumTest',
                DefinitionID => 1,
                DeplStateID  => $DeplStateIDs[0],
                InciStateID  => 1,
                UserID       => 1,
                ConfigItemID => $ConfigItemID,
            );
            push @ConfigItemIDs, $ConfigItemID;
        }

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # navigate to AgentITSMConfigItem, sorted by created time
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        $Selenium->get(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItem;Filter=All;View=;;SortBy=ChangeTime;OrderBy=Down"
        );

        # select two created test config items
        for my $SelectConfigItem (@ConfigItemIDs) {

            # dont click on third test config item
            if ( $SelectConfigItem ne $ConfigItemIDs[2] ) {
                $Selenium->find_element("//input[\@value='$SelectConfigItem']")->click();
            }
        }

        # click on bulk action
        $Selenium->find_element("//*[text()='Bulk']")->click();

        # switch to 'Bulk' window
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # check screen
        for my $ID (
            qw(DeplStateID InciStateID LinkTogether LinkTogetherLinkType LinkTogetherAnother LinkType submitRichText)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # change deployment state to 'Repair' for test config items
        $Selenium->find_element( "#DeplStateID option[value='$DeplStateIDs[1]']", 'css' )->click();

        # link 'Alternative to' test config items together
        $Selenium->find_element( "#LinkTogether option[value='1']",                           'css' )->click();
        $Selenium->find_element( "#LinkTogetherLinkType option[value='ConnectedTo::Source']", 'css' )->click();

        # link third test config item as part of first two
        $Selenium->find_element( "#LinkTogetherAnother", 'css' )->send_keys( $ConfigItemNumbers[2] );
        $Selenium->find_element( "#LinkType option[value='Includes::Target']", 'css' )->click();

        # submit bulk changes
        $Selenium->find_element( "#submitRichText", 'css' )->click();

        # switch window
        $Selenium->switch_to_window( $Handles->[0] );

        # click on first created test config items to enter zoom view
        $Selenium->find_element( "#ConfigItemID_$ConfigItemIDs[1]", 'css' )->click();

        # check for other two created test config items
        # verify that link action in bulk screen was success
        for my $CheckConfigItem (@ConfigItemNumbers) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckConfigItem ) > -1,
                "Test config item number $CheckConfigItem - found",
            );
        }

        # click on history and change window
        $Selenium->find_element("//*[text()='History']")->click();
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # check state deployment change of test config item
        my $CheckHistory = 'Deployment state updated (new="Repair", "Production; old=)';
        $Self->True(
            index( $Selenium->get_page_source(), $CheckHistory ) > -1,
            "$CheckHistory - found",
        );

        # delete created test config items
        for my $ConfigItemDelete (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "Deleted ConfigItem - $ConfigItemDelete",
            );
        }
        }
);

1;
