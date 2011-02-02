# --
# Kernel/Language/en_GB_ITSMConfigItem.pm - the en_GB translation
# Copyright (C) 2001-2009 Olivier Sallou <olivier.sallou at irisa.fr>
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: en_GB_ITSMConfigItem.pm,v 1.1 2011-02-02 15:38:28 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_GB_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Developer Licence'}                      = 'Developer Licence';
    $Lang->{'Enterprise Licence'}                     = 'Enterprise Licence';
    $Lang->{'Single Licence'}                         = 'Single Licence';
    $Lang->{'Volume Licence'}                         = 'Volume Licence';
    $Lang->{'Licence Type'}                           = 'Licence Type';
    $Lang->{'Licence Key'}                            = 'Licence Key';
    $Lang->{'Licence Key::Quantity'}                  = 'Licence Key::Quantity';
    $Lang->{'Licence Key::Expiration Date'}           = 'Licence Key::Expiration Date';

    return 1;
}

1;
