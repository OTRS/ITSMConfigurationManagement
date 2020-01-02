# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Console::Command::Admin::ITSM::IncidentState::Recalculate;

use strict;
use warnings;

## nofilter(TidyAll::Plugin::OTRS::Migrations::OTRS6::SysConfig)

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Service',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Recalculates the incident state of config items.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Recalculating the incident state of config items...</yellow>\n\n");

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get the valid class ids
    my @ValidClassIDs = sort keys %{$ClassList};

    # get all config items ids form all valid classes
    my $ConfigItemsIDsRef = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearch(
        ClassIDs => \@ValidClassIDs,
    );

    # get number of config items
    my $CICount = scalar @{$ConfigItemsIDsRef};

    $Self->Print("<yellow>Recalculating incident state for $CICount config items.</yellow>\n");

    # Remember config item results through multiple runs of CurInciStateRecalc().
    my %NewConfigItemIncidentState;
    my %ScannedConfigItemIDs;

    my $Count = 0;
    CONFIGITEM:
    for my $ConfigItemID ( @{$ConfigItemsIDsRef} ) {

        my $Success = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->CurInciStateRecalc(
            ConfigItemID               => $ConfigItemID,
            NewConfigItemIncidentState => \%NewConfigItemIncidentState,
            ScannedConfigItemIDs       => \%ScannedConfigItemIDs,
        );

        if ( !$Success ) {
            $Self->Print("<red>... could not recalculate incident state for config item id '$ConfigItemID'!</red>\n");
            next CONFIGITEM;
        }

        $Count++;

        if ( $Count % 100 == 0 ) {
            $Self->Print("<green>... $Count config items recalculated.</green>\n");
        }
    }

    $Self->Print("\n<green>Ready. Recalculated $Count config items.</green>\n\n");

    # get service object
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

    # get list of all services (valid and invalid)
    my %ServiceList = $ServiceObject->ServiceList(
        Valid  => 0,
        UserID => 1,
    );

    my $NumberOfServices = scalar keys %ServiceList;

    $Self->Print(
        "<green>Resetting ServicePreferences 'CurInciStateTypeFromCIs' for $NumberOfServices services...</green>\n"
    );

    for my $ServiceID ( sort keys %ServiceList ) {

        # update the current incident state type from CIs of the service with an empty value
        # this is necessary to force a recalculation on a ServiceGet()
        $ServiceObject->ServicePreferencesSet(
            ServiceID => $ServiceID,
            Key       => 'CurInciStateTypeFromCIs',
            Value     => '',
            UserID    => 1,
        );
    }

    $Self->Print("<green>Ready.</green>\n");
    return $Self->ExitCodeOk();

}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
