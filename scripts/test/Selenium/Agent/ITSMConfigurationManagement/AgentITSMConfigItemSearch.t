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

        # get 'Computer' and 'Hardware' ConfigItem ID
        my @ConfigItemClassIDs;
        for my $ConfigItemClass (qw(Computer Hardware)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemClass,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # get 'Production' deployment state IDs
        my $ProductionDeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $ProductionDeplStateID = $ProductionDeplStateDataRef->{ItemID};

        # get config item object
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        # create config item number
        my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
            Type    => $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::NumberGenerator'),
            ClassID => $ConfigItemClassIDs[1],
        );

        # add the new config item
        my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
            Number  => $ConfigItemNumber,
            ClassID => $ConfigItemClassIDs[1],
            UserID  => 1,
        );

        # add a new version
        my $VersionID = $ConfigItemObject->VersionAdd(
            Name         => 'SeleniumTest',
            DefinitionID => 1,
            DeplStateID  => $ProductionDeplStateID,
            InciStateID  => 1,
            UserID       => 1,
            ConfigItemID => $ConfigItemID,
        );

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # navigate to AgentITSMConfigItemSearch
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        $Selenium->get("${ScriptAlias}index.pl?Action=AgentITSMConfigItemSearch");

        # wait for class selection dropdown to show up
        $Selenium->WaitFor( JavaScript => "return \$('#SearchClassID').length;" );

        $Self->True(
            $Selenium->find_element( "#SearchClassID", 'css' ),
            "Class select box - found",
        );

        # select 'Hardware' class
        $Selenium->execute_script(
            "\$('#SearchClassID').val('$ConfigItemClassIDs[1]').trigger('redraw.InputField').trigger('change');"
        );

        # wait until form has loaded, if neccessary
        $Selenium->WaitFor( JavaScript => "return \$('#Attribute').length" );

        # check config item search page
        for my $ID (
            qw(SearchClassID SearchProfile SearchProfileNew Attribute PreviousVersionSearch ResultForm SearchFormSubmit)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # serch config items by test config item number
        $Selenium->find_element("//input[\@name='Number']")->send_keys($ConfigItemNumber);
        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();

        # wait until form has loaded, if neccessary
        $Selenium->WaitFor( JavaScript => "return \$('th.Number').length" );

        # check for expected result
        $Self->True(
            index( $Selenium->get_page_source(), $ConfigItemNumber ) > -1,
            "ConfigItem# $ConfigItemNumber - found",
        );

        # change search option
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();

        # wait until form has loaded, if neccessary
        $Selenium->WaitFor( JavaScript => "return \$('#SearchProfile').length" );

        # select 'Hardware' class
        $Selenium->execute_script(
            "\$('#SearchClassID').val('$ConfigItemClassIDs[1]').trigger('redraw.InputField').trigger('change');"
        );

        # wait until form has loaded, if neccessary
        $Selenium->WaitFor( JavaScript => "return \$('#Attribute').length" );

        # input wrong search parameters, result should be 'No data found'
        $Selenium->execute_script("\$('#Attribute').val('Name').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "a.AddButton", 'css' )->click();
        $Selenium->find_element("//input[\@name='Name']")->send_keys('asdfg');
        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();

        # wait until form has loaded, if neccessary
        $Selenium->WaitFor( JavaScript => "return \$('th.Number').length" );

        # check for expected result
        $Self->True(
            index( $Selenium->get_page_source(), 'No data found' ) > -1,
            "'No data found' - found",
        );

        # delete created test config item
        my $Success = $ConfigItemObject->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => 1,
        );
        $Self->True(
            $Success,
            "Deleted ConfigItem - $ConfigItemID",
        );
        }
);

1;
