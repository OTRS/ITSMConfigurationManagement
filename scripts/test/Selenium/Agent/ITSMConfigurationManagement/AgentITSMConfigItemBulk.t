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
        my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');

        # Get 'Computer' catalog class IDs.
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Computer',
        );
        my $ComputerConfigItemID = $ConfigItemDataRef->{ItemID};

        # Get 'Production' and 'Repair' deployment state IDs.
        my @DeplStateIDs;
        for my $DeplState (qw (Production Repair)) {
            my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::DeploymentState',
                Name  => $DeplState,
            );
            push @DeplStateIDs, $DeplStateDataRef->{ItemID};
        }

        # Create three test ConfigItems for 'Computer' ConfigItem class.
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        for my $ITSMConfigItem ( 1 .. 3 ) {

            # Create ConfigItem number.
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ComputerConfigItemID,
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber",
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            # Add the new ConfigItem.
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ComputerConfigItemID,
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
                DeplStateID  => $DeplStateIDs[0],
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

        # Select two created test ConfigItems.
        for my $SelectConfigItem (@ConfigItemIDs) {

            # Don't click on third test ConfigItem.
            if ( $SelectConfigItem ne $ConfigItemIDs[2] ) {
                $Selenium->find_element("//input[\@value='$SelectConfigItem']")->click();
            }
        }

        # Click on bulk action.
        $Selenium->find_element("//*[text()='Bulk']")->click();

        # Switch to 'Bulk' window.
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#DeplStateID").length;' );

        # Check screen
        for my $ID (
            qw(DeplStateID InciStateID LinkTogether LinkTogetherLinkType LinkTogetherAnother LinkType submitRichText)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # Change deployment state to 'Repair' for test ConfigItems
        $Selenium->execute_script("\$('#DeplStateID').val('$DeplStateIDs[1]');");

        # link 'Alternative to' test ConfigItems together
        $Selenium->find_element( "#LinkTogether option[value='1']",                           'css' )->click();
        $Selenium->find_element( "#LinkTogetherLinkType option[value='ConnectedTo::Source']", 'css' )->click();

        # link third test ConfigItem as part of first two
        $Selenium->find_element( "#LinkTogetherAnother", 'css' )->send_keys( $ConfigItemNumbers[2] );
        $Selenium->find_element( "#LinkType option[value='Includes::Target']", 'css' )->click();

        # Submit bulk changes
        $Selenium->find_element( "#submitRichText", 'css' )->click();

        # Switch window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # Wait for reload to kick in.
        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete;'
        );

        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#ConfigItemID_$ConfigItemIDs[1]').length;"
        );
        sleep 1;

        # Click on first created test ConfigItems to enter zoom view.
        $Selenium->execute_script("\$('#ConfigItemID_$ConfigItemIDs[1]').click();");
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#ITSMTree").length;' );

        # Check for other two created test ConfigItems.
        # Verify that link action in bulk screen was success.
        for my $CheckConfigItem (@ConfigItemNumbers) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckConfigItem ) > -1,
                "Test ConfigItem number $CheckConfigItem - found",
            );
        }

        $Self->Is(
            $Selenium->execute_script("return \$('.MasterAction td:eq(1) span').text();"),
            'Repair',
            "Deployment state is Repair.",
        );

        # Delete created test ConfigItems.
        for my $ConfigItemDelete (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "Config item is deleted - ID $ConfigItemDelete",
            );
        }
    }
);

1;
