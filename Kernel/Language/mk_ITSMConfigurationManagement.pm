# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::mk_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Конфиг Член Менаџмент';
    $Self->{Translation}->{'Change class definition'} = 'Промени дефиниција на класа';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Дефиниција';
    $Self->{Translation}->{'Change'} = '';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Состојба на Инцидент';
    $Self->{Translation}->{'Deployment State'} = 'Состојба на Распоред';
    $Self->{Translation}->{'Class'} = 'Класа';
    $Self->{Translation}->{'Deployment State Type'} = 'Тип на Состојба на Распоред';
    $Self->{Translation}->{'Current Incident State'} = 'Сегашна Состојба на Инцидент';
    $Self->{Translation}->{'Current Incident State Type'} = 'Сегашен Тип на Состојба на Инцидент';
    $Self->{Translation}->{'Last changed'} = 'Последно променето';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Конфиг Член';
    $Self->{Translation}->{'Filter for Classes'} = 'Филтер за Класи';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Одбери Класа од листата за да креирате нов Конфиг Член.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM КонфигЧлен Bulk Action';
    $Self->{Translation}->{'Deployment state'} = 'Распоредувачка состојба';
    $Self->{Translation}->{'Incident state'} = 'Сосотјба на Инцидент';
    $Self->{Translation}->{'Link to another'} = 'Поврзи со друг';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Невалиден Кофигурациски број на Член!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Бројот на друг Конфигурациски Член со линк ширина.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Името на овој конфиг член';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Името е веќе во употреба од страна на КонфигЧленовите со следнов/те Број(еви): %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';
    $Self->{Translation}->{'History Content'} = '';
    $Self->{Translation}->{'Createtime'} = '';
    $Self->{Translation}->{'Zoom view'} = 'Зумирај';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = 'Конфиг Членови по страница';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Преварувај';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Исто така барај во претходните верзи?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Конфигурациски Член';
    $Self->{Translation}->{'Configuration Item Information'} = 'Конфигурациски Член Информација';
    $Self->{Translation}->{'Current Deployment State'} = 'Сегашна Состојба на Распоред';
    $Self->{Translation}->{'Last changed by'} = '';
    $Self->{Translation}->{'Show one version'} = 'Прикажи една верзија';
    $Self->{Translation}->{'Show all versions'} = 'Прикажи ги сите верзии';
    $Self->{Translation}->{'Version Incident State'} = 'Верзија на Инцидент Состојба';
    $Self->{Translation}->{'Version Deployment State'} = 'Верзија на Состојба на Распорадување';
    $Self->{Translation}->{'Version Number'} = 'Број на Верзија';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Конфигурациски Член Детали за Верзија';
    $Self->{Translation}->{'Property'} = 'Својства';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = '';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = '';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = '';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = '';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = '';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = '';
    $Self->{Translation}->{'No access is given!'} = '';
    $Self->{Translation}->{'No definition was defined for class %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = '';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = '';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = '';
    $Self->{Translation}->{'New version (ID=%s)'} = '';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = '';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = '';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = '';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = '';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = '';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = '';
    $Self->{Translation}->{'Version %s deleted'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = '';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = '';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = '';
    $Self->{Translation}->{'VersionID %s not found in database!'} = '';
    $Self->{Translation}->{'ConfigItem'} = 'КонфигЧлен';
    $Self->{Translation}->{'printed by %s at %s'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '';
    $Self->{Translation}->{'No ClassID is given!'} = '';
    $Self->{Translation}->{'No access rights for this class given!'} = '';
    $Self->{Translation}->{'No Result!'} = '';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Распоредувачката состојба на овој конфиг член';
    $Self->{Translation}->{'The incident state of this config item'} = 'Инидент состојба на овој конфиг член';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Измеѓу';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Максимален број на еден елемент';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Празните полиња индицираат дека сегашните вредности се задржани';
    $Self->{Translation}->{'Skipped'} = 'Скокнато';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Модел';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Сериски Број';
    $Self->{Translation}->{'CPU'} = 'Процесор';
    $Self->{Translation}->{'Ram'} = 'Ram меморија';
    $Self->{Translation}->{'Hard Disk'} = 'Тврд Диск';
    $Self->{Translation}->{'Capacity'} = 'Капацитет';
    $Self->{Translation}->{'Network Adapter'} = 'Мрежен Адаптер';
    $Self->{Translation}->{'IP over DHCP'} = 'IP преку DHCP';
    $Self->{Translation}->{'IP Address'} = 'IP Адреса';
    $Self->{Translation}->{'Graphic Adapter'} = 'Графички Адаптер';
    $Self->{Translation}->{'Other Equipment'} = 'Друга Опрема';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Датум на Истекување на Гаранција';
    $Self->{Translation}->{'Install Date'} = 'Датум на инсталирање';
    $Self->{Translation}->{'Phone 1'} = 'Телефон 1';
    $Self->{Translation}->{'Phone 2'} = 'Телефон 2';
    $Self->{Translation}->{'E-Mail'} = '';
    $Self->{Translation}->{'Network Address'} = 'Мрежна Адреса';
    $Self->{Translation}->{'Subnet Mask'} = 'Маска на Подмрежа';
    $Self->{Translation}->{'Gateway'} = 'Портал';
    $Self->{Translation}->{'Licence Type'} = 'Тип на Лиценца';
    $Self->{Translation}->{'Licence Key'} = 'Клуч на Лиценца';
    $Self->{Translation}->{'Quantity'} = 'Квантитет';
    $Self->{Translation}->{'Expiration Date'} = 'Дата на истекување';
    $Self->{Translation}->{'Media'} = 'Медиа';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Expired'} = 'Истечено';
    $Self->{Translation}->{'Maintenance'} = 'Одржување';
    $Self->{Translation}->{'Pilot'} = 'Пилот';
    $Self->{Translation}->{'Planned'} = 'Планирано';
    $Self->{Translation}->{'Repair'} = 'Поправи';
    $Self->{Translation}->{'Retired'} = 'Прекинати';
    $Self->{Translation}->{'Review'} = 'Преглед';
    $Self->{Translation}->{'Test/QA'} = 'Тест/QA';
    $Self->{Translation}->{'Laptop'} = 'Лаптоп';
    $Self->{Translation}->{'Desktop'} = 'Работна површина';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Сервер';
    $Self->{Translation}->{'Other'} = 'Друго';
    $Self->{Translation}->{'Monitor'} = 'Монитор';
    $Self->{Translation}->{'Printer'} = 'Печатач';
    $Self->{Translation}->{'Switch'} = 'Преклопник(Switch)';
    $Self->{Translation}->{'Router'} = 'Рутер';
    $Self->{Translation}->{'WLAN Access Point'} = 'Бежична Локална Мрежа Место за Пристап';
    $Self->{Translation}->{'Security Device'} = 'Безбедносен Уред';
    $Self->{Translation}->{'Backup Device'} = 'Бекап Уред';
    $Self->{Translation}->{'Mouse'} = 'Глушец';
    $Self->{Translation}->{'Keyboard'} = 'Тастатура';
    $Self->{Translation}->{'Camera'} = 'Камера';
    $Self->{Translation}->{'Beamer'} = 'Бимер';
    $Self->{Translation}->{'Modem'} = 'Модем';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA Картичка';
    $Self->{Translation}->{'USB Device'} = 'USB Уред';
    $Self->{Translation}->{'Docking Station'} = 'Приклучна Станица';
    $Self->{Translation}->{'Scanner'} = 'Скенер';
    $Self->{Translation}->{'Building'} = 'Градејќи';
    $Self->{Translation}->{'Office'} = 'Канцеларија';
    $Self->{Translation}->{'Floor'} = 'Под';
    $Self->{Translation}->{'Room'} = 'Соба';
    $Self->{Translation}->{'Rack'} = 'Рамка';
    $Self->{Translation}->{'Workplace'} = 'Работноместо';
    $Self->{Translation}->{'Outlet'} = 'Излезни';
    $Self->{Translation}->{'IT Facility'} = 'IT Објект';
    $Self->{Translation}->{'LAN'} = 'Локална Мрежа';
    $Self->{Translation}->{'WLAN'} = 'Бежична Локална Мрежа';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Клиент Апликација';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Сервисна Апликација';
    $Self->{Translation}->{'Client OS'} = 'Клиент ОС';
    $Self->{Translation}->{'Server OS'} = 'Сервер ОС';
    $Self->{Translation}->{'Admin Tool'} = 'Админ Алатки';
    $Self->{Translation}->{'User Tool'} = 'Корисник Алатка';
    $Self->{Translation}->{'Embedded'} = 'Вградени';
    $Self->{Translation}->{'Single Licence'} = 'Единечна Лиценца';
    $Self->{Translation}->{'Per User'} = 'По Корисник';
    $Self->{Translation}->{'Per Processor'} = 'По Процесор';
    $Self->{Translation}->{'Per Server'} = 'По Сервер';
    $Self->{Translation}->{'Per Node'} = 'По Јазол';
    $Self->{Translation}->{'Volume Licence'} = 'Волумент на Лиценца';
    $Self->{Translation}->{'Enterprise Licence'} = 'Претпријатие Лиценца';
    $Self->{Translation}->{'Developer Licence'} = 'Развивач Лиценца';
    $Self->{Translation}->{'Demo'} = 'Демо';
    $Self->{Translation}->{'Time Restricted'} = 'Време на Забрана';
    $Self->{Translation}->{'Freeware'} = 'Бесплатен софтвер';
    $Self->{Translation}->{'Open Source'} = 'Отворен Извор';
    $Self->{Translation}->{'Unlimited'} = 'Неограничено';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = '';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Провери за уникатно име само во рамките на иста КонфигЧлен класа (\'class\') или глобално (\'global\'), што значи дека секој постојачки КонфигЧлен е земен во профилот кога се бараат дупликати.';
    $Self->{Translation}->{'Config Items'} = 'Конфиг Членови';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Конфиг член настан модули кои овозможуваат запишуваат логови во историја на агент интефејсот.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Конфигурациски Член Лимит';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Креирај и менаџирај дефиниции за Конфигурациски Членови.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Дефинира Барани пермисии да креира ITSM конфигурациски членови користејќи Генерички Интерфејси.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Дефинира Барани пермисии за  да земе ITSM конфигурациски членови користејќи Генерички Интерфејс.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Дефинира Барани пермисии за ITSM конфигурациски членови користејќи Генерички Интерфејси.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Дефинира Барани пермисии за надградба на ITSM конфигурациски членови на Генерички Интерфејс.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Дефинира преглед модул за приказ на мал преглед на кофигурациска лчен листа.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Дефинира регуларни изрази индивидуално за секоја КонфигЧлен класа за да провери КонфигЧлен име и да ги прикаже грешните кореспондирачките пораки.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Дефинира стандарден субобјект за класата \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Дефинира број на редици за CI дефиницискиот уредник во админ интерфејсот.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Дефинира лимит за барања за AgentITSMConfigItem екранот.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Дефинира лимит за барања за AgentITSMConfigItemSearch екранот.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Дефинира приказ на колони во конфиг членот преглед. Оваа опција нема ефект на позицијата на колони. Забелешка: Класни колони се секогаш достапни ако филтерот \'All\' е одбран.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Дефинира приказ на колони во конфиг член барање. Оваа опција нема ефект на позицијата на колоните.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Дефинира приказ на колони од CIs во конфиг членот прегледот во зависност од CI класата. Секој влез мора да има префикс со класно име и двојни колони (i.e. Computer::). Има неколку CI-Атрибути кои се чести со сите CIs (пример за класта Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ на идивидуални CI-Attributes како што се дефинирани во  CI-Дефиницијата, следнава шема мора да биде искористена (пример за класата  Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ако нема влез за CI класа, тогаш стандардните колони се прикажани како што се дефинирани во поставувањето ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Дефинира приказ на колони од CIs во конфиг членот прегледот во зависност од CI класата. Секој влез мора да има префикс со класно име и двојни колони (i.e. Computer::). Има неколку CI-Атрибути кои се чести со сите CIs (пример за класта Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ на идивидуални CI-Attributes како што се дефинирани во  CI-Дефиницијата, следнава шема мора да биде искористена (пример за класата  Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ако нема влез за CI класа, тогаш стандардните колони се прикажани како што се дефинирани во поставувањето ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Дефинира приказ на колони од CIs во конфиг членот прегледот во зависност од CI класата. Секој влез мора да има префикс со класно име и двојни колони (i.e. Computer::). Има неколку CI-Атрибути кои се чести со сите CIs (пример за класта Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ на идивидуални CI-Attributes како што се дефинирани во  CI-Дефиницијата, следнава шема мора да биде искористена (пример за класата  Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ако нема влез за CI класа, тогаш стандардните колони се прикажани.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Дупликат';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Овозможува конфигурациски член bulk action карактеристики за агент предендел за да работи со повење од ефен конфигурациски член во исто врме.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Овозможува конфигурациски член bulk action карактеристики само за групните листи.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Овозможува/оневозможува функционалности за проверка на КонфигЧленови за уникатни имиња. Пред да ја овозможите оваа опција треба да го проверите вашиот систем дали веќе постојат конфиг членови со исто име. Вие можете да го направите со скрипата  bin/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Модул за проверка на одговорност на група за класа.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Модул за проверка на одоговрност на група за конфигурациски член.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Модул за генерирање ITSM конфиг член статистика.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Објект позадински модул регирстациа за увоз/извоз модулот.';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Параметри за боја на распоред состојбите во прегледот со опциите  на агент интерфејсот.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Параметри за распоред состојбите во прегледот со опциите  на агент интерфејсот.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Параметри за пример дозволите за групи од генерални каталог атрибути.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Параметри за страниви(во кои конфигурациските членови се прикажани).';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Барани премисии за употреба на ITSM  конфигурациски член екран во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Барани премисии за употреба на ITSM  конфигурациски член екран пребарување во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Барани премисии за употреба на ITSM  конфигурациски член зголемувачки екран во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Барани премисии за употреба на додавање на ITSM  конфигурациски член екран во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Барани премисии за употреба на уреди ITSM  конфигурациски член екран во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Барани премисии за употреба на историја на ITSM  конфигурациски член екран во агент интерфејсот.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Барани премисии за употреба на принт на ITSM  конфигурациски член екран во агент интерфејсот.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Одбира конфигурациски член број генерирачки модул.  "AutoIncrement"  инкрементира конфигурависки чен број, SystemID,ConfigItemClassID  и бројачот е искористен. Форматот е  "SystemID.ConfigItemClassID.Counter", п.р. 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Сетира распоред состојба на конфигурациски член bulk екранот од агент интерфејсот.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Сетира инцидент состојба на конфигурациски член bulk екранот од агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Прикажува линк во менито кое овозможува поврзување со конфигурациски член со друг објект во конфиг член  зголемен преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Прикажува линк во менито кое пристапува во историјата на  конфигурациски член во конфиг член преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Прикажува линк во менито кое овозможува пристап до историјата на конфигурациски член во конфиг член  зголемен преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Прикажува линк во менито со дупликат конфигурациски член во конфиг член преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Прикажува линк во менито со дупликат конфигурациски член во зголемен преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Прикажува линк во менито за уредување на конфигурациски член во зголемен преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Прикажува линк во менито за печатење во конфигурациски член зголемен преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Прикажува линк во менито со зголемување на кнфигурациски член во  кнфигурациски член преглед во агент интерфејсот.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Прикажува  конфиг член историја (во обратен редослед) во агент интерфејсот.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Иднетификувачот за конфигурациски член, п.р.  ConfigItem#, MyConfigItem#. Стандардот е ConfigItem#.';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';
    $Self->{Translation}->{'postproductive'} = '';
    $Self->{Translation}->{'preproductive'} = '';
    $Self->{Translation}->{'productive'} = '';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    'No',
    'Ok',
    'Please enter at least one search value or * to find anything.',
    'Settings',
    'Submit',
    'Yes',
    );

}

1;
