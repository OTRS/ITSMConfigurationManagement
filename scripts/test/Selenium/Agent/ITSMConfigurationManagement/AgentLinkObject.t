# --
# Copyright (C) 2001-2015 OTRS AG, http://otrs.com/
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

        # get Computer and Hardware catalog class IDs
        my @ConfigItemClassIDs;
        for my $ConfigItem (qw(Computer Hardware)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItem,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # get 'Production' deployment state ID
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        # get ConfigItem object
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        # create two test ConfigItems for Computer and Hardware ConfigItem class
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        my @VersionIDs;
        for my $ITSMConfigItem (@ConfigItemClassIDs) {

            # create ConfigItem number
            my $Number = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ITSMConfigItem,
            );
            push @ConfigItemNumbers, $Number;

            # add the new ConfigItem
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $Number,
                ClassID => $ITSMConfigItem,
                UserID  => 1,
            );
            push @ConfigItemIDs, $ConfigItemID;

            # add a new version
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => 'SeleniumTest',
                DefinitionID => 1,
                DeplStateID  => $DeplStateID,
                InciStateID  => 1,
                UserID       => 1,
                ConfigItemID => $ConfigItemID,
            );
            push @VersionIDs, $VersionID;

        }

        # create test service
        my $ServiceName = "Service" . $Helper->GetRandomID();
        my $ServiceID   = $Kernel::OM->Get('Kernel::System::Service')->ServiceAdd(
            Name        => $ServiceName,
            ValidID     => 1,
            Comment     => 'Selenium Test Service',
            UserID      => 1,
            TypeID      => 2,
            Criticality => '3 normal',
        );

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test ticket
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

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'itsm-configitem', 'itsm-service' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate te AgentITSMConfigItemZoom screen
        $Selenium->get(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItemIDs[0];Version=$VersionIDs[0]"
        );

        # click on 'Link' menu
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=ITSMConfigItem;SourceKey=$ConfigItemIDs[0]\' )]"
        )->click();

        # switch to 'Link' window
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # select to link with test Hardware ConfigItem
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('ITSMConfigItem::$ConfigItemClassIDs[1]').trigger('redraw.InputField').trigger('change');"
        );

        # check 'Link' screen for two ConfigItems
        for my $ID (
            qw(TargetIdentifier SubmitSelect SubmitSearch)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # search ConfigItem by its number and select result
        $Selenium->find_element("//input[\@id='SEARCH::Number']")->send_keys( $ConfigItemNumbers[1] );
        $Selenium->find_element( "#SubmitSearch", 'css' )->click();
        $Selenium->find_element("//input[\@id='LinkTargetKeys'][\@value='$ConfigItemIDs[1]']")->click();

        # select 'AlternativeTo' link type
        $Selenium->find_element("//button[\@id='AddLinks']")->click();

        # select to link with test Service
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('Service').trigger('redraw.InputField').trigger('change');");

        # search Service by name and select result
        $Selenium->find_element("//input[\@id='SEARCH::Name']")->send_keys($ServiceName);
        $Selenium->find_element( "#SubmitSearch", 'css' )->click();
        $Selenium->find_element("//input[\@id='LinkTargetKeys'][\@value='$ServiceID']")->click();

        # select 'Relevant to' link type
        $Selenium->execute_script(
            "\$('#TypeIdentifier').val('RelevantTo::Source').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element("//button[\@id='AddLinks']")->click();

        # select to link with test Ticket
        $Selenium->execute_script(
            "\$('#TargetIdentifier').val('Ticket').trigger('redraw.InputField').trigger('change');");

        # search Ticket by number and select result
        $Selenium->find_element("//input[\@id='SEARCH::TicketNumber']")->send_keys($TicketNumber);
        $Selenium->find_element( "#SubmitSearch", 'css' )->click();

        $Selenium->find_element("//input[\@id='LinkTargetKeys'][\@value='$TicketID']")->click();

        # select 'Depends to' link type
        $Selenium->execute_script(
            "\$('#TypeIdentifier').val('DependsOn::Source').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element("//button[\@id='AddLinks']")->click();

        # close link window, return to Zoom view and refresh page
        $Selenium->close();
        $Selenium->switch_to_window( $Handles->[0] );
        $Selenium->refresh();

        # check for linked values in AgentITSMConfigItemZoom screen
        for my $CheckValues ( $ConfigItemNumbers[1], $ServiceName, $TicketNumber ) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckValues ) > -1,
                "Linked value $CheckValues - found",
            );
        }

        # click on 'Link' menu and switch window
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=ITSMConfigItem;SourceKey=$ConfigItemIDs[0]\' )]"
        )->click();
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # click 'go to link delete screen'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentLinkObject;Subaction=LinkDelete\' )]")->click();

        # select all linked items and delete links
        $Selenium->find_element("//input[\@value='ITSMConfigItem::$ConfigItemIDs[1]::AlternativeTo']")->click();
        $Selenium->find_element("//input[\@value='Service::$ServiceID\::RelevantTo']")->click();
        $Selenium->find_element("//input[\@value='Ticket::$TicketID\::DependsOn']")->click();
        $Selenium->find_element("//button[\@title='Delete links']")->click();

        # close link window, return to Zoom view and refresh page
        $Selenium->close();
        $Selenium->switch_to_window( $Handles->[0] );
        $Selenium->refresh();

        # check for no linked values in AgentITSMConfigItemZoom screen
        for my $CheckValues ( $ConfigItemNumbers[1], $ServiceName, $TicketNumber ) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckValues ) == -1,
                "Linked value $CheckValues - not found",
            );
        }

        # delete test Ticket
        my $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Deleted Ticket - $TicketID "
        );

        # delete test ConfigItem
        for my $ConfigItemDelete (@ConfigItemIDs) {
            $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "Deleted ConfigItem - $ConfigItemDelete",
            );
        }

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # delete test service and its preferences
        $Success = $DBObject->Do(
            SQL => "DELETE FROM service_preferences WHERE service_id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Deleted Service Preference",
        );
        $Success = $DBObject->Do(
            SQL => "DELETE FROM service WHERE id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Deleted Service - $ServiceID",
        );
    }

);

1;
