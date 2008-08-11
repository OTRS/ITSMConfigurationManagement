# --
# Kernel/Language/cz_ITSMConfigItem.pm - the czech translation of ITSMConfigItem
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: cz_ITSMConfigItem.pm,v 1.2 2008-08-11 08:11:41 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::cz_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Konfig. jednotky CI';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = 'Řízení konfiguračních jednotek CI';
    $Lang->{'Change Definition'}      = 'Změna definice';
    $Lang->{'Class'}                  = 'Třída';
    $Lang->{'Show Versions'}          = 'Ukaž Verze';
    $Lang->{'Hide Versions'}          = 'Hide Verze';
    $Lang->{'Last changed by'}        = 'Poslední změna od';
    $Lang->{'Last changed'}           = 'Poslední změna';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Změna definicí neúspěšná! Viz systémový záznam o detajlech.';
    $Lang->{'Also search in previous versions?'}        = 'Hledat v předchozích verzích?';
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
    $Lang->{'Last Change'}                              = 'Poslední změna';
    $Lang->{'Duplicate'}                                = 'Zhotovit kopie';
    $Lang->{'Expired'}                                  = 'Vyprchlé';
    $Lang->{'Inactive'}                                 = 'Neaktivní';
    $Lang->{'Maintenance'}                              = 'Údržba';
    $Lang->{'Pilot'}                                    = 'Pilot-vůdce';
    $Lang->{'Planned'}                                  = 'Planován';
    $Lang->{'Production'}                               = 'Produkční';
    $Lang->{'Repair'}                                   = 'Oprava/Obnovení';
    $Lang->{'Retired'}                                  = 'Mimo provoz';
    $Lang->{'Review'}                                   = 'Prohlížen';
    $Lang->{'Test/QA'}                                  = 'Test/Kontrola kvality';
    $Lang->{'Operational'}                              = '';
    $Lang->{'Incident'}                                 = '';
    $Lang->{'Desktop'}                                  = 'Stolní';
    $Lang->{'Laptop'}                                   = 'Mobilní';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Telefon';
    $Lang->{'Server'}                                   = 'Server';
    $Lang->{'Backup Device'}                            = 'Zálohovácí zařízení';
    $Lang->{'Beamer'}                                   = 'Beamer';
    $Lang->{'Camera'}                                   = 'Komora';
    $Lang->{'Docking Station'}                          = 'Dok stanice';
    $Lang->{'Keybord'}                                  = 'Klávesnice';
    $Lang->{'Modem'}                                    = 'Modem';
    $Lang->{'Monitor'}                                  = 'Obrazovka';
    $Lang->{'Mouse'}                                    = 'Myš';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA karta';
    $Lang->{'Printer'}                                  = 'Tiskárna';
    $Lang->{'Router'}                                   = 'Ruetr';
    $Lang->{'Scanner'}                                  = 'Snímač';
    $Lang->{'Security Device'}                          = 'Bezpečnostné zařízení';
    $Lang->{'Switch'}                                   = 'Spínač';
    $Lang->{'USB Device'}                               = 'USB zařízení';
    $Lang->{'WLAN Access Point'}                        = 'WLAN bod přístupu';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Administrační nástroj';
    $Lang->{'Client Application'}                       = 'Uživatelské aplikace';
    $Lang->{'Client OS'}                                = 'Uživatelský operační systém';
    $Lang->{'Embedded'}                                 = 'Vestavěný';
    $Lang->{'Middleware'}                               = 'Střední úroveň';
    $Lang->{'Other'}                                    = 'Ostatní';
    $Lang->{'Server Application'}                       = 'Serverová aplikace';
    $Lang->{'Server OS'}                                = 'Serverový oper.systém';
    $Lang->{'User Tool'}                                = 'Uživatelský nástroj';
    $Lang->{'Concurrent Users'}                         = 'Konkurenční uživatelé';
    $Lang->{'Demo'}                                     = 'Demo';
    $Lang->{'Developer Licence'}                        = 'Licence vývojáře';
    $Lang->{'Enterprise Licence'}                       = 'Podnikatelská licence ';
    $Lang->{'Freeware'}                                 = 'Bezplatný';
    $Lang->{'Open Source'}                              = 'Software s otevřeným kόdem';
    $Lang->{'Per Node'}                                 = 'Licencování úzlu';
    $Lang->{'Per Processor'}                            = 'Licencování pro procesor';
    $Lang->{'Per Server'}                               = 'Licencování pro server';
    $Lang->{'Per User'}                                 = 'Licencování pro uživatele';
    $Lang->{'Single Licence'}                           = 'Jednotlivá licence';
    $Lang->{'Time Restricted'}                          = 'Časově omezená licence';
    $Lang->{'Unlimited'}                                = 'Neomezená licence ';
    $Lang->{'Volume Licence'}                           = 'Speciální oběmové programy';
    $Lang->{'Model'}                                    = 'Model';
    $Lang->{'Serial Number'}                            = 'Sériové číslo';
    $Lang->{'Operating System'}                         = 'Operační systém';
    $Lang->{'CPU'}                                      = 'Procesor';
    $Lang->{'Ram'}                                      = 'Paměť';
    $Lang->{'Hard Disk'}                                = 'Tvrdý disk';
    $Lang->{'Hard Disk::Capacity'}                      = 'Tvrdý disk::kapacita';
    $Lang->{'Capacity'}                                 = 'КKapacita';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'Síťový adapter';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'Síťový adapter::IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'Síťový adapter::IP adresa';
    $Lang->{'IP over DHCP'}                             = 'IP z DHCP';
    $Lang->{'IP Address'}                               = 'IP adresa';
    $Lang->{'Graphic Adapter'}                          = 'Grafická karta';
    $Lang->{'Other Equipment'}                          = 'Jiné vybavení';
    $Lang->{'Warranty Expiration Date'}                 = 'Konec platnosti záruky';
    $Lang->{'Install Date'}                             = 'Datum instalace';
    $Lang->{'Network Address'}                          = 'Síťová adresa';
    $Lang->{'Network Address::Subnet Mask'}             = 'Síťová adresa:maska subsítě';
    $Lang->{'Network Address::Gateway'}                 = 'Síťová adresa::Gate přechod';
    $Lang->{'Subnet Mask'}                              = 'Maska subsítě';
    $Lang->{'Gateway'}                                  = 'Gate přechod';
    $Lang->{'Licence Type'}                             = 'Druh licence';
    $Lang->{'Licence Key'}                              = 'Licenční klíč';
    $Lang->{'Licence Key::Quantity'}                    = 'Licenční klíč::Množství';
    $Lang->{'Licence Key::Expiration Date'}             = 'Licenční klíč::konec platnosti';
    $Lang->{'Quantity'}                                 = 'Množství';
    $Lang->{'Expiration Date'}                          = 'Konec platnosti';
    $Lang->{'Media'}                                    = 'Médium';
    $Lang->{'Maximum number of one element'}            = '';
    $Lang->{'Identifier'}                               = '';

    return 1;
}

1;
