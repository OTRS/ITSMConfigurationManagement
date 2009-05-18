# --
# Kernel/Language/bg_ITSMConfigItem.pm - the bulgarian translation of ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2007-2008 Milen Koutev
# --
# $Id: bg_ITSMConfigItem.pm,v 1.4 2009-05-18 09:56:41 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::bg_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = '';
    $Lang->{'Config Item-Area'}       = '';
    $Lang->{'Config Item Management'} = 'Управление на конфигурационните единици CI';
    $Lang->{'Change Definition'}      = 'Промяна на дефиницията';
    $Lang->{'Class'}                  = 'Клас';
    $Lang->{'Show Versions'}          = 'Покажи Версиите';
    $Lang->{'Hide Versions'}          = 'Скрий Версиите';
    $Lang->{'Last changed by'}        = 'Последно променен от';
    $Lang->{'Last changed'}           = 'Последна промяна';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Промяната на дефинициите е неуспешна! Виж системния журнал за детайли.';
    $Lang->{'Also search in previous versions?'}        = 'Да търси и в предишните версии?';
    $Lang->{'Config Items shown'}                       = 'Показани конфигур.единици';
    $Lang->{'Config Items available'}                   = 'Достъпни конфигур.единици';
    $Lang->{'Search Config Items'}                      = '';
    $Lang->{'Deployment State'}                         = '';
    $Lang->{'Current Deployment State'}                 = '';
    $Lang->{'Incident State'}                           = '';
    $Lang->{'Current Incident State'}                   = '';
    $Lang->{'The name of this config item'}             = '';
    $Lang->{'The deployment state of this config item'} = '';
    $Lang->{'The incident state of this config item'}   = '';
    $Lang->{'Last Change'}                              = 'Последна промяна';
    $Lang->{'Duplicate'}                                = 'Направи копие';
    $Lang->{'Expired'}                                  = 'Изтекли';
    $Lang->{'Inactive'}                                 = 'Неактивни';
    $Lang->{'Maintenance'}                              = 'Поддръжка';
    $Lang->{'Pilot'}                                    = 'Пилот-водач';
    $Lang->{'Planned'}                                  = 'Планиран';
    $Lang->{'Production'}                               = 'Продуктивен';
    $Lang->{'Repair'}                                   = 'Ремонт/Възстановяване';
    $Lang->{'Retired'}                                  = 'Излязъл от употреба';
    $Lang->{'Review'}                                   = 'Преглеждан';
    $Lang->{'Test/QA'}                                  = 'Тест/Качествен контрол';
    $Lang->{'Operational'}                              = '';
    $Lang->{'Incident'}                                 = '';
    $Lang->{'Desktop'}                                  = 'Настолен';
    $Lang->{'Laptop'}                                   = 'Преносим';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'PDA'}                                      = 'PDA';
    $Lang->{'Phone'}                                    = 'Телефон';
    $Lang->{'Server'}                                   = 'Сървър';
    $Lang->{'Backup Device'}                            = 'Архивиращо у-во';
    $Lang->{'Beamer'}                                   = 'Бимер';
    $Lang->{'Camera'}                                   = 'Камера';
    $Lang->{'Docking Station'}                          = 'Докинг станция';
    $Lang->{'Keybord'}                                  = 'Клавиатура';
    $Lang->{'Modem'}                                    = 'Модем';
    $Lang->{'Monitor'}                                  = 'Монитор';
    $Lang->{'Mouse'}                                    = 'Мишка';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'PCMCIA Card'}                              = 'PCMCIA карта';
    $Lang->{'Printer'}                                  = 'Принтер';
    $Lang->{'Router'}                                   = 'Рутер';
    $Lang->{'Scanner'}                                  = 'Скенер';
    $Lang->{'Security Device'}                          = 'У-во за сигурност';
    $Lang->{'Switch'}                                   = 'Концентратор';
    $Lang->{'USB Device'}                               = 'USB Устройство';
    $Lang->{'WLAN Access Point'}                        = 'WLAN точка за достъп';
    $Lang->{'GSM'}                                      = 'GSM';
    $Lang->{'LAN'}                                      = 'LAN';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'Telco'}                                    = 'Telco';
    $Lang->{'WLAN'}                                     = 'WLAN';
    $Lang->{'Admin Tool'}                               = 'Административнен инструмент';
    $Lang->{'Client Application'}                       = 'Потребителски приложения';
    $Lang->{'Client OS'}                                = 'Потребителска Опер.с-ма';
    $Lang->{'Embedded'}                                 = 'Вградена';
    $Lang->{'Middleware'}                               = 'Средно ниво';
    $Lang->{'Other'}                                    = 'Други';
    $Lang->{'Server Application'}                       = 'Сървърно приложение';
    $Lang->{'Server OS'}                                = 'сървърна Опер.с-ма';
    $Lang->{'User Tool'}                                = 'Клиентски инструмент';
    $Lang->{'Concurrent Users'}                         = 'Конкурентни потребители';
    $Lang->{'Demo'}                                     = 'Демо';
    $Lang->{'Developer Licence'}                        = 'Лиценз за разработчици';
    $Lang->{'Enterprise Licence'}                       = 'Ентърпрайс лиценз';
    $Lang->{'Freeware'}                                 = 'Безплатно разпространяван';
    $Lang->{'Open Source'}                              = 'Софтуер с отворен код';
    $Lang->{'Per Node'}                                 = 'Лицензиране на точка';
    $Lang->{'Per Processor'}                            = 'Лицензиране за процесор';
    $Lang->{'Per Server'}                               = 'Лицензиране за сървър';
    $Lang->{'Per User'}                                 = 'Лицензиране за потребител';
    $Lang->{'Single Licence'}                           = 'Единичен лиценз';
    $Lang->{'Time Restricted'}                          = 'Лиценз, ограничен по време';
    $Lang->{'Unlimited'}                                = 'Неограничен лиценз';
    $Lang->{'Volume Licence'}                           = 'Специални обемни програми';
    $Lang->{'Model'}                                    = 'Модел';
    $Lang->{'Serial Number'}                            = 'Сериен Номер';
    $Lang->{'Operating System'}                         = 'Операционна система';
    $Lang->{'CPU'}                                      = 'Процесор';
    $Lang->{'Ram'}                                      = 'Памет';
    $Lang->{'Hard Disk'}                                = 'Твърд диск';
    $Lang->{'Hard Disk::Capacity'}                      = 'Твърд диск::капацитет';
    $Lang->{'Capacity'}                                 = 'Капацитет';
    $Lang->{'FQDN'}                                     = 'FQDN';
    $Lang->{'Network Adapter'}                          = 'Мрежов адаптер';
    $Lang->{'Network Adapter::IP over DHCP'}            = 'Мрежов адаптер::IP от DHCP';
    $Lang->{'Network Adapter::IP Address'}              = 'Мрежов адаптер::IP Адрес';
    $Lang->{'IP over DHCP'}                             = 'IP от DHCP';
    $Lang->{'IP Address'}                               = 'IP адрес';
    $Lang->{'Graphic Adapter'}                          = 'Графична карта';
    $Lang->{'Other Equipment'}                          = 'Друго оборудване';
    $Lang->{'Warranty Expiration Date'}                 = 'Дата на изтичане на гаранцията';
    $Lang->{'Install Date'}                             = 'Дата на инсталация';
    $Lang->{'Network Address'}                          = 'Мрежов адрес';
    $Lang->{'Network Address::Subnet Mask'}             = 'Мрежов адрес::Маска на подмрежата';
    $Lang->{'Network Address::Gateway'}                 = 'Мрежов адрес::Гейт преход';
    $Lang->{'Subnet Mask'}                              = 'Маска на подмрежата';
    $Lang->{'Gateway'}                                  = 'Гейт преход';
    $Lang->{'Licence Type'}                             = 'Тип на лиценза';
    $Lang->{'Licence Key'}                              = 'Лицензен ключ';
    $Lang->{'Licence Key::Quantity'}                    = 'Лицензен ключ::Количество';
    $Lang->{'Licence Key::Expiration Date'}             = 'Лицензен ключ::Дата на изтичане';
    $Lang->{'Quantity'}                                 = 'Количество';
    $Lang->{'Expiration Date'}                          = 'Дата на изтичане';
    $Lang->{'Media'}                                    = 'Медия';
    $Lang->{'Maximum number of one element'}            = '';
    $Lang->{'Identifier'}                               = '';

    return 1;
}

1;
