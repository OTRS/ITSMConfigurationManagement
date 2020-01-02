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
        my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        my @Test = (
            {
                ConfigItemClass => 'Computer',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Model', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'OperatingSystem', 'CPU', 'Ram', 'HardDisk', 'Capacity', 'FQDN', 'NIC', 'PoverDHCP',
                    'GraphicAdapter',
                    'OtherEquipment', 'WarrantyExpirationDate', 'InstallDate', 'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Hardware',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Model', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'WarrantyExpirationDate', 'InstallDate', 'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Location',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Type', 'Phone1', 'Phone2', 'Fax', 'E-Mail', 'Address',
                    'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Network',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Description', 'Type', 'NetworkAddress', 'SubnetMask',
                    'Gateway',
                    'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Software',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Version', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'LicenceType', 'LicenceKey', 'Media', 'Note', 'SubmitSave'
                ],
            },
        );

        # Get 'Production' deployment state ID.
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        # Create test user and login.
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        my $RandomID    = $Helper->GetRandomID();

        for my $ConfigItemEdit (@Test) {

            # Navigate to AgentITSMConfigItemAdd screen.
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemAdd");

            # Get ConfigItem class ID.
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemEdit->{ConfigItemClass},
            );
            my $ConfigItemClassID = $ConfigItemDataRef->{ItemID};

            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === 'function' && \$('a[href*=\"Action=AgentITSMConfigItemEdit;ClassID=$ConfigItemClassID\"]').length"
            );

            # Click on ConfigItem class.
            $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentITSMConfigItemEdit;ClassID=$ConfigItemClassID\' )]"
            )->VerifiedClick();

            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('#Name').length && \$('#SubmitButton').length"
            );

            # Check for ConfigItemEdit fields.
            for my $CheckConfigItemField ( @{ $ConfigItemEdit->{CheckEditFields} } ) {

                my $Element = $Selenium->find_element("//*[contains(\@name, \'$CheckConfigItemField\' )]");
                $Element->is_enabled();
                $Element->is_displayed();
            }

            # Create test ConfigItem.
            my $ConfigItemName = $ConfigItemEdit->{ConfigItemClass} . $RandomID;
            $Selenium->find_element( "#Name", 'css' )->send_keys($ConfigItemName);

            $Selenium->execute_script(
                "\$('#DeplStateID').val('$DeplStateID').trigger('redraw.InputField').trigger('change')"
            );
            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('#DeplStateID').val() === '$DeplStateID'"
            );

            $Selenium->execute_script("\$('#InciStateID').val('1').trigger('redraw.InputField').trigger('change')");
            $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#InciStateID').val() === '1'" );

            if ( $ConfigItemEdit->{ConfigItemClass} eq 'Computer' ) {

                # Get General Catalog ID for 'Yes'.
                my $YesDataRef = $GeneralCatalogObject->ItemGet(
                    Class => 'ITSM::ConfigItem::YesNo',
                    Name  => 'Yes',
                );
                my $YesID = $YesDataRef->{ItemID};

                # Enter NIC name.
                $Selenium->find_element("//*[contains(\@name, \'NIC::1\' )]")->send_keys('SeleniumNetwork');

                # Select Yes for DHCPOverIP.
                $Selenium->execute_script(
                    "\$('#' + Core.App.EscapeSelector('Item1NIC::11')).val('$YesID').trigger('redraw.InputField').trigger('change');"
                );
            }
            if ( $ConfigItemEdit->{ConfigItemClass} eq 'Network' ) {
                $Selenium->find_element("//*[contains(\@name, \'NetworkAddress\' )]")->send_keys('SeleniumNetwork');
            }

            $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('h1:contains($ConfigItemName)').length"
            );

            # Get ConfigItem value.
            my @ConfigItemValues = (
                {
                    Value       => $ConfigItemName,
                    Check       => "h1:contains($ConfigItemName)",
                    CheckResult => 1,
                },
                {
                    Value       => $ConfigItemEdit->{ConfigItemClass},
                    Check       => "p.Value:contains($ConfigItemEdit->{ConfigItemClass})",
                    CheckResult => 2,
                },
            );

            # Check submitted values in AgentITSMConfigItemZoom screen.
            for my $CheckConfigItemValue (@ConfigItemValues) {
                $Self->True(
                    $Selenium->execute_script(
                        "return \$('$CheckConfigItemValue->{Check}').length === $CheckConfigItemValue->{CheckResult}"
                    ),
                    "Test ConfigItem value $CheckConfigItemValue->{Value} - found",
                );
            }

            # Get ConfigItemID.
            my $ConfigItemID = $ConfigItemObject->VersionSearch(
                Name => $ConfigItemName
            );

            # Delete created test ConfigItem.
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemID->[0],
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemID->[0]",
            );
        }

        # Check multiple Customer type fields (see bug#14218 - https://bugs.otrs.org/show_bug.cgi?id=14218).
        # Create test CI class.
        my $ClassName = 'Class' . $Helper->GetRandomID();
        my $ClassID   = $GeneralCatalogObject->ItemAdd(
            Class   => 'ITSM::ConfigItem::Class',
            Name    => $ClassName,
            ValidID => 1,
            UserID  => 1,
        );
        $Self->True(
            $ClassID,
            "ClassID $ClassID is created",
        );

        my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
            Group  => 'itsm-configitem',
            UserID => 1,
        );

        # Set permission.
        $Kernel::OM->Get('Kernel::System::GeneralCatalog')->GeneralCatalogPreferencesSet(
            ItemID => $ClassID,
            Key    => 'Permission',
            Value  => $GroupID,
        );

        my $Definition = << "EOF";
