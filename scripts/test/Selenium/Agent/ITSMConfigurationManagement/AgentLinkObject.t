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
        my $TicketObject         = $Kernel::OM->Get('Kernel::System::Ticket');
        my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');

        # Get Computer and Hardware catalog class IDs.
        my @ConfigItemClassIDs;
        for my $ConfigItem (qw(Computer Hardware)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItem,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # Get 'Production' deployment state ID.
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        # Create two test ConfigItems for Computer and Hardware ConfigItem class.
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        my @VersionIDs;
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
            push @ConfigItemIDs, $ConfigItemID;

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
            push @VersionIDs, $VersionID;

        }

        # Create test service.
        my $ServiceName = "Service" . $Helper->GetRandomID();
        my $ServiceID   = $Kernel::OM->Get('Kernel::System::Service')->ServiceAdd(
            Name        => $ServiceName,
            ValidID     => 1,
            Comment     => 'Selenium Test Service',
            UserID      => 1,
            TypeID      => 2,
            Criticality => '3 normal',
        );
        $Self->True(
            $ServiceID,
            "Service is created - ID $ServiceID"
        );

        # Create test ticket.
        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN           => $TicketNumber,
            Title        => 'SeleniumTestTicket',
            Queue        => 'Raw',
            Lock         => 'unlock',
            Priority     => '3 normal',
            State        => 'new',
            CustomerID   => '123465',
            CustomerUser => 'customer@example.com',
            OwnerID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TicketID,
            "Ticket is created - ID $TicketID"
        );

        # Create test user and login.
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'itsm-configitem', 'itsm-service' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AgentITSMConfigItemZoom screen.
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItemIDs[0];Version=$VersionIDs[0]"
        );

        # Click on 'Link' menu.
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=ITSMConfigItem;SourceKey=$ConfigItemIDs[0]\' )]"
        )->click();

        # Switch to 'Link' window.
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # Wait until page has loaded, if necessary.
        $Selenium->WaitFor(
            JavaScript => 'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        # Select to link with test Hardware ConfigItem.
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('ITSMConfigItem::$ConfigItemClassIDs[1]').trigger('redraw.InputField').trigger('change');"
        );

        sleep 2;
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#SEARCH\\\\:\\\\:Number").length;'
        );

        # Check 'Link' screen for two ConfigItems.
        for my $ID (
            qw(TargetIdentifier SubmitSearch)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # Search ConfigItem by its number and select result.
        $Selenium->find_element("//input[\@id='SEARCH::Number']")->send_keys( $ConfigItemNumbers[1] );
        $Selenium->find_element( "#SubmitSearch", 'css' )->VerifiedClick();

        $Selenium->find_element( '#LinkTargetKeys', 'css' )->click();
        sleep 1;

        # Select 'AlternativeTo' link type.
        $Selenium->find_element("//button[\@id='AddLinks']")->VerifiedClick();

        # Select to link with test Service.
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('Service').trigger('redraw.InputField').trigger('change');"
        );

        sleep 2;
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#SEARCH\\\\:\\\\:Name").length;'
        );

        # Search Service by name and select result.
        $Selenium->find_element("//input[\@id='SEARCH::Name']")->send_keys($ServiceName);
        $Selenium->find_element( "#SubmitSearch", 'css' )->VerifiedClick();
        $Selenium->find_element("//input[\@id='LinkTargetKeys'][\@value='$ServiceID']")->click();

        # Select 'Relevant to' link type.
        $Selenium->execute_script(
            "\$('#TypeIdentifier').val('RelevantTo::Source').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element("//button[\@id='AddLinks']")->VerifiedClick();

        # Select to link with test Ticket.
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('Ticket').trigger('redraw.InputField').trigger('change');"
        );

        sleep 2;
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#SEARCH\\\\:\\\\:TicketNumber").length;'
        );

        # Search Ticket by number and select result.
        $Selenium->find_element("//input[\@id='SEARCH::TicketNumber']")->send_keys($TicketNumber);
        $Selenium->find_element( "#SubmitSearch", 'css' )->VerifiedClick();

        $Selenium->find_element("//input[\@id='LinkTargetKeys'][\@value='$TicketID']")->click();

        # Select 'Depends to' link type.
        $Selenium->execute_script(
            "\$('#TypeIdentifier').val('DependsOn::Source').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element("//button[\@id='AddLinks']")->VerifiedClick();

        # Close link window, return to Zoom view and refresh page.
        $Selenium->find_element( "#LinkAddCloseLink", 'css' )->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );
        $Selenium->VerifiedRefresh();

        # Check for linked values in AgentITSMConfigItemZoom screen.
        for my $CheckValues ( $ConfigItemNumbers[1], $ServiceName, $TicketNumber ) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckValues ) > -1,
                "Linked value $CheckValues - found",
            );
        }

        # Click on 'Link' menu and switch window.
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=ITSMConfigItem;SourceKey=$ConfigItemIDs[0]\' )]"
        )->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # Wait until page has loaded, if necessary.
        $Selenium->WaitFor(
            JavaScript => 'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        # Click 'go to manage links screen'.
        $Selenium->find_element("//a[contains(\@href, \'#ManageLinks\' )]")->click();

        # Wait for the manage links tab to show up.
        $Selenium->WaitFor(
            JavaScript =>
                'return typeof($) === "function" && $("div[data-id=ManageLinks]:visible").length && parseInt($("div[data-id=ManageLinks]").css("opacity"), 10) == 1'
        );

        # Select all linked items and delete links.
        $Selenium->find_element("//input[\@value='ITSMConfigItem::$ConfigItemIDs[1]::AlternativeTo']")->click();
        $Selenium->find_element("//button[\@title='Delete links']")->VerifiedClick();

        $Selenium->find_element("//input[\@value='Service::$ServiceID\::RelevantTo']")->click();
        $Selenium->find_element("//button[\@title='Delete links']")->VerifiedClick();

        $Selenium->find_element("//input[\@value='Ticket::$TicketID\::DependsOn']")->click();
        $Selenium->find_element("//button[\@title='Delete links']")->VerifiedClick();

        # Close link window, return to Zoom view and refresh page.
        $Selenium->find_element( "#LinkAddCloseLink", 'css' )->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );
        $Selenium->VerifiedRefresh();

        # Check for no linked values in AgentITSMConfigItemZoom screen.
        for my $CheckValues ( $ConfigItemNumbers[1], $ServiceName, $TicketNumber ) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckValues ) == -1,
                "Linked value $CheckValues - not found",
            );
        }

        # Delete test Ticket.
        my $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket is deleted - ID $TicketID "
        );

        # Delete test ConfigItem.
        for my $ConfigItemDelete (@ConfigItemIDs) {
            $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemDelete",
            );
        }

        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # Delete test service and its preferences.
        $Success = $DBObject->Do(
            SQL => "DELETE FROM service_preferences WHERE service_id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service preferences is deleted",
        );
        $Success = $DBObject->Do(
            SQL => "DELETE FROM service WHERE id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service is deleted - ID $ServiceID",
        );
    }
);

1;
