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

        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        my $RandomID = $Helper->GetRandomID();

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

        # Navigate to AdminITSMConfigItem.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMConfigItem");

        # Test default ITSMConfigItem class.
        for my $Item (qw( Computer Hardware Location Network Software )) {
            my $Element = $Selenium->find_element( $Item, 'link_text' );
            $Element->is_enabled();
            $Element->is_displayed();
            $Element->VerifiedClick();

            # Check for table structure.
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            # Click on 'Change class definition'.
            $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

            # Check for input area.
            my $InputField = $Selenium->find_element( "#Definition", 'css' );
            $InputField->is_enabled();
            $InputField->is_displayed();

            # Return back to overview screen.
            $Selenium->find_element("//a[contains(\@href, \'Action=AdminITSMConfigItem' )]")->VerifiedClick();
        }

        # Add integer field to new ITSMConfigItem class to verify existence of 0.
        # For more information, see bug#6005 - https://bugs.otrs.org/show_bug.cgi?id=6005.
        my $Class   = "Class$RandomID";
        my $ClassID = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemAdd(
            Class   => 'ITSM::ConfigItem::Class',
            Name    => $Class,
            ValidID => 1,
            Comment => 'Comment',
            UserID  => 1,
        );

        # Get 'itsm-configitem' group ID.
        my $ITSMConfigItemGroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
            Group => 'itsm-configitem',
        );

        # Set permission for test class.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminGeneralCatalog;Subaction=ItemEdit;ItemID=$ClassID");
        $Selenium->execute_script(
            "\$('#Permission').val('$ITSMConfigItemGroupID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # Navigate to AdminITSMConfigItem.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMConfigItem");

        # Click on test class.
        $Selenium->find_element( $Class, 'link_text' )->VerifiedClick();

        # Click on 'Change class definition'.
        $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

        my $IntegerKey        = "TestInteger$RandomID";
        my $IntegerDefinition = << "EOF";
---
- Key: $IntegerKey
  Name: Test Integer
  Searchable: 1
  Input:
    Type:  Integer
    ValueMin: 0
    ValueMax: 10
    ValueDefault: 0
EOF

        $Selenium->find_element( "#Definition", 'css' )->send_keys($IntegerDefinition);
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # Verify option with 0 in add config item screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemEdit;ClassID=$ClassID");
        $Self->True(
            $Selenium->find_element("//select[contains(\@id, \'$IntegerKey')]/option[\@value='0']"),
            "Add screen - Option with '0' value is found",
        );

        # Verify option with 0 in search config item screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemSearch");
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchClassID').length;" );
        sleep 1;

        # Select test class.
        $Selenium->execute_script(
            "\$('#SearchClassID').val('$ClassID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#Attribute").length;',
        );
        sleep 1;

        # Choose test integer field.
        $Selenium->execute_script(
            "\$('#Attribute').val('$IntegerKey').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#SearchInsert #$IntegerKey').length;"
        );

        # Verify option with 0 exists.
        $Self->True(
            $Selenium->find_element("//select[\@id='$IntegerKey']/option[\@value='0']"),
            "Search screen - Option with '0' value is found",
        );

        # Cleanup.
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM configitem_definition WHERE class_id = ?",
            Bind => [ \$ClassID ],
        );
        $Self->True(
            $Success,
            "ConfigItem definitions from ClassID $ClassID is deleted",
        );

        $Success = $DBObject->Do(
            SQL  => "DELETE FROM general_catalog_preferences WHERE general_catalog_id = ?",
            Bind => [ \$ClassID ],
        );
        $Self->True(
            $Success,
            "CatalogItemID $ClassID preference is deleted",
        );

        $Success = $DBObject->Do(
            SQL  => "DELETE FROM general_catalog WHERE id = ?",
            Bind => [ \$ClassID ],
        );
        $Self->True(
            $Success,
            "CatalogItemID $ClassID is deleted",
        );

        # Make sure the cache is correct.
        my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
        for my $Cache (qw(ConfigItem GeneralCatalog)) {
            $CacheObject->CleanUp( Type => $Cache );
        }

    }
);

1;
