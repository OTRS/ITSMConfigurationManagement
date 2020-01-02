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

if ( $Selenium->{browser_name} ne 'firefox' ) {
    $Self->True(
        1,
        "PDF test currently only supports Firefox",
    );
    return 1;
}

$Selenium->RunTest(
    sub {

        my $Helper               = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
        my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');

        # Get 'Hardware' catalog class IDs.
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Hardware',
        );
        my $HardwareConfigItemID = $ConfigItemDataRef->{ItemID};

        # Get 'Production' deployment state IDs.
        my $ProductionDeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $ProductionDeplStateID = $ProductionDeplStateDataRef->{ItemID};

        # Create ConfigItem number.
        my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
            Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
            ClassID => $HardwareConfigItemID,
        );
        $Self->True(
            $ConfigItemNumber,
            "ConfigItem number is created - $ConfigItemNumber"
        );

        # Add the new ConfigItem.
        my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
            Number  => $ConfigItemNumber,
            ClassID => $HardwareConfigItemID,
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
            DeplStateID  => $ProductionDeplStateID,
            InciStateID  => 1,
            UserID       => 1,
            ConfigItemID => $ConfigItemID,
        );
        $Self->True(
            $VersionID,
            "Version is created - ID $VersionID"
        );

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

        # Navigate to AgentITSConfigItemZoom screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItemID");

        # Check if there is the link to AgentITSMConfigItemPrint screen.
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('a[href*=\"Action=AgentITSMConfigItemPrint;ConfigItemID=$ConfigItemID\"]').length;"
        );

        # Go to AgentITSMConfigItemPrint screen for test ConfigItem.
        $Selenium->get(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemPrint;ConfigItemID=$ConfigItemID;VersionID=$VersionID"
        );

        # Wait until print screen is loaded.
        ACTIVESLEEP:
        for my $Second ( 1 .. 30 ) {
            if ( index( $Selenium->get_page_source(), "printed by" ) > -1, ) {
                $Self->True(
                    index( $Selenium->get_page_source(), "printed by" ) > -1,
                    "Print screen is loaded",
                ) || die;
                last ACTIVESLEEP;
            }
            sleep 1;
        }

        # Get test print values.
        my @ConfigItemPrint = (
            {
                Value   => $ConfigItemNumber,
                Message => "ConfigItem# $ConfigItemNumber - found",
            },
            {
                Value   => 'SeleniumTest',
                Message => "ConfigItem: SeleniumTest - found",
            },
            {
                Value   => 'Hardware',
                Message => "Class: Hardware - found",
            },
            {
                Value   => 'Production',
                Message => "Current Deployment State: Production - found",
            },
            {
                Value   => 'Operational',
                Message => "Current Incident State: Operational - found",
            },
            {
                Value   => 'Version 1',
                Message => "Current Version: Version 1 - found",
            },
        );

        # Check for printed values.
        for my $ConfigItemValue (@ConfigItemPrint) {
            $Self->True(
                index( $Selenium->get_page_source(), $ConfigItemValue->{Value} ) > -1,
                "$ConfigItemValue->{Message}",
            );
        }

        # Delete created test ConfigItem.
        my $Success = $ConfigItemObject->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => 1,
        );
        $Self->True(
            $Success,
            "ConfigItem is deleted - ID $ConfigItemID",
        );
    }
);

1;