---
- Key: CustomerID1
  Name: CustomerCompany 1
  Searchable: 1
  Input:
    Type: CustomerCompany
  Sub:
  - Key: Customer1
    Name: Customer 1
    Searchable: 1
    Input:
      Type: Customer

- Key: CustomerID2
  Name: CustomerCompany 2
  Searchable: 1
  Input:
    Type: CustomerCompany
  Sub:
  - Key: Customer2
    Name: Customer 2
    Searchable: 1
    Input:
      Type: Customer

- Key: CustomerID3
  Name: CustomerCompany 3
  Searchable: 1
  Input:
    Type: CustomerCompany
  Sub:
  - Key: Customer3
    Name: Customer 3
    Searchable: 1
    Input:
      Type: Customer
EOF

        # Add test definition to test CI class.
        my $DefinitionID = $ConfigItemObject->DefinitionAdd(
            ClassID    => $ClassID,
            Definition => $Definition,
            UserID     => 1,
        );
        $Self->True(
            $DefinitionID,
            "DefinitionID $DefinitionID is created",
        );

        # Navigate to AgentITSMConfigItemAdd screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemEdit;ClassID=$ClassID");

        # Verify all of three sub elements are autocomplete input fields.
        $Self->Is(
            $Selenium->execute_script(
                "return \$('.SubElement .ITSMCustomerSearch.ui-autocomplete-input').length;"
            ),
            3,
            "All sub elements work correctly - they are autocomplete input fields",
        );

        # Cleanup.
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # Delete test definition.
        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM configitem_definition WHERE id = ?",
            Bind => [ \$DefinitionID ],
        );
        $Self->True(
            $Success,
            "Config item definition is deleted",
        );

        $Success = $DBObject->Do(
            SQL  => "DELETE FROM general_catalog_preferences WHERE general_catalog_id = ?",
            Bind => [ \$ClassID ],
        );
        $Self->True(
            $Success,
            "General catalog preferences for ClassID $ClassID is deleted",
        );

        $Success = $DBObject->Do(
            SQL  => "DELETE FROM general_catalog WHERE id = ?",
            Bind => [ \$ClassID ],
        );
        $Self->True(
            $Success,
            "ClassID $ClassID is deleted",
        );

    }
);

1;
