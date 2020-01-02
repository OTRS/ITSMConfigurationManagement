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
        my @ConfigItems;
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

            push @ConfigItems,
                {
                ID               => $ConfigItemID,
                ConfigItemNumber => $ConfigItemNumber,
                };
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
        for my $SelectConfigItem (@ConfigItems) {

            # Don't click on third test ConfigItem.
            if ( $SelectConfigItem->{ID} ne $ConfigItems[2]->{ID} ) {
                $Selenium->find_element("//input[\@value='$SelectConfigItem->{ID}']")->click();
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
        $Selenium->find_element( "#LinkTogetherAnother", 'css' )->send_keys( $ConfigItems[2]->{ConfigItemNumber} );
        $Selenium->find_element( "#LinkType option[value='Includes::Target']", 'css' )->click();

        # Submit bulk changes
        $Selenium->find_element( "#submitRichText", 'css' )->click();

        # Switch window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # Navigate to first created test ConfigItems zoom view.
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItems[1]->{ID}"
        );

        # Check for other two created test ConfigItems.
        # Verify that link action in bulk screen was success.
        my $Count = 1;
        ITEM:
        for my $CheckConfigItem (@ConfigItems) {

            next ITEM if $ConfigItems[1]->{ConfigItemNumber} == $CheckConfigItem->{ConfigItemNumber};
            $Self->True(
                $Selenium->find_element(
                    "//a[\@class=\'AsBlock LinkObjectLink\'][contains(.,\'$CheckConfigItem->{ConfigItemNumber}\')]"
                ),
                "Test ConfigItem number $CheckConfigItem->{ConfigItemNumber} - found",
            );
            $Count++;
        }

        $Self->Is(
            $Selenium->execute_script("return \$('.MasterAction td:eq(1) span').text();"),
            'Repair',
            "Deployment state is Repair.",
        );

        # Delete created test ConfigItems.
        for my $ConfigItemDelete (@ConfigItems) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete->{ID},
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "Config item is deleted - ID $ConfigItemDelete->{ID}",
            );
        }
    }
);

1;
