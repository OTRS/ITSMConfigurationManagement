# --
# ITSMConfigItemLinkTest.t - tests the functionality ...
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;

$Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
$Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );

my $ConfigItemName = 'UnitTestConfigItemTest' . int rand 1_000_000;

my @ConfigItemIDs;

# get class list
my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::ConfigItem::Class',
);
my %ClassListReverse = reverse %{ $ClassList };

# get deployment state list
my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::ConfigItem::DeploymentState',
);
my %DeplStateListReverse = reverse %{$DeplStateList};

# get incident state list
my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
    Class => 'ITSM::Core::IncidentState',
);
my %InciStateListReverse = reverse %{$InciStateList};

# get definition for 'Hardware' class
my $DefinitionRef = $Self->{ConfigItemObject}->DefinitionGet(
    ClassID => $ClassListReverse{Hardware},
);

# create config items
for my $NameSuffix ( 1 .. 7, qw(A B C D E F G )) {

    # add a configitem
    my $ConfigItemID = $Self->{ConfigItemObject}->ConfigItemAdd(
        ClassID => $ClassListReverse{Hardware},
        UserID  => 1,
    );

    $Self->True(
        $ConfigItemID,
        "Added configitem id $ConfigItemID.",
    );

    push @ConfigItemIDs, $ConfigItemID;

    # set a name for each configitem
    my $VersionID = $Self->{ConfigItemObject}->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $ConfigItemName . '_Hardware_' .  $NameSuffix,
        DefinitionID => $DefinitionRef->{DefinitionID},
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Operational},
        XMLData      => [
                        undef,
                        {
                            Version => [
                                undef,
                                {
                                    Vendor => [
                                        undef,
                                        {
                                            Content => 'TestVendor',
                                        },
                                    ],
                                },
                            ],
                        },
                    ],
        UserID       => 1,
    );

    $Self->True(
        $VersionID,
        "Added a version for the configitem id $ConfigItemID",
    );
}

# read the original setting for the setting IncidentLinkTypeDirection
my $OrigIncidentLinkTypeDirectionSetting = $Self->{ConfigObject}->Get('ITSM::Core::IncidentLinkTypeDirection');

$Self->{LogObject}->Dumper( '', '$OrigIncidentLinkTypeDirectionSetting', $OrigIncidentLinkTypeDirectionSetting );

# set config
$Self->{ConfigObject}->Set(
    Key   => 'ITSM::Core::IncidentLinkTypeDirection',
    Value => {
        DependsOn => 'Source',
        Includes  => 'Source',
    },
);

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# reset the enabled setting for IncidentLinkTypeDirection to its original value
$Self->{ConfigObject}->Set(
    Key   => 'ITSM::Core::IncidentLinkTypeDirection',
    Value => $OrigIncidentLinkTypeDirectionSetting,
);

# delete the test config items
for my $ConfigItemID (@ConfigItemIDs) {
    my $DeleteOk = $Self->{ConfigItemObject}->ConfigItemDelete(
        ConfigItemID => $ConfigItemID,
        UserID       => 1,
    );
}

1;
