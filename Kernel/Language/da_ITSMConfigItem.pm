# --
# Kernel/Language/da_ITSMConfigItem.pm - provides da (Danish) language translation
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: da_ITSMConfigItem.pm,v 1.1 2010-06-25 09:00:27 mb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::da_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Config Item';
    $Lang->{'Config Item-Area'}       = 'Config Item-område';
    $Lang->{'Config Item Management'} = 'Config Item styring';
    $Lang->{'Change Definition'}      = 'Ændre definition';
    $Lang->{'Class'}                  = 'Klasse';
    $Lang->{'Show Versions'}          = 'Vis versioner';
    $Lang->{'Hide Versions'}          = 'Skjul versioner';
    $Lang->{'Last changed by'}        = 'Sidst ændret af';
    $Lang->{'Last changed'}           = 'Sidst ændret';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Ændring af definition fejlede! Se System Log for detaljer.';
    $Lang->{'Also search in previous versions?'} = 'Søg også i tidligere versioner?';
    $Lang->{'Config Items shown'}                = 'Vis Config Items';
    $Lang->{'Config Items available'}            = 'Tilgængelige Config Items';
    $Lang->{'Search Config Items'}               = 'Søg Config Item';
    $Lang->{'Deployment State'}                  = 'Deployment tilstand';
    $Lang->{'Current Deployment State'}          = 'Nuværende deployment status';
    $Lang->{'Incident State'}                    = 'Incident tilstand';
    $Lang->{'Current Incident State'}            = 'Nuværende Incident tilstand';
    $Lang->{'The name of this config item'}      = 'Navnet på denne Config Item';
    $Lang->{'The deployment state of this config item'}
        = 'Deployment tilstand for denne Config item';
    $Lang->{'The incident state of this config item'} = 'Incident tilstand for denne Config Item';
    $Lang->{'Last Change'}                            = 'Sidst ændret';
    $Lang->{'Duplicate'}                              = 'Dupliker';
    $Lang->{'Expired'}                                = 'Udløbet';
    $Lang->{'Inactive'}                               = 'Inaktiv';
    $Lang->{'Maintenance'}                            = 'Vedligeholdelse';
    $Lang->{'Pilot'}                                  = 'Pilot';
    $Lang->{'Planned'}                                = 'Planlagt';
    $Lang->{'Production'}                             = 'Produktion';
    $Lang->{'Repair'}                                 = 'Reperation';
    $Lang->{'Retired'}                                = 'Persioneret';
    $Lang->{'Review'}                                 = 'Anmeldelse';
    $Lang->{'Test/QA'}                                = 'Test/QA';
    $Lang->{'Operational'}                            = 'Operationel';
    $Lang->{'Incident'}                               = 'Incident';
    $Lang->{'Desktop'}                                = 'Desktop';
    $Lang->{'Laptop'}                                 = 'Laptop';
    $Lang->{'Other'}                                  = 'Andet';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Telefon';
    $Lang->{'Server'}                                 = 'Server';
    $Lang->{'Backup Device'}                          = 'Backup enhed';
    $Lang->{'Beamer'}                                 = 'Beamer';
    $Lang->{'Camera'}                                 = 'Kamera';
    $Lang->{'Docking Station'}                        = 'Docking Station';
    $Lang->{'Keybord'}                                = 'Tastatur';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Monitor';
    $Lang->{'Mouse'}                                  = 'Mus';
    $Lang->{'Other'}                                  = 'Andet';
    $Lang->{'PCMCIA Card'}                            = 'PCMCIA kort';
    $Lang->{'Printer'}                                = 'Printer';
    $Lang->{'Router'}                                 = 'Router';
    $Lang->{'Scanner'}                                = 'Skanner';
    $Lang->{'Security Device'}                        = 'Sikkerhedsenhed';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'USB enhed';
    $Lang->{'WLAN Access Point'}                      = 'WLAN Access Point';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Andet';
    $Lang->{'Telco'}                                  = 'Telco';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Admin værktøjer';
    $Lang->{'Client Application'}                     = 'Klient aplikation';
    $Lang->{'Client OS'}                              = 'Klient OS';
    $Lang->{'Embedded'}                               = 'Embedded';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Andet';
    $Lang->{'Server Application'}                     = 'Server aplikation';
    $Lang->{'Server OS'}                              = 'Server OS';
    $Lang->{'User Tool'}                              = 'Bruger værktøjer';
    $Lang->{'Concurrent Users'}                       = 'Samtidige brugere';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'Udvikler licens';
    $Lang->{'Enterprise Licence'}                     = 'Enterprise licens';
    $Lang->{'Freeware'}                               = 'Freeware';
    $Lang->{'Open Source'}                            = 'Open Source';
    $Lang->{'Per Node'}                               = 'Pr node';
    $Lang->{'Per Processor'}                          = 'Pr processor';
    $Lang->{'Per Server'}                             = 'Pr server';
    $Lang->{'Per User'}                               = 'Pr bruger';
    $Lang->{'Single Licence'}                         = 'Enkeltlicens';
    $Lang->{'Time Restricted'}                        = 'Tidsbegrænset';
    $Lang->{'Unlimited'}                              = 'Unbegrænset';
    $Lang->{'Volume Licence'}                         = 'Volumen Licens';
    $Lang->{'Model'}                                  = 'Model';
    $Lang->{'Serial Number'}                          = 'Serienummer';
    $Lang->{'Operating System'}                       = 'OS';
    $Lang->{'CPU'}                                    = 'CPU';
    $Lang->{'Ram'}                                    = 'RAM';
    $Lang->{'Hard Disk'}                              = 'Harddisk';
    $Lang->{'Hard Disk::Capacity'}                    = 'Harddisk::Kapacitet';
    $Lang->{'Capacity'}                               = 'Kapacitet';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'Netkort';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Netkort::IP via DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Netkort::IP adresse';
    $Lang->{'IP over DHCP'}                           = 'IP via DHCP';
    $Lang->{'IP Address'}                             = 'IP adresse';
    $Lang->{'Graphic Adapter'}                        = 'Grafikkort';
    $Lang->{'Other Equipment'}                        = 'Andet udstyr';
    $Lang->{'Warranty Expiration Date'}               = 'Udløbsdato for garanti';
    $Lang->{'Install Date'}                           = 'Installationsdato';
    $Lang->{'Network Address'}                        = 'Netværksadresse';
    $Lang->{'Network Address::Subnet Mask'}           = 'Netværksadresse::Subnet maske';
    $Lang->{'Network Address::Gateway'}               = 'Netværksadresse::Gateway';
    $Lang->{'Subnet Mask'}                            = 'Subnet maske';
    $Lang->{'Gateway'}                                = 'Gateway';
    $Lang->{'Licence Type'}                           = 'Licenstype';
    $Lang->{'Licence Key'}                            = 'Licensnøgle';
    $Lang->{'Licence Key::Quantity'}                  = 'Licensnøgle::Mængde';
    $Lang->{'Licence Key::Expiration Date'}           = 'Licensnøgle::Udløbsdato';
    $Lang->{'Quantity'}                               = 'Mængde';
    $Lang->{'Expiration Date'}                        = 'Udløbsdato';
    $Lang->{'Media'}                                  = 'Medie';
    $Lang->{'Maximum number of one element'}          = 'Maximum antal af et element';
    $Lang->{'Identifier'}                             = 'Identifikator';
    $Lang->{'Phone 1'}                                = 'Telefon 1';
    $Lang->{'Phone 2'}                                = 'Telefon 2';
    $Lang->{'Address'}                                = 'Adresse';
    $Lang->{'Building'}                               = 'Bygning';
    $Lang->{'Floor'}                                  = 'Etage';
    $Lang->{'IT Facility'}                            = 'IT facilitet';
    $Lang->{'Office'}                                 = 'Kontor';
    $Lang->{'Outlet'}                                 = 'Stikkontakt';
    $Lang->{'Rack'}                                   = 'Rack';
    $Lang->{'Room'}                                   = 'Rum';
    $Lang->{'Workplace'}                              = 'Arbejdsplads';

    return 1;
}

1;
