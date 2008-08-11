# --
# Kernel/Language/pl_ITSMConfigItem.pm - the polski translation of ITSMConfigItem
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: pl_ITSMConfigItem.pm,v 1.1 2008-08-11 11:29:56 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::Language::pl_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = '';
    $Lang->{'Change Definition'}      = '';
    $Lang->{'Class'}                  = '';
    $Lang->{'Show Versions'}          = 'Poka¿ wersje';
    $Lang->{'Hide Versions'}          = 'Ukryj wersje';
    $Lang->{'Last changed by'}        = 'Ostatnio zmienione przez';
    $Lang->{'Last changed'}           = 'Ostatnio zmienione';
    $Lang->{'Change of definition failed! See System Log for details.'} = '';
    $Lang->{'Also search in previous versions?'} = 'Uwzglêdniæ poprzednie wersje?';
    $Lang->{'Config Items shown'}                = '';
    $Lang->{'Config Items available'}            = '';
    $Lang->{'Search Config Items'}               = '';
    $Lang->{'Deployment State'}                  = 'Stan wdro¿enia';
    $Lang->{'Current Deployment State'}          = 'Aktualny stan wdro¿enia';
    $Lang->{'Incident State'}                    = 'Stan zdarzenia';
    $Lang->{'Current Incident State'}            = 'Aktualny stan zdarzenia';
    $Lang->{'The name of this config item'}      = '';
    $Lang->{'The deployment state of this config item'} = '';
    $Lang->{'The incident state of this config item'} = '';
    $Lang->{'Last Change'}                            = 'Ostatnia zmiana';
    $Lang->{'Duplicate'}                              = 'Duplikat';
    $Lang->{'Expired'}                                = 'Wygas³o';
    $Lang->{'Inactive'}                               = 'Nieaktywny';
    $Lang->{'Maintenance'}                            = '';
    $Lang->{'Pilot'}                                  = '';
    $Lang->{'Planned'}                                = 'Planowany';
    $Lang->{'Production'}                             = 'Produkcja';
    $Lang->{'Repair'}                                 = 'Naprawa';
    $Lang->{'Retired'}                                = '';
    $Lang->{'Review'}                                 = '';
    $Lang->{'Test/QA'}                                = '';
    $Lang->{'Operational'}                            = '';
    $Lang->{'Incident'}                               = '';
    $Lang->{'Desktop'}                                = 'Desktop';
    $Lang->{'Laptop'}                                 = 'Laptop';
    $Lang->{'Other'}                                  = 'Inne';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'Telefon';
    $Lang->{'Server'}                                 = 'Serwer';
    $Lang->{'Backup Device'}                          = 'Urz±dzenie do backupu';
    $Lang->{'Beamer'}                                 = '';
    $Lang->{'Camera'}                                 = 'Kamera';
    $Lang->{'Docking Station'}                        = 'Stacja dokuj±ca';
    $Lang->{'Keybord'}                                = 'Klawiatura';
    $Lang->{'Modem'}                                  = 'Modem';
    $Lang->{'Monitor'}                                = 'Monitor';
    $Lang->{'Mouse'}                                  = 'Myszka';
    $Lang->{'Other'}                                  = 'Inne';
    $Lang->{'PCMCIA Card'}                            = 'Karta PCMCIA';
    $Lang->{'Printer'}                                = 'Drukarka';
    $Lang->{'Router'}                                 = 'Router';
    $Lang->{'Scanner'}                                = 'Skaner';
    $Lang->{'Security Device'}                        = '';
    $Lang->{'Switch'}                                 = 'Switch';
    $Lang->{'USB Device'}                             = 'Urz±dzenie USB';
    $Lang->{'WLAN Access Point'}                      = 'Access Point';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'Inne';
    $Lang->{'Telco'}                                  = 'Telco';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'Narzêdzie administratorskie';
    $Lang->{'Client Application'}                     = 'Aplikacja kliencka';
    $Lang->{'Client OS'}                              = 'System kliencki';
    $Lang->{'Embedded'}                               = '';
    $Lang->{'Middleware'}                             = 'Middleware';
    $Lang->{'Other'}                                  = 'Inne';
    $Lang->{'Server Application'}                     = 'Aplikacja serwerowa';
    $Lang->{'Server OS'}                              = 'System serwerowy';
    $Lang->{'User Tool'}                              = 'Narzêdzie u¿ytkownika';
    $Lang->{'Concurrent Users'}                       = '';
    $Lang->{'Demo'}                                   = 'Demo';
    $Lang->{'Developer Licence'}                      = 'Licencja developerska';
    $Lang->{'Enterprise Licence'}                     = '';
    $Lang->{'Freeware'}                               = 'Freeware';
    $Lang->{'Open Source'}                            = 'Open source';
    $Lang->{'Per Node'}                               = 'Na urz±dzenie';
    $Lang->{'Per Processor'}                          = 'Na procesor';
    $Lang->{'Per Server'}                             = 'Na serwer';
    $Lang->{'Per User'}                               = 'Na u¿ytkownika';
    $Lang->{'Single Licence'}                         = 'Pojedyñcza licencja';
    $Lang->{'Time Restricted'}                        = 'Czasowo ograniczona';
    $Lang->{'Unlimited'}                              = 'Bez limitu';
    $Lang->{'Volume Licence'}                         = 'Zbiorcza licencja';
    $Lang->{'Model'}                                  = 'Model';
    $Lang->{'Serial Number'}                          = 'Numer seryjny';
    $Lang->{'Operating System'}                       = 'System operacyjny';
    $Lang->{'CPU'}                                    = 'Procesor';
    $Lang->{'Ram'}                                    = 'RAM';
    $Lang->{'Hard Disk'}                              = 'Dysk twardy';
    $Lang->{'Hard Disk::Capacity'}                    = 'Pojemno¶æ dysku twardego';
    $Lang->{'Capacity'}                               = 'Pojemno¶æ';
    $Lang->{'FQDN'}                                   = 'Nazwa FQDN';
    $Lang->{'Network Adapter'}                        = 'Karta sieciowa';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Karta sieciowa::Adres IP z DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Karta sieciowa::Adres IP';
    $Lang->{'IP over DHCP'}                           = 'Adres IP z DHCP';
    $Lang->{'IP Address'}                             = 'Adres IP';
    $Lang->{'Graphic Adapter'}                        = 'Karta graficzna';
    $Lang->{'Other Equipment'}                        = 'Pozosta³e wyposa¿enie';
    $Lang->{'Warranty Expiration Date'}               = 'Data wyga¶niêcia gwarancji';
    $Lang->{'Install Date'}                           = 'Data instalacji';
    $Lang->{'Network Address'}                        = 'Adres sieciowy';
    $Lang->{'Network Address::Subnet Mask'}           = 'Adres sieciowy::Maska sieci';
    $Lang->{'Network Address::Gateway'}               = 'Adres sieciowy::Brama';
    $Lang->{'Subnet Mask'}                            = 'Maska sieci';
    $Lang->{'Gateway'}                                = 'Brama';
    $Lang->{'Licence Type'}                           = 'Typ licensji';
    $Lang->{'Licence Key'}                            = 'Klucz licencyjny';
    $Lang->{'Licence Key::Quantity'}                  = 'Klucz licencyjny::Ilo¶æ';
    $Lang->{'Licence Key::Expiration Date'}           = 'Klucz licencyjny::Data wyga¶niêcia';
    $Lang->{'Quantity'}                               = 'Ilo¶æ';
    $Lang->{'Expiration Date'}                        = 'Data wyga¶niêcia';
    $Lang->{'Media'}                                  = 'No¶nik';
    $Lang->{'Maximum number of one element'}          = '';
    $Lang->{'Identifier'}                             = '';

    return 1;
}

1;
