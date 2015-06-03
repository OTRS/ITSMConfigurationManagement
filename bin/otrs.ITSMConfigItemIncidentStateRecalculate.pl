#!/usr/bin/perl
# --
# Copyright (C) 2001-2015 OTRS AG, http://otrs.com/
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

# TODO:
# Remove this after the script has been migrated to a console moddule
## nofilter(TidyAll::Plugin::OTRS::Perl::BinScripts)

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use Getopt::Long;

use Kernel::System::ObjectManager;

# create object manager object
local $Kernel::OM = Kernel::System::ObjectManager->new(
    'Kernel::System::Log' => {
        LogPrefix => 'OTRS-ITSMConfigItemIncidentStateRecalculate.pl',
    },
);

print "\n";
print "otrs.ITSMConfigItemIncidentStateRecalculate.pl\n";
print "Recalculates the incident state of config items.\n";
print
    "This is necessary after changing the sysconfig option 'ITSM::Core::IncidentLinkTypeDirection'.\n";
print "Copyright (C) 2001-2015 OTRS AG, http://otrs.com/\n\n";

my $Help;

GetOptions(
    'help' => \$Help,
);

# show usage
if ($Help) {
    print "Usage: $0 [options] \n\n";
    print "  Options are as follows:\n";
    print "  --help  display this option help\n\n";
    exit 1;
}

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

print "Recalculating incident state for $CICount config items.\n";

my $Count = 0;
CONFIGITEM:
for my $ConfigItemID ( @{$ConfigItemsIDsRef} ) {

    my $Success = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->CurInciStateRecalc(
        ConfigItemID => $ConfigItemID,
    );

    if ( !$Success ) {
        print "... could not recalculate incident state for config item id '$ConfigItemID'!\n";
        next CONFIGITEM;
    }

    $Count++;

    if ( $Count % 100 == 0 ) {
        print "... $Count config items recalculated.\n";
    }
}

print "\nReady. Recalculated $Count config items.\n\n";

# get list of all services (valid and invalid)
my %ServiceList = $Kernel::OM->Get('Kernel::System::Service')->ServiceList(
    Valid  => 0,
    UserID => 1,
);

my $NumberOfServices = scalar keys %ServiceList;

print "Resetting ServicePreferences 'CurInciStateTypeFromCIs' for $NumberOfServices services... ";

for my $ServiceID ( sort keys %ServiceList ) {

    # update the current incident state type from CIs of the service with an empty value
    # this is necessary to force a recalculation on a ServiceGet()
    $Kernel::OM->Get('Kernel::System::Service')->ServicePreferencesSet(
        ServiceID => $ServiceID,
        Key       => 'CurInciStateTypeFromCIs',
        Value     => '',
        UserID    => 1,
    );
}

print "Ready.\n\n";

1;
