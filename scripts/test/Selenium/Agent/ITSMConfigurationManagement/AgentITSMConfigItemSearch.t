# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
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

        # Get 'Computer' ConfigItem ID.
        my @ConfigItemClassIDs;
        for my $ConfigItemClass (qw(Computer)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemClass,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # Get 'Production' deployment state IDs.
        my $ProductionDeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $ProductionDeplStateID = $ProductionDeplStateDataRef->{ItemID};

        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject     = $Kernel::OM->Get('Kernel::Config');

        # Create ConfigItem numbers.
        my @ConfigItemNumbers;
        for my $ConfigNumberCreate ( 1 .. 2 ) {
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ConfigItemClassIDs[0],
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber"
            );
            push @ConfigItemNumbers, $ConfigItemNumber;
        }

        # Add the new ConfigItems.
        my @ConfigItemIDs;
        for my $ConfigItemCreateNumber (@ConfigItemNumbers) {
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemCreateNumber,
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            );
            $Self->True(
                $ConfigItemID,
                "ConfigItem is created - ID $ConfigItemID"
            );
            push @ConfigItemIDs, $ConfigItemID;
        }

        my $InciStateID = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::Core::IncidentState',
            Name  => 'Incident',
        );

        # Add a new version for each ConfigItem.
        my @VersionIDs;
        my $Count    = 1;
        my $RandomID = $Helper->GetRandomID();
        for my $ConfigItemVersion (@ConfigItemIDs) {
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => $Count . $RandomID,
                DefinitionID => 1,
                DeplStateID  => $ProductionDeplStateID,
                InciStateID  => $InciStateID->{ItemID},
                UserID       => 1,
                ConfigItemID => $ConfigItemVersion,
            );
            $Self->True(
                $VersionID,
                "Version is created - ID $VersionID"
            );
            push @VersionIDs, $VersionID;

            $Count++;
        }

        # Create test user and login.
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AgentITSMConfigItemSearch.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemSearch");

        # Wait until form and overlay has loaded, if necessary.
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchClassID').length" );

        # Check for 'Class' label.
        $Self->True(
            $Selenium->execute_script("return \$('label[for=\"Class\"]').length"),
            "Class label - found",
        );

        # Check for 'Class' select box.
        $Self->True(
            $Selenium->find_element( "#SearchClassID", 'css' ),
            "Class select box - found",
        );

        # Be sure modernized field has loaded.
        sleep 1;

        # Select 'Computer' class.
        $Selenium->execute_script(
            "\$('#SearchClassID').val('$ConfigItemClassIDs[0]').trigger('redraw.InputField').trigger('change');"
        );

        # Check ConfigItem search page.
        for my $ID (
            qw(SearchClassID SearchProfile SearchProfileNew Attribute PreviousVersionSearch ResultForm SearchFormSubmit)
            )
        {
            $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#$ID').length" );
            my $Element = $Selenium->find_element( "#$ID", 'css' );

            $Element->is_enabled();
            $Element->is_displayed();
        }

        # Search ConfigItems by test ConfigItem number and names.
        $Selenium->execute_script("\$('#Attribute').val('Name').trigger('redraw.InputField').trigger('change');");
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchInsert input[name=\"Name\"]').length"
        );

        $Selenium->find_element("//input[\@name='Number']")->send_keys('*');
        $Selenium->find_element("//input[\@name='Name']")->send_keys( '*' . $RandomID );
        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && !\$('Dialog.Modal').length && \$('#OverviewBody .TableSmall').length"
        );

        # Check for expected result.
        for my $CheckConfigItem (@ConfigItemNumbers) {
            $Self->True(
                $Selenium->execute_script(
                    "return \$('#OverviewBody .TableSmall td:contains($CheckConfigItem)').length"
                ),
                "ConfigItem number $CheckConfigItem - found",
            );
        }

        # Verify sorting in table, by default sorting is done by ConfigItemNumber - sort ascending.
        # Lower ID will on the top of table.
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(0)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[1],
            "ConfigItemID $ConfigItemIDs[1] is on top of table sort by Number ascending"
        );
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(1)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[0],
            "ConfigItemID $ConfigItemIDs[0] is on bottom of table sort by Number ascending"
        );

        # Click to sort by Name.
        $Selenium->find_element( ".Name", 'css' )->VerifiedClick();

        # Check for expected result.
        for my $CheckConfigItem (@ConfigItemNumbers) {
            $Self->True(
                $Selenium->execute_script(
                    "return \$('#OverviewBody .TableSmall td:contains($CheckConfigItem)').length"
                ),
                "ConfigItem number $CheckConfigItem - found",
            );
        }

        # Sort is by Name descending.
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(0)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[0],
            "ConfigItemID $ConfigItemIDs[1] is on top of table sort by Name descending"
        );
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(1)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[1],
            "ConfigItemID $ConfigItemIDs[0] is on bottom of table sort by Name descending"
        );

        # Click to sort by Name again.
        $Selenium->find_element( ".Name", 'css' )->VerifiedClick();

        # Verify order is changed, sort by Name ascending.
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(0)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[1],
            "ConfigItemID $ConfigItemIDs[0] is on top of table sort by Name ascending"
        );
        $Self->Is(
            $Selenium->execute_script("return \$('tbody tr:eq(1)').attr('id')"),
            'ConfigItemID_' . $ConfigItemIDs[0],
            "ConfigItemID $ConfigItemIDs[1] is on bottom of table sort by Name ascending"
        );

        # Create ConfigItem numbers and add the new ConfigItems.
        @ConfigItemNumbers = ();
        for my $ConfigNumberCreate ( 1 .. 35 ) {
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ConfigItemClassIDs[0],
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber"
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            );
            $Self->True(
                $ConfigItemID,
                "ConfigItem is created - ID $ConfigItemID"
            );
            push @ConfigItemIDs, $ConfigItemID;
        }

        my @XMLDataArray = [
            undef,
            {
                'Version' => [
                    undef,
                    {

                        'WarrantyExpirationDate' => [
                            undef,
                            {
                                'Content' => '2017-10-10'
                            },
                        ],
                    },
                ],
            },
            {
                'Version' => [
                    undef,
                    {

                        'WarrantyExpirationDate' => [
                            undef,
                            {
                                'Content' => '2017-11-11'
                            },
                        ],
                    },
                ],
            },
        ];

        # Add a new version for each ConfigItem.
        $Count = 1;
        for my $ConfigItemVersion (@ConfigItemIDs) {

            my $XMLData = ( $Count <= 30 ) ? $XMLDataArray[0] : $XMLDataArray[1];
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => $Count . $RandomID,
                DefinitionID => 1,
                DeplStateID  => $ProductionDeplStateID,
                InciStateID  => $InciStateID->{ItemID},
                UserID       => 1,
                XMLData      => $XMLData,
                ConfigItemID => $ConfigItemVersion,
            );
            $Self->True(
                $VersionID,
                "Version is created - ID $VersionID"
            );
            push @VersionIDs, $VersionID;

            $Count++;
        }

        # Change search option.
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();

        # Wait until form has loaded, if necessary.
        $Selenium->WaitFor( JavaScript => "return \$('#Attribute').length" );

        # Add search filter by WarrantyExpirationDate and set date range (8-10-2017 - 15-10-2017).
        $Selenium->execute_script(
            "\$('#Attribute').val('WarrantyExpirationDate').trigger('redraw.InputField').trigger('change');",
        );
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('input[name=\"WarrantyExpirationDate\"]').length"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStart::Day\"]').val('8');"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStart::Month\"]').val('10');"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStart::Year\"]').val('2017');"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStop::Day\"]').val('15');"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStop::Month\"]').val('10');"
        );
        $Selenium->execute_script(
            "\$('#SearchInsert select[id=\"WarrantyExpirationDate::TimeStop::Year\"]').val('2017');"
        );
        $Selenium->find_element("//input[\@name='Number']")->clear();
        $Selenium->find_element("//input[\@name='Number']")->send_keys('*');
        $Selenium->find_element("//input[\@name='Name']")->clear();
        $Selenium->find_element("//input[\@name='Name']")->send_keys( '*' . $RandomID );

        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && !\$('Dialog.Modal').length && \$('#OverviewBody .TableSmall').length"
        );

        $Self->True(
            $Selenium->execute_script("return \$('.Pagination').text().trim().indexOf('1-25 of 30') > -1;"),
            "Check pagination on the first page",
        );

        $Self->Is(
            $Selenium->execute_script("return \$('#OverviewBody .TableSmall tbody tr').length;"),
            '25',
            "Number of config items on the first page is correct - 25",
        );

        # Go to the second page.
        $Selenium->find_element( "#GenericPage2", 'css' )->VerifiedClick();

        $Self->True(
            $Selenium->execute_script("return \$('.Pagination').text().trim().indexOf('26-30 of 30') > -1;"),
            "Check pagination on the second page",
        );

        $Self->Is(
            $Selenium->execute_script("return \$('#OverviewBody .TableSmall tbody tr').length;"),
            '5',
            "Number of config items on the second page is correct - 5",
        );

        # Change search option.
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();

        # Wait until form has loaded, if necessary.
        $Selenium->WaitFor(
            JavaScript => "return \$('#Attribute').length && \$('#SearchInsert input[name=\"Name\"]').length"
        );

        # Input wrong search parameters, result should be 'No data found'.
        $Selenium->find_element("//input[\@name='Name']")->clear();
        $Selenium->find_element("//input[\@name='Name']")->send_keys('asdfg');
        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && !\$('Dialog.Modal').length && \$('#OverviewBody .TableSmall').length"
        );

        # Check for expected result.
        $Self->True(
            index( $Selenium->get_page_source(), 'No data found' ) > -1,
            "'No data found' - found",
        );

        # Click on "Change search option"
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfileNew').length" );
        sleep 2;

        # Create new template search.
        my $SearchProfileName = "Search-" . $Helper->GetRandomID();
        $Selenium->find_element( "#SearchProfileNew", 'css' )->click();
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfileAddName').length" );

        $Selenium->find_element( "#SearchProfileAddName",   'css' )->send_keys($SearchProfileName);
        $Selenium->find_element( "#SearchProfileAddAction", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').val() === '$SearchProfileName'"
        );

        # Check button for profil link.
        $Selenium->find_element( "#SearchProfileAsLink", 'css' )->click();

        # Click on "Change search option"
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').val() === '$SearchProfileName'"
        );

        $Self->Is(
            $Selenium->execute_script("return \$('#SearchProfile').val();"),
            $SearchProfileName,
            "Check if profil is loaded well"
        );

        # Delete created test ConfigItem.
        for my $ConfigItemDeleteID (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDeleteID,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemDeleteID",
            );
        }

        # Make sure the cache is correct.
        my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
        for my $Cache (qw(ConfigItem Version)) {
            $CacheObject->CleanUp( Type => $Cache );
        }
    }
);

1;
