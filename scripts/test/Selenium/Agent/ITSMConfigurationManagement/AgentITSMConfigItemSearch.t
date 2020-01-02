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
                "ConfigItem $ConfigItemNumber number is created"
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
                "ConfigItemID $ConfigItemID is created"
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
                "VersionID $VersionID is created"
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

        # Be sure all fields are loaded.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#SearchFormSubmit").length;',
        );

        # Check ConfigItem search page.
        for my $ID (
            qw(SearchClassID SearchProfile SearchProfileNew Attribute PreviousVersionSearch ResultForm SearchFormSubmit)
            )
        {
            sleep 1;
            $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#$ID').length" );
            $Self->True(
                $Selenium->execute_script("return typeof(\$) === 'function' && \$('#$ID').length;"),
                "Element is found - $ID",
            );
        }

        # Check if ITSMChange Search form contain Excel output option, see bug#12769.
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#ResultForm option:contains(\"Excel\")').length"
            ),
            '1',
            'ITSMConfigItem Search contain Excel output',
        );

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
                "ConfigItem $CheckConfigItem number is found",
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
                "ConfigItem $CheckConfigItem number is found",
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
                "ConfigItem $ConfigItemNumber number is created"
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            );
            $Self->True(
                $ConfigItemID,
                "ConfigItemID $ConfigItemID is created"
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
                        'NIC' => [
                            undef,
                            {
                                'IPoverDHCP' => [
                                    undef,
                                    {
                                        'Content' => '38'
                                    }
                                ],
                                'IPAddress' => [
                                    undef,
                                    {
                                        'Content' => '172.0.0.0'
                                    }
                                ],
                                'Content' => 'test 172.0.0.0'
                            }
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

            my $XMLData   = ( $Count <= 30 ) ? $XMLDataArray[0] : $XMLDataArray[1];
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
                "VersionID $VersionID is created"
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

        # Execute search with new search profile to save it.
        $Selenium->find_element("//input[\@name='Number']")->clear();
        $Selenium->find_element("//input[\@name='Number']")->send_keys('*');
        $Selenium->find_element("//input[\@name='Name']")->clear();
        $Selenium->find_element("//input[\@name='Name']")->send_keys( '*' . $RandomID );

        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && !\$('Dialog.Modal').length && \$('#OverviewBody .TableSmall').length"
        );

        # Click on "Change search option"
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();

        # Select newly created search profile.
        $Selenium->execute_script(
            "\$('#SearchProfile').val('$SearchProfileName').trigger('redraw.InputField').trigger('change');",
        );

        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').val() === '$SearchProfileName';"
        );
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfileAsLink:visible').length"
        );

        # Check button for profile link.
        $Selenium->find_element( "#SearchProfileAsLink", 'css' )->click();

        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        # Click on "Change search option"
        $Selenium->find_element( "#ITSMConfigItemSearch", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').val() === '$SearchProfileName'"
        );

        $Self->Is(
            $Selenium->execute_script("return \$('#SearchProfile').val();"),
            $SearchProfileName,
            "Check if profile is loaded well"
        );

        # Check if correct config items are shown after sub attributes are searched. See bug#12998.
        my $ConfigItemNumber2 = $ConfigItemObject->ConfigItemNumberCreate(
            Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
            ClassID => $ConfigItemClassIDs[0],
        );
        $Self->True(
            $ConfigItemNumber2,
            "ConfigItem $ConfigItemNumber2 number is created"
        );
        my $ConfigItemID2 = $ConfigItemObject->ConfigItemAdd(
            Number  => $ConfigItemNumber2,
            ClassID => $ConfigItemClassIDs[0],
            UserID  => 1,
        );
        $Self->True(
            $ConfigItemID2,
            "ConfigItemID $ConfigItemID2 is created"
        );

        push @ConfigItemIDs, $ConfigItemID2;

        # Create config that should not appear in search.
        my $VersionID2 = $ConfigItemObject->VersionAdd(
            Name         => $Count . $RandomID,
            DefinitionID => 1,
            DeplStateID  => $ProductionDeplStateID,
            InciStateID  => $InciStateID->{ItemID},
            UserID       => 1,
            ConfigItemID => $ConfigItemID2,
            XMLData      => [
                undef,
                {
                    Version => [
                        undef,
                        {
                            NIC => [
                                undef,
                                {
                                    IPoverDHCP => [
                                        undef,
                                        {
                                            Content => '38'
                                        }
                                    ],
                                    IPAddress => [
                                        undef,
                                        {
                                            Content => '222.0.0.0'
                                        }
                                    ],
                                    Content => 'test 222.0.0.0'
                                }
                            ],
                        }
                    ]
                }
            ],
        );
        $Self->True(
            $VersionID2,
            "VersionID $VersionID2 is created"
        );

        # Configure IPAddres to show in search result.
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'ITSMConfigItem::Frontend::AgentITSMConfigItemSearch###ShowColumns',
            Value => {
                Class                  => 0,
                CurDeplSignal          => 1,
                CurDeplState           => 1,
                CurDeplStateType       => 0,
                CurInciSignal          => 1,
                CurInciState           => 1,
                CurInciStateType       => 0,
                LastChanged            => 1,
                'NIC::1::IPAddress::1' => 1,
                Name                   => 1,
                Number                 => 1,
            },
        );

        $Selenium->find_element( ".Dialog .Close", 'css' )->click();

        # Navigate to AgentITSMConfigItemSearch.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemSearch");

        # Wait until form and overlay has loaded, if necessary.
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchClassID').length" );
        sleep 1;

        # Select 'Computer' class.
        $Selenium->execute_script(
            "\$('#SearchClassID').val('$ConfigItemClassIDs[0]').trigger('redraw.InputField').trigger('change');"
        );

        # Wait until form has loaded, if necessary.
        $Selenium->WaitFor( JavaScript => "return \$('#Attribute').length" );

        # Add search filter by NIC::IPAddress and set 172*.
        $Selenium->execute_script(
            "\$('#Attribute').val('NIC::IPAddress').trigger('redraw.InputField').trigger('change');",
        );

        # Wait for Network Adapter::IP Address to appear.
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('#SearchInsert input[name=\"NIC::IPAddress\"]').length"
        );

        $Selenium->find_element("//input[\@name='NIC::IPAddress']")->send_keys('172*');

        $Selenium->find_element( "#SearchFormSubmit", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && !\$('Dialog.Modal').length && \$('#OverviewBody .TableSmall').length"
        );

        # Check if correct number of items are shown on pagination.
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

        # Check if correct number of items are shown on pagination.
        $Self->True(
            $Selenium->execute_script("return \$('.Pagination').text().trim().indexOf('26-30 of 30') > -1;"),
            "Check pagination on the second page",
        );

        $Self->Is(
            $Selenium->execute_script("return \$('#OverviewBody .TableSmall tbody tr').length;"),
            '5',
            "Number of config items on the second page is correct - 5",
        );

        # Verify search result remained intact after changing items per page, see bug#14717 for more details.
        # Set 10 config items per page.
        $Selenium->find_element( "a#ShowContextSettingsDialog", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript => 'return $(".Dialog.Modal #UserConfigItemOverviewSmallPageShown").length'
        );
        $Selenium->InputFieldValueSet(
            Element => '#UserConfigItemOverviewSmallPageShown',
            Value   => '10',
        );
        $Selenium->find_element( "#DialogButton1", 'css' )->click();
        $Selenium->WaitFor(
            JavaScript => 'return !$(".Dialog.Modal").length'
        );

        # Check if correct number of items are shown on pagination.
        $Self->True(
            $Selenium->execute_script("return \$('.Pagination').text().trim().indexOf('1-10 of 30') > -1;"),
            "Check pagination after switch",
        );
        $Self->Is(
            $Selenium->execute_script("return \$('#OverviewBody .TableSmall tbody tr').length;"),
            '10',
            "Number of config items is correct - 10",
        );

        # Delete created test ConfigItem.
        for my $ConfigItemDeleteID (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDeleteID,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItemID $ConfigItemDeleteID is deleted",
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
