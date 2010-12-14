#!/usr/bin/perl -w
# --
# bin/otrs.ITSMConfigItemDelete.pl - to delete config items
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: otrs.ITSMConfigItemDelete.pl,v 1.1 2010-12-14 19:41:08 ub Exp $
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
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

use Getopt::Long;
use Kernel::Config;
use Kernel::System::Encode;
use Kernel::System::Log;
use Kernel::System::Main;
use Kernel::System::Time;
use Kernel::System::DB;
use Kernel::System::ITSMConfigItem;
use Kernel::System::GeneralCatalog;

# common objects
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{EncodeObject} = Kernel::System::Encode->new(%CommonObject);
$CommonObject{LogObject}    = Kernel::System::Log->new(
    LogPrefix => 'OTRS-ConfigItemDelete.pl',
    %CommonObject,
);
$CommonObject{MainObject}           = Kernel::System::Main->new(%CommonObject);
$CommonObject{TimeObject}           = Kernel::System::Time->new(%CommonObject);
$CommonObject{DBObject}             = Kernel::System::DB->new(%CommonObject);
$CommonObject{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new(%CommonObject);
$CommonObject{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new(%CommonObject);

print "otrs.ITSMConfigItemDelete.pl <Revision $VERSION> - ";
print "delete config items (all, by class or by number).\n";
print "Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";

my $Help              = '';
my $All               = '';
my $Class             = '';
my @ConfigItemNumbers = ();

GetOptions(
    'help'                  => \$Help,
    'all'                   => \$All,
    'class=s'               => \$Class,
    'ConfigItemNumber=s{,}' => \@ConfigItemNumbers,
);

# delete all config items
if ($All) {

    # get all config items ids
    my @ConfigItemsIDs = @{ $CommonObject{ConfigItemObject}->ConfigItemSearch() };

    # get number of config items
    my $CICount = scalar @ConfigItemsIDs;

    # if there are any CI to delete
    if ($CICount) {

        print "Are you sure that you want to delete ALL $CICount config items? ";
        print "This is irrevocable. [y/n] ";
        chomp( my $Confirmation = lc <STDIN> );

        # if the user confirms the deletion
        if ( $Confirmation eq 'y' ) {

            # delete config items
            print "Deleting all config items...\n";
            DeleteConfigItems( ConfigItemsIDs => \@ConfigItemsIDs );
        }
        else {
            exit 1;
        }
    }
    else {
        print "There are NO config items to delete.\n";
    }
}

# delete listed config items
elsif (@ConfigItemNumbers) {

    my @ConfigItemsIDs;

    for my $ConfigItemNumber (@ConfigItemNumbers) {

        # checks the validity of the config item id
        my $ID = $CommonObject{ConfigItemObject}->ConfigItemLookup(
            ConfigItemNumber => $ConfigItemNumber,
        );

        if ($ID) {
            push @ConfigItemsIDs, $ID;
        }
        else {
            print "Unable to find config item $ConfigItemNumber.\n";
        }
    }

    # delete config items (if any valid number was given)
    if (@ConfigItemsIDs) {
        print "Deleting specified config items...\n";
        DeleteConfigItems( ConfigItemsIDs => \@ConfigItemsIDs );
    }
}

# delete config items that belong to the class
elsif ($Class) {

    my @ConfigItemsIDs;

    # get class list
    my $ClassList = $CommonObject{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # invert the hash to have the classes' names as keys
    my %ClassName2ID = reverse %{$ClassList};

    if ( $ClassName2ID{$Class} ) {
        my $ID = $ClassName2ID{$Class};

        # get ids of this class' config items
        @ConfigItemsIDs
            = @{ $CommonObject{ConfigItemObject}->ConfigItemSearch( ClassIDs => [$ID] ) };
    }
    else {
        print "Unable to find class name $Class.\n";
    }

    # delete config items (if any valid number was given)
    if (@ConfigItemsIDs) {
        print "Deleting config items that belong to the class $Class...\n";
        DeleteConfigItems( ConfigItemsIDs => \@ConfigItemsIDs );
    }
    else {
        print "There are no config items that belong to the class $Class...\n";
    }
}

# show usage
else {
    print "Usage: $0 [options] \n";
    print "  Options are as follows:\n";
    print "  --help                             display this option help\n";
    print "  --all                              delete all config items\n";
    print "  --class name                       delete all config items of this class\n";
    print "  --ConfigItemNumber no1 no2 no3     delete listed config items\n";
    exit 1;
}

1;

sub DeleteConfigItems {

    # get parameters
    my (%Param) = @_;

    my $DeletedCI;

    # delete specified config items
    for my $ConfigItemID ( @{ $Param{ConfigItemsIDs} } ) {
        my $True = $CommonObject{ConfigItemObject}->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => 1,
        );
        if ( !$True ) {
            print "Unable to delete config item with id $ConfigItemID\n";
        }
        else {
            $DeletedCI++;
        }
    }
    print "$DeletedCI config items have been deleted.\n\n";

    return 1;
}
