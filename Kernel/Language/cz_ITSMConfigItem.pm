# --
# Kernel/Language/cz_ITSMConfigItem.pm - the czech translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: cz_ITSMConfigItem.pm,v 1.6 2009-07-20 13:11:18 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cz_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Konfig. jednotky CI';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = 'Øízení konfiguraèních jednotek CI';
    $Lang->{'Change Definition'}      = 'Zmìna definice';
    $Lang->{'Class'}                  = 'Tøída';
    $Lang->{'Show Versions'}          = 'Uka¾ Verze';
    $Lang->{'Hide Versions'}          = 'Hide Verze';
    $Lang->{'Last changed by'}        = 'Poslední zmìna od';
    $Lang->{'Last changed'}           = 'Poslední zmìna';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Zmìna definicí neúspì¹ná! Viz systémový záznam o detajlech.';
    $Lang->{'Also search in previous versions?'}        = 'Hledat v pøedchozích verzích?';
    $Lang->{'Config Items shown'}                       = 'Ukazané konfig.jednotky';
    $Lang->{'Config Items available'}                   = 'Dostupné konfig.jednotky';
    $Lang->{'Search Config Items'}                      = '';
    $Lang->{'Deployment State'}                         = '';
    $Lang->{'Current Deployment State'}                 = '';
    $Lang->{'Incident State'}                           = '';
    $Lang->{'Current Incident State'}                   = '';
    $Lang->{'The name of this config item'}             = '';
    $Lang->{'The deployment state of this config item'} = '';
    $Lang->{'The incident state of this config item'}   = '';
    $Lang->{'Last Change'}                              = 'Poslední zmìna';
    $Lang->{'Duplicate'}                                = 'Zhotovit kopie';
    $Lang->{'Expired'}                                  = 'Vyprchlé';
    $Lang->{'Inactive'}                                 = 'Neaktivní';
    $Lang->{'Maintenance'}                              = 'Údr¾ba';
    $Lang->{'Pilot'}                                    = 'Pilot-vùdce';
    $Lang->{'Planned'}                                  = 'Planován';
    $Lang->{'Production'}                               = 'Produkèní';
    $Lang->{'Repair'}                                   = 'Oprava/Obnovení';
    $Lang->{'Retired'}                                  = 'Mimo provoz';
    $Lang->{'Review'}                                   = 'Prohlí¾en';
    $Lang->{'Test/QA'}                                  = 'Test/Kontrola kvality';
    $Lang->{'Operational'}                              = '';
    $Lang->{'Incident'}                                 = '';
    $Lang->{'Desktop'}                                  = 'Stolní';
    $Lang->{'Laptop'}                                   = 'Mobilní';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Telefon';
    $Lang->{'Server'}                                   = 'Server';
    $Lang->{'Backup Device'}                            = 'Zálohovácí zaøízení';
    $Lang->{'Beamer'}                                   = 'Beamer';
    $Lang->{'Camera'}                                   = 'Komora';
    $Lang->{'Docking Station'}                          = 'Dok stanice';
    $Lang->{'Keybord'}                                  = 'Klávesnice';
    $Lang->{'Modem'}                                    = 'Modem';
    $Lang->{'Monitor'}                                  = 'Obrazovka';
    $Lang->{'Mouse'}                                    = 'My¹';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA karta';
    $Lang->{'Printer'}                                  = 'Tiskárna';
    $Lang->{'Router'}                                   = 'Ruetr';
    $Lang->{'Scanner'}                                  = 'Snímaè';
    $Lang->{'Security Device'}                          = 'Bezpeènostné zaøízení';
    $Lang->{'Switch'}                                   = 'Spínaè';
    $Lang->{'USB Device'}                               = 'USB zaøízení';
    $Lang->{'WLAN Access Point'}                        = 'WLAN bod pøístupu';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Administraèní nástroj';
    $Lang->{'Client Application'}                       = 'U¾ivatelské aplikace';
    $Lang->{'Client OS'}                                = 'U¾ivatelský operaèní systém';
    $Lang->{'Embedded'}                                 = 'Vestavìný';
    $Lang->{'Middleware'}                               = 'Støední úroveò';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'Server Application'}                       = 'Serverová aplikace';
    $Lang->{'Server OS'}                                = 'Serverový oper.systém';
    $Lang->{'User Tool'}                                = 'U¾ivatelský nástroj';
    $Lang->{'Concurrent Users'}                         = 'Konkurenèní u¾ivatelé';
    $Lang->{'Demo'}                                     = 'Demo';
    $Lang->{'Developer Licence'}                        = 'Licence vývojáøe';
    $Lang->{'Enterprise Licence'}                       = 'Podnikatelská licence ';
    $Lang->{'Freeware'}                                 = 'Bezplatný';
    $Lang->{'Open Source'}                              = 'Software s otevøeným k?dem';
    $Lang->{'Per Node'}                                 = 'Licencování úzlu';
    $Lang->{'Per Processor'}                            = 'Licencování pro procesor';
    $Lang->{'Per Server'}                               = 'Licencování pro server';
    $Lang->{'Per User'}                                 = 'Licencování pro u¾ivatele';
    $Lang->{'Single Licence'}                           = 'Jednotlivá licence';
    $Lang->{'Time Restricted'}                          = 'Èasovì omezená licence';
    $Lang->{'Unlimited'}                                = 'Neomezená licence ';
    $Lang->{'Volume Licence'}                           = 'Speciální obìmové programy';
    $Lang->{'Model'}                                    = 'Model';
    $Lang->{'Serial Number'}                            = 'Sériové èíslo';
    $Lang->{'Operating System'}                         = 'Operaèní systém';
    $Lang->{'CPU'}                                      = 'Procesor';
    $Lang->{'Ram'}                                      = 'Pamì»';
    $Lang->{'Hard Disk'}                                = 'Tvrdý disk';
    $Lang->{'Hard Disk::Capacity'}                      = 'Tvrdý disk::kapacita';
    $Lang->{'Capacity'}                                 = '?Kapacita';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'Sí»ový adapter';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'Sí»ový adapter::IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'Sí»ový adapter::IP adresa';
    $Lang->{'IP over DHCP'}                             = 'IP z DHCP';
    $Lang->{'IP Address'}                               = 'IP adresa';
    $Lang->{'Graphic Adapter'}                          = 'Grafická karta';
    $Lang->{'Other Equipment'}                          = 'Jiné vybavení';
    $Lang->{'Warranty Expiration Date'}                 = 'Konec platnosti záruky';
    $Lang->{'Install Date'}                             = 'Datum instalace';
    $Lang->{'Network Address'}                          = 'Sí»ová adresa';
    $Lang->{'Network Address::Subnet Mask'}             = 'Sí»ová adresa:maska subsítì';
    $Lang->{'Network Address::Gateway'}                 = 'Sí»ová adresa::Gate pøechod';
    $Lang->{'Subnet Mask'}                              = 'Maska subsítì';
    $Lang->{'Gateway'}                                  = 'Gate pøechod';
    $Lang->{'Licence Type'}                             = 'Druh licence';
    $Lang->{'Licence Key'}                              = 'Licenèní klíè';
    $Lang->{'Licence Key::Quantity'}                    = 'Licenèní klíè::Mno¾ství';
    $Lang->{'Licence Key::Expiration Date'}             = 'Licenèní klíè::konec platnosti';
    $Lang->{'Quantity'}                                 = 'Mno¾ství';
    $Lang->{'Expiration Date'}                          = 'Konec platnosti';
    $Lang->{'Media'}                                    = 'Médium';
    $Lang->{'Maximum number of one element'}            = '';
    $Lang->{'Identifier'}                               = '';
    $Lang->{'Phone 1'}                                  = '';
    $Lang->{'Phone 2'}                                  = '';
    $Lang->{'Address'}                                  = '';
    $Lang->{'Building'}                                 = '';
    $Lang->{'Floor'}                                    = '';
    $Lang->{'IT Facility'}                              = '';
    $Lang->{'Office'}                                   = '';
    $Lang->{'Outlet'}                                   = '';
    $Lang->{'Rack'}                                     = '';
    $Lang->{'Room'}                                     = '';
    $Lang->{'Workplace'}                                = '';

    return 1;
}

1;
