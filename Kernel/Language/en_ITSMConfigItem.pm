# --
# Kernel/Language/en_ITSMConfigItem.pm - the english translation of ITSMConfigItem
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: en_ITSMConfigItem.pm,v 1.3 2011-02-11 09:11:18 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'CIHistory::ConfigItemCreate'}            = 'New ConfigItem (ID=%s)';
    $Lang->{'CIHistory::VersionCreate'}               = 'New version (ID=%s)';
    $Lang->{'CIHistory::DeploymentStateUpdate'}       = 'Deployment state updated (new=%s; old=%s)';
    $Lang->{'CIHistory::IncidentStateUpdate'}         = 'Incident state updated (new=%s; old=%s)';
    $Lang->{'CIHistory::ConfigItemDelete'}            = 'ConfigItem (ID=%s) deleted';
    $Lang->{'CIHistory::LinkAdd'}                     = 'Link to %s (type=%s) added';
    $Lang->{'CIHistory::LinkDelete'}                  = 'Link to %s (type=%s) deleted';
    $Lang->{'CIHistory::DefinitionUpdate'}            = 'ConfigItems\' definition updated (ID=%s)';
    $Lang->{'CIHistory::NameUpdate'}                  = 'Name updated (new=%s; old=%s)';
    $Lang->{'CIHistory::ValueUpdate'}                 = 'Attribute %s updated from "%s" to "%s"';
    $Lang->{'CIHistory::VersionDelete'}               = 'Version %s deleted';

    $Lang->{'Developer Licence'}                      = 'Developer License';
    $Lang->{'Enterprise Licence'}                     = 'Enterprise License';
    $Lang->{'Single Licence'}                         = 'Single License';
    $Lang->{'Volume Licence'}                         = 'Volume License';
    $Lang->{'Licence Type'}                           = 'License Type';
    $Lang->{'Licence Key'}                            = 'License Key';
    $Lang->{'Licence Key::Quantity'}                  = 'License Key::Quantity';
    $Lang->{'Licence Key::Expiration Date'}           = 'License Key::Expiration Date';

    return 1;
}

1;
