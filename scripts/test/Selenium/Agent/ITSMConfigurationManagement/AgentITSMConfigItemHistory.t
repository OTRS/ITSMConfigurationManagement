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

        # get 'Hardware' catalog class IDs
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Hardware',
        );
        my $HardwareConfigItemID = $ConfigItemDataRef->{ItemID};

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
            ClassID => $HardwareConfigItemID,
        );

        # add the new config item
        my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
            Number  => $ConfigItemNumber,
            ClassID => $HardwareConfigItemID,
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
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get test user ID
        my $TestUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # check for error message when no ConfigItemID is provided in history screen
        $Selenium->get("${ScriptAlias}index.pl?Action=AgentITSMConfigItemHistory");

        my $ErrorMessageNoID = 'Can\'t show history, no ConfigItemID is given!';
        $Self->True(
            index( $Selenium->get_page_source(), $ErrorMessageNoID ) > -1,
            "Error message $ErrorMessageNoID - found",
        );

        # create history messages list
        my @HistoryMessages = (
            "New ConfigItem (ID=\"$ConfigItemID\", \"$ConfigItemNumber)",
            "New version (ID=\"$VersionID)",
            "ConfigItems' definition updated (ID=\"1)",
            'Name updated (new="SeleniumTest; old=)',
            'Incident state updated (new="Operational; old=)',
            'Deployment state updated (new="Production; old=)',
        );

        # check for history meessages in history screen of created test config item
        $Selenium->get(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemHistory;ConfigItemID=$ConfigItemID;VersionID=$VersionID"
        );
        for my $HistoryMessage (@HistoryMessages) {
            $Self->True(
                index( $Selenium->get_page_source(), $HistoryMessage ) > -1,
                "History message $HistoryMessage - found",
            );
        }

        # remove itsm-configitem 'ro' accesss right for test user
        # get group object
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        # get 'itsm-configitem' group ID
        my $ITSMConfigItemGroupID = $GroupObject->GroupLookup(
            Group => 'itsm-configitem',
        );

        # remove access rights to test user
        $GroupObject->GroupMemberAdd(
            GID        => $ITSMConfigItemGroupID,
            UID        => $TestUserID,
            Permission => {
                ro => 0,
            },
            UserID => 1,
        );

        # check for error message when user have no access rights in history screen
        $Selenium->get(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemHistory;ConfigItemID=$ConfigItemID;VersionID=$VersionID"
        );

        my $ErrorMessageNoPermission = 'Can\'t show history, no access rights given!';
        $Self->True(
            index( $Selenium->get_page_source(), $ErrorMessageNoPermission ) > -1,
            "Error message $ErrorMessageNoPermission - found",
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
