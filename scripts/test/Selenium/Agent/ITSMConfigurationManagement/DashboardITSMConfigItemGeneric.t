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

        # Create test customer user login.
        my $TestCustomerUser = $Helper->TestCustomerUserCreate() || die "Did not get test customer user";

        my $CustomerUserObject    = $Kernel::OM->Get('Kernel::System::CustomerUser');
        my $CustomerCompanyObject = $Kernel::OM->Get('Kernel::System::CustomerCompany');

        # Get customer user data.
        my %CustomerUser = $CustomerUserObject->CustomerUserDataGet(
            User => $TestCustomerUser,
        );

        # Create random id.
        my $RandomID = $Helper->GetRandomID();

        my $CustomerCompanyID = $CustomerCompanyObject->CustomerCompanyAdd(
            CustomerID          => "$TestCustomerUser-$RandomID",
            CustomerCompanyName => "$TestCustomerUser-$RandomID",
            ValidID             => 1,
            UserID              => 1,
        );
        $Self->True(
            $CustomerCompanyID,
            "Created test customer company $CustomerCompanyID",
        );

        # Define test array.
        my @Test = (
            {
                ClassName  => 'Customer' . $RandomID,
                Key        => 'Customer',
                Definition => << "EOF",
---
- Key: Customer
  Name: Customer
  Searchable: 1,
  Input:
    Type: Customer
EOF
            },
            {
                ClassName  => 'CustomerCompany' . $RandomID,
                Key        => 'CustomerCompany',
                Definition => << "EOF",
---
- Key: CustomerCompany
  Name: CustomerCompany
  Searchable: 1,
  Input:
    Type: CustomerCompany
EOF
            },
        );

        # Change config settings.
        my %ITSMConfigItemCustomerUserSysConfig = $Kernel::OM->Get('Kernel::System::SysConfig')->SettingGet(
            Name => 'AgentCustomerUserInformationCenter::Backend###0060-CUIC-ITSMConfigItemCustomerUser',
        );

        delete $ITSMConfigItemCustomerUserSysConfig{EffectiveValue}->{ConfigItemKey};
        $ITSMConfigItemCustomerUserSysConfig{EffectiveValue}->{ConfigItemKey} = {
            'Customer' . $RandomID => 'Customer',
        };

        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'AgentCustomerUserInformationCenter::Backend###0060-CUIC-ITSMConfigItemCustomerUser',
            Value => {
                %{ $ITSMConfigItemCustomerUserSysConfig{EffectiveValue} },
            },
        );

        my %ITSMConfigItemCustomerCompanySysConfig = $Kernel::OM->Get('Kernel::System::SysConfig')->SettingGet(
            Name => 'AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany',
        );

        delete $ITSMConfigItemCustomerCompanySysConfig{EffectiveValue}->{ConfigItemKey};
        $ITSMConfigItemCustomerCompanySysConfig{EffectiveValue}->{ConfigItemKey} = {
            'CustomerCompany' . $RandomID => 'CustomerCompany',
        };

        # Change config setting.
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany',
            Value => {
                %{ $ITSMConfigItemCustomerCompanySysConfig{EffectiveValue} },
            },
        );

        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

        # Add the test classes.
        my @ConfigItemClassIDs;
        my @ConfigItemClasses;
        my @ConfigItemDefinitionIDs;

        for my $Definition (@Test) {

            # Add an unittest config item class.
            my $ClassID = $GeneralCatalogObject->ItemAdd(
                Class   => 'ITSM::ConfigItem::Class',
                Name    => $Definition->{ClassName},
                ValidID => 1,
                UserID  => 1,
            );

            # Check class id.
            if ( !$ClassID ) {

                $Self->True(
                    0,
                    "Can't add new config item class.",
                );
            }

            push @ConfigItemClassIDs, $ClassID;
            push @ConfigItemClasses,  $Definition->{ClassName};

            # Check if group already exists.
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

            # Add a definition to the class.
            my $DefinitionID = $ConfigItemObject->DefinitionAdd(
                ClassID    => $ClassID,
                Definition => $Definition->{Definition},
                UserID     => 1,
            );

            # Check definition id.
            if ( !$DefinitionID ) {

                $Self->True(
                    0,
                    "Can't add new config item definition.",
                );
            }

            push @ConfigItemDefinitionIDs, $DefinitionID;

            # Add data to test array.
            $Definition->{ClassID} = $ClassID;
        }

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

        # Get script alias.
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        for my $Test (@Test) {

            # Navigate to AgentITSMConfigItemAdd.
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemAdd");

            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === 'function' && \$('a[href*=\"Action=AgentITSMConfigItemEdit;ClassID=$Test->{ClassID}\"]').length"
            );

            # Click on ConfigItem class.
            $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentITSMConfigItemEdit;ClassID=$Test->{ClassID}\' )]"
            )->VerifiedClick();

            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('#Name').length && \$('#SubmitButton').length"
            );

            # Create test ConfigItem.
            my $ConfigItemName = 'SeleniumTest-' . $Helper->GetRandomID();
            $Selenium->find_element( "#Name", 'css' )->send_keys($ConfigItemName);

            $Selenium->execute_script(
                "\$('#DeplStateID').val('$DeplStateID').trigger('redraw.InputField').trigger('change')"
            );
            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('#DeplStateID').val() === '$DeplStateID'"
            );

            $Selenium->execute_script("\$('#InciStateID').val('1').trigger('redraw.InputField').trigger('change')");
            $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#InciStateID').val() === '1'" );

            if ( $Test->{Key} eq 'Customer' ) {
                $Selenium->find_element( "#Item10", 'css' )->clear();
                $Selenium->find_element( "#Item10", 'css' )->send_keys( $CustomerUser{UserID} );
                $Selenium->WaitFor(
                    JavaScript => 'return typeof($) === "function" && $("li.ui-menu-item:visible").length'
                );
                $Selenium->execute_script("\$('li.ui-menu-item:contains($CustomerUser{UserID})').click()");
            }
            else {
                $Selenium->execute_script(
                    "\$('#Item10').val('$CustomerCompanyID').trigger('redraw.InputField').trigger('change')"
                );
                $Selenium->WaitFor(
                    JavaScript => "return typeof(\$) === 'function' && \$('#Item10').val() === '$CustomerCompanyID'"
                );
            }

            $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

            $Selenium->WaitFor(
                JavaScript => "return typeof(\$) === 'function' && \$('h1:contains($ConfigItemName)').length"
            );

            if ( $Test->{Key} eq 'Customer' ) {

                # Navigate to AgentCustomerUserInformationCenter.
                $Selenium->VerifiedGet(
                    "${ScriptAlias}index.pl?Action=AgentCustomerUserInformationCenter;CustomerUserID=$CustomerUser{UserID}"
                );

                $Self->True(
                    index( $Selenium->get_page_source(), $ConfigItemName ) > -1,
                    "$ConfigItemName found on page",
                );
            }
            elsif ( $Test->{Key} eq 'CustomerCompany' ) {

                # Navigate to AgentCustomerInformationCenter.
                $Selenium->VerifiedGet(
                    "${ScriptAlias}index.pl?Action=AgentCustomerInformationCenter;CustomerID=$CustomerCompanyID"
                );

                $Self->True(
                    index( $Selenium->get_page_source(), $ConfigItemName ) > -1,
                    "$ConfigItemName found on page",
                );
            }
        }

        # Cleanup.
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM customer_company WHERE customer_id = ?",
            Bind => [ \$CustomerCompanyID ],
        );
        $Self->True(
            $Success,
            "Deleted CustomerCompany",
        );

        my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearch( ClassIDs => \@ConfigItemClassIDs );

        # Delete created test ConfigItem.
        for my $ConfigItemID ( @{$ConfigItemIDs} ) {
            $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemID,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemID",
            );
        }

        for my $DefinitionID (@ConfigItemDefinitionIDs) {
            $Success = $DBObject->Do(
                SQL => "DELETE FROM configitem_definition WHERE id = $DefinitionID",
            );
            $Self->True(
                $Success,
                "Config item definition is deleted",
            );
        }

        for my $ClassID (@ConfigItemClassIDs) {
            $Success = $DBObject->Do(
                SQL => "DELETE FROM general_catalog_preferences WHERE general_catalog_id = $ClassID",
            );
            $Self->True(
                $Success,
                "Preferences deleted",
            );

            $Success = $DBObject->Do(
                SQL => "DELETE FROM general_catalog WHERE id = $ClassID",
            );
            $Self->True(
                $Success,
                "Class item is deleted",
            );
        }

        # Make sure the cache is correct.
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp();
    }
);

1;
