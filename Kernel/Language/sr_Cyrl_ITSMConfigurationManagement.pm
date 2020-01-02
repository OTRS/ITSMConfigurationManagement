# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::sr_Cyrl_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Управљање конфигурационим ставкама';
    $Self->{Translation}->{'Change class definition'} = 'Дефиниција класе промене';
    $Self->{Translation}->{'Config Item Class'} = 'Класа конфигурационе ставке';
    $Self->{Translation}->{'Definition'} = 'Дефиниција';
    $Self->{Translation}->{'Change'} = 'Промени';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Стање инцидента';
    $Self->{Translation}->{'Deployment State'} = 'Статус распоређивања';
    $Self->{Translation}->{'Class'} = 'Класа';
    $Self->{Translation}->{'Deployment State Type'} = 'Тип статуса распоређивања';
    $Self->{Translation}->{'Current Incident State'} = 'Тренутно стање инцидента';
    $Self->{Translation}->{'Current Incident State Type'} = 'Тип тренутног статуса инцидента';
    $Self->{Translation}->{'Last changed'} = 'Задњи пут промењено';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Конфигурациона ставка';
    $Self->{Translation}->{'Filter for Classes'} = 'Филтер за класе';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Изаберите класу из листе ради креирања нове конфигурационе ставке.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM масовна акција на тикету';
    $Self->{Translation}->{'Deployment state'} = 'Статус распоређивања';
    $Self->{Translation}->{'Incident state'} = 'Стање инцидента';
    $Self->{Translation}->{'Link to another'} = 'Повежи са другим';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Неисправан број конфигурационе ставке!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Број друге конфигурационе ставке за повезивање.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Да ли стварно желите да обришете ову конфигурациону ставку?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Назив ове конфигурационе ставке';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Назив је већ у употреби на конфигурационим ставкама број: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Историјат конфигурационе ставке: %s';
    $Self->{Translation}->{'History Content'} = 'Садржај историје';
    $Self->{Translation}->{'Createtime'} = 'Време креирања';
    $Self->{Translation}->{'Zoom view'} = 'Увећани преглед';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Подешавање контекста';
    $Self->{Translation}->{'Config Items per page'} = 'Конфигурационе ставке по страни';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Генеричка табела ITSM конфигурационе ставке';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Покрени претрагу';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Претражите и у претхотним верзијама?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Конфигурациона ставка';
    $Self->{Translation}->{'Configuration Item Information'} = 'Информација о конфигурационој ставки';
    $Self->{Translation}->{'Current Deployment State'} = 'Тренутни статус распоређивања';
    $Self->{Translation}->{'Last changed by'} = 'Променио';
    $Self->{Translation}->{'Show one version'} = 'Прикажи једну верзију';
    $Self->{Translation}->{'Show all versions'} = 'Покажи све верзије';
    $Self->{Translation}->{'Version Incident State'} = 'Верзија - статус инцидента';
    $Self->{Translation}->{'Version Deployment State'} = 'Верзија - статус примене';
    $Self->{Translation}->{'Version Number'} = 'Број верзије';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Детаљи верзије конфигурационе ставке';
    $Self->{Translation}->{'Property'} = 'Својство';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'Није дат приступ класи!';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Преглед: ITSM конфигурационе ставке';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'Није дат ConfigItemID!';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = 'Потребна је бар једна изабрана конфигурациона ставка!';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'Немате право уписа за ову конфигурациону ставку: %s.';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = 'Конфигурациона ставка "%s" није нађена у бази података!';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = 'Није било могуће обрисати ConfigItemID %s!';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'Није пронађена верзија за ConfigItemID %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'Нису дати ConfigItemID, DuplicateID или ClassID!';
    $Self->{Translation}->{'No access is given!'} = 'Није дат приступ!';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'Није пронађена дефиниција за класу %s!';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = 'Не може се приказати историјат, јер није дат ConfigItemID!';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = 'Не може се приказати историјат, није дозвољен приступ!';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Нова конфигурациона ставка (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Нова верзија (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'Ажурирано стање распореда (ново=%s, старо=%s) ';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'Ажурирано стање инцидента (ново=%s, старо=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'Обрисана конфигурациона ставка (ID=%s)';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Повезано са %s (тип=%s)';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Обрисана веза са %s (тип=%s)';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'Ажурирана дефиниција конфигурационе ставке (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Ажуриран назив (нови=%s, стари=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Ажуриран атрибут%s са "%s" на "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Верзија %s је обрисана';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'Нису дати ConfigItemID или VersionID!';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = 'Не може се приказати конфигурациона ставка, није дат приступ!';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'ИД конфигурационе ставке %s није нађен у бази података!';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'Ид верзије %s није нађен у бази података!';
    $Self->{Translation}->{'ConfigItem'} = 'Конфигурациона ставка';
    $Self->{Translation}->{'printed by %s at %s'} = 'штампану од стране %s у %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'Неисправан ИД класе!';
    $Self->{Translation}->{'No ClassID is given!'} = 'Није дат ИД класе!';
    $Self->{Translation}->{'No access rights for this class given!'} = 'Није дат приступ овој класи!';
    $Self->{Translation}->{'No Result!'} = 'Нема резултата!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Резултат претраге конфигурационих ставки';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        'Не може се приказати ставка, није дат приступ за ову конфигурациону ставку!';
    $Self->{Translation}->{'operational'} = 'оперативни';
    $Self->{Translation}->{'warning'} = 'упозорење';
    $Self->{Translation}->{'incident'} = 'инцидент';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Статус примене ове конфигурационе ставке';
    $Self->{Translation}->{'The incident state of this config item'} = 'Статус инцидента ове конфигурационе ставке';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Приказане конфигурационе ставке';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Између';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Максимални број једног елемента';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Празна поља указују да ће актуелне вредности бити задржане';
    $Self->{Translation}->{'Skipped'} = 'Прескочено';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Модел';
    $Self->{Translation}->{'Customer Company'} = 'Фирма клијента';
    $Self->{Translation}->{'Serial Number'} = 'Серијски број';
    $Self->{Translation}->{'CPU'} = 'Процесор';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Хард диск';
    $Self->{Translation}->{'Capacity'} = 'Капацитет';
    $Self->{Translation}->{'Network Adapter'} = 'Мрежни адаптер';
    $Self->{Translation}->{'IP over DHCP'} = 'IP преко DHCP';
    $Self->{Translation}->{'IP Address'} = 'IP адреса';
    $Self->{Translation}->{'Graphic Adapter'} = 'Графички адаптер';
    $Self->{Translation}->{'Other Equipment'} = 'Друга опрема';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Датум истицања гаранције';
    $Self->{Translation}->{'Install Date'} = 'Датум инсталације';
    $Self->{Translation}->{'Phone 1'} = 'Телефон 1';
    $Self->{Translation}->{'Phone 2'} = 'Телефон 2';
    $Self->{Translation}->{'E-Mail'} = 'Имејл';
    $Self->{Translation}->{'Network Address'} = 'Мрежна адреса';
    $Self->{Translation}->{'Subnet Mask'} = 'Подмрежна маска';
    $Self->{Translation}->{'Gateway'} = 'Мрежни пролаз';
    $Self->{Translation}->{'Licence Type'} = 'Тип лиценце';
    $Self->{Translation}->{'Licence Key'} = 'Лиценцни кључ';
    $Self->{Translation}->{'Quantity'} = 'Количина';
    $Self->{Translation}->{'Expiration Date'} = 'Датум истицања';
    $Self->{Translation}->{'Media'} = 'Медија';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Рачунар';
    $Self->{Translation}->{'Hardware'} = 'Хардвер';
    $Self->{Translation}->{'Network'} = 'Мрежа';
    $Self->{Translation}->{'Software'} = 'Софтвер';
    $Self->{Translation}->{'Expired'} = 'Истекло';
    $Self->{Translation}->{'Maintenance'} = 'Одржавање';
    $Self->{Translation}->{'Pilot'} = 'Пилот';
    $Self->{Translation}->{'Planned'} = 'Планирано';
    $Self->{Translation}->{'Repair'} = 'На поправци';
    $Self->{Translation}->{'Retired'} = 'Расходовано';
    $Self->{Translation}->{'Review'} = 'Рецензија';
    $Self->{Translation}->{'Test/QA'} = 'Тест/QA';
    $Self->{Translation}->{'Laptop'} = 'Лаптоп';
    $Self->{Translation}->{'Desktop'} = 'Десктоп';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Сервер';
    $Self->{Translation}->{'Other'} = 'Друго';
    $Self->{Translation}->{'Monitor'} = 'Монитор';
    $Self->{Translation}->{'Printer'} = 'Штампач';
    $Self->{Translation}->{'Switch'} = 'Свич';
    $Self->{Translation}->{'Router'} = 'Рутер';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN приступна тачка';
    $Self->{Translation}->{'Security Device'} = 'Сигурносни уређај';
    $Self->{Translation}->{'Backup Device'} = 'Уређај за резервне копије';
    $Self->{Translation}->{'Mouse'} = 'Миш';
    $Self->{Translation}->{'Keyboard'} = 'Тастатура';
    $Self->{Translation}->{'Camera'} = 'Камера';
    $Self->{Translation}->{'Beamer'} = 'Пројектор';
    $Self->{Translation}->{'Modem'} = 'Модем';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA картица';
    $Self->{Translation}->{'USB Device'} = 'USB уређај';
    $Self->{Translation}->{'Docking Station'} = 'Прикључна станица';
    $Self->{Translation}->{'Scanner'} = 'Скенер';
    $Self->{Translation}->{'Building'} = 'Зграда';
    $Self->{Translation}->{'Office'} = 'Канцеларија';
    $Self->{Translation}->{'Floor'} = 'Спрат';
    $Self->{Translation}->{'Room'} = 'Соба';
    $Self->{Translation}->{'Rack'} = 'Рек';
    $Self->{Translation}->{'Workplace'} = 'Радно место';
    $Self->{Translation}->{'Outlet'} = 'Утичница';
    $Self->{Translation}->{'IT Facility'} = 'ИТ објекат';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Клијентска апликација';
    $Self->{Translation}->{'Middleware'} = 'Посреднички програм';
    $Self->{Translation}->{'Server Application'} = 'Серверска апликација';
    $Self->{Translation}->{'Client OS'} = 'Клијентски OS';
    $Self->{Translation}->{'Server OS'} = 'Серверски OS';
    $Self->{Translation}->{'Admin Tool'} = 'Административни алат';
    $Self->{Translation}->{'User Tool'} = 'Кориснички алат';
    $Self->{Translation}->{'Embedded'} = 'Уграђен';
    $Self->{Translation}->{'Single Licence'} = 'Појединачна лиценца';
    $Self->{Translation}->{'Per User'} = 'По кориснику';
    $Self->{Translation}->{'Per Processor'} = 'По процесору';
    $Self->{Translation}->{'Per Server'} = 'По серверу';
    $Self->{Translation}->{'Per Node'} = 'По чвору';
    $Self->{Translation}->{'Volume Licence'} = 'Количинске лиценце';
    $Self->{Translation}->{'Enterprise Licence'} = 'Компанијска лиценца';
    $Self->{Translation}->{'Developer Licence'} = 'Развојна лиценца';
    $Self->{Translation}->{'Demo'} = 'Демонстрациони';
    $Self->{Translation}->{'Time Restricted'} = 'Временски ограничено';
    $Self->{Translation}->{'Freeware'} = 'Бесплатни **';
    $Self->{Translation}->{'Open Source'} = 'Отворени код';
    $Self->{Translation}->{'Unlimited'} = 'Неограничено';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'У реду';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'Додељене конфигурационе ставке';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'Конфигурационе ставке додељене фирми клијента';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'Конфигурационе ставке додељене клијенту кориснику';
    $Self->{Translation}->{'CMDB Settings'} = 'CMDB подешавања';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Провера јединственог имена само у оквиру исте класе конфигурационих ставки (\'класа\') или глобално (\'глобално\'), што значи да је свака постојећа Конфигурациона ставка узета у обзир у провери дупликата.';
    $Self->{Translation}->{'Config Items'} = 'Конфигурационе ставке';
    $Self->{Translation}->{'Config item add.'} = 'Додавање конфигурационе ставке.';
    $Self->{Translation}->{'Config item edit.'} = 'Уређивање конфигурационе ставке.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Модул догађаја конфигурационих ставки који омогућава бележење у историјат у интерфејсу оператера.';
    $Self->{Translation}->{'Config item history.'} = 'Историјат конфигурационе ставке.';
    $Self->{Translation}->{'Config item print.'} = 'Штампа конфигурационе ставке';
    $Self->{Translation}->{'Config item zoom.'} = 'Детаљни приказ конфигурацине ставке.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'Број конфигурационе ставке';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Ограничење конфигурационе ставке';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Ограничење конфигурационих ставки по страни.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'База података управљања конфигурацијом.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Модул масовне акције на конфигурационим ставкама.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Конфигурациона ставка претражује позадински рутер у интерфејсу оператера.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Креирање и управљање дефиниција за конфигурационе ставке.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Дефинише акције где је дугме поставки доступно у повезаном графичком елементу објекта (LinkObject::ViewMode = "complex"). Молимо да имате на уму да ове Акције морају да буду регистроване у следећим JS и CSS датотекама: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js и Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Дефинише неопходне дозволе за креирање ITSM конфигурационих ставки коришћењем генеричког интерфејса.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Одређује потребне дозволе за брисање ITSM конфигурационих ставки кроз генерички интерфејс.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Дефинише неопходне дозволе за добијање ITSM конфигурационих ставки коришћењем генеричког интерфејса.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Дефинише неопходне дозволе за претрагу ITSM конфигурационих ставки коришћењем генеричког интерфејса.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Дефинише неопходне дозволе за ажурирање ITSM конфигурационих ставки коришћењем генеричког интерфејса.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Дефинише модул прегледа за мали приказ листе конфигурационих ставки. ';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Одређује регуларне изразе за сваку класу конфигурационе ставке ради провере назива конфигурационе ставке и приказа припадајућих порука о грешкама.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Одређује подразумевани подобјекат класе ITSM конфигурациона ставка.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Одређује број редова за едитор дефиниције CI у административном интерфејсу.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Одређује редослед инцидентних стања од високог (нпр критично) до ниског (нпр функционално).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Одређује релевантна стања распоређивања где повезани тикети могу да утичу на статус CI.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Дефинише границу претраге за екран AgentITSMConfigItem.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Дефинише границу претраге за екран AgentITSMConfigItemSearch.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Одређује приказане колоне у прегледу конфигурационих ставки. Ова опције нема утицај на позиције колона. Напомена: уколико је изабран филтер \'Све\' класа колоне је увек доступна.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Дефинише приказане колоне у претрази конфигурационих ставки. Ова опције нема утицај на позиције колона.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Дефинише приказане колоне конфигурационих ставки у прегледу у зависности од класе. Сваки унос мора садржати префикс са називом класе и двотачком (нпр. Computer::). Постоји пар атрибута који су заједнички за све класе (нпр. за класу Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ појединачних атрибута из дефиниције, морате користити следећу шему (пример за класу Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Уколико не постоји унос за појединачну класу, биће приказане подразумеване колоне дефинисане у ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Дефинише приказане колоне конфигурационих ставки у претрази у зависности од класе. Сваки унос мора садржати префикс са називом класе и двотачком (нпр. Computer::). Постоји пар атрибута који су заједнички за све класе (нпр. за класу Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ појединачних атрибута из дефиниције, морате користити следећу шему (пример за класу Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Уколико не постоји унос за појединачну класу, биће приказане подразумеване колоне дефинисане у ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        'Дефинише приказане колоне конфигурационих ставки у додатку командне табле у зависности од класе. Сваки унос мора садржати префикс са називом класе и двотачком (нпр. Computer::). Постоји пар атрибута који су заједнички за све класе (нпр. за класу Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ појединачних атрибута из дефиниције, морате користити следећу шему (пример за класу Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Уколико не постоји унос за појединачну класу, биће приказане подразумеване колоне дефинисане у AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (кључ DefaultColumns).';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        'Дефинише приказане колоне конфигурационих ставки у табели веза у зависности од класе. Уколико не постоји унос за појединачну класу, биће приказане подразумеване колоне.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Дефинише приказане колоне конфигурационих ставки у табели веза у зависности од класе. Сваки унос мора садржати префикс са називом класе и двотачком (нпр. Computer::). Постоји пар атрибута који су заједнички за све класе (нпр. за класу Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). За приказ појединачних атрибута из дефиниције, морате користити следећу шему (пример за класу Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Уколико не постоји унос за појединачну класу, биће приказане подразумеване колоне.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Одређује који тип везе (гледано из перспективе тикета) може да утиче на повезану CI.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Одређује који тип тикета може да утиче на статус повезане CI.';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Брисање конфигурационе ставке';
    $Self->{Translation}->{'Deployment State Color'} = 'Боја статуса распоређивања';
    $Self->{Translation}->{'Duplicate'} = 'Дупликат';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Омогућава масовну акцију на конфигурационим ставкама у приступном систему оператера на више од једне ставке истовремено.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Активира својство масовне акције на конфигирационим ставкама само за излистане групе.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Активира/деактивира функцију за проверу јединствености имана конфигурационих ставки. Пре активирања ове опције требате проверити у вашем систему постојање дупликата на постојећим ставкама. То можете урадити помоћу скрипта bin/otrs.ITSMConfigItemListDuplicates.pl. ';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Модул догађаја за подешавање статуса конфигурационих ставки приликом постављања веза.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'Преглед ITSM конфигурационе ставке.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Модул за проверу групе одговорне за класу.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Модул за проверу групе одговорне за конфигурациону ставку.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Модул за генерисање статистике ITSM конфигурационих ставки.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Регистрација модула објекта за додатак увоз/извоз.';
    $Self->{Translation}->{'Overview.'} = 'Преглед.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Параметри за позадински приказ контролне табле листе конфигурационих ставки фирме клијента у интерфејсу оператера. "Limit" дефинише подразумевани број приказаних ставки. "Group" се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). "Default" одређује да ли је додатак подразумевано активиран или да је неопходно да га корисник мануелно активира. "CacheTTLLocal" је време у минутима за кеширање додатка.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Параметри за боје статуса примене на приказу поставки у интерфејсу оператера.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Параметри за статусе примене на приказу поставки у интерфејсу оператера.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Параметри за атрибуте узорка групе за дозволе општег каталога';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Параметри за странице (на којима су конфигурационе ставке приказане).';
    $Self->{Translation}->{'Permission Group'} = 'Група приступа';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана претраге ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана деталног приказа ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана додавања ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана измене ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана историјата ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Потребне дозволе за употребу екрана штампе ITSM конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Потребна права за брисање конфигурационе ставке.';
    $Self->{Translation}->{'Search config items.'} = 'Претрага конфигурационих ставки.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Бира модул оператора аутоматског увећања конфигурационе ставке. Оператор аутоматског увећања повећава број ставке, SystemID, ConfigItemClassID и коришћени бројач. Формат је "SystemID.ConfigItemClassID.бројач", нпр 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Поставља стање инцидента конфигурационе ставке када је тикет повезан са ставком.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Одређује статус примене на екрану масовне акције конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Одређује статус инцидента на екрану масовне акције конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'У менију приказује везу која омогућава повезивање конфигурационе ставке са другим објектом на детаљном приказу конфигурације у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'У менију приказује везу за приступ историјату конфигурационе ставке на прегледу конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'У менију приказује везу за приступ историјату конфигурационе ставке на детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'У менију приказује везу за брисање конфигурационе ставке на њеном детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'У менију приказује везу за умножавање конфигурационе ставке на прегледу конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'У менију приказује везу за умножавање конфигурационе ставке на њеном детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'У менију приказује везу за измену конфигурационе ставке на њеном детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'У менију приказује везу за повратак на детаљни приказ конфигурационе ставке  у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'У менију приказује везу за штампу конфигурационе ставке на њеном детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'У менију приказује везу за детаљни приказ конфигурационе ставке на прегледу конфигурационе ставке у интерфејсу оператера.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Приказује историјат конфигурационе ставке (обрнут редослед) у интерфејсу оператера.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Идентификатор за конфигурациону ставку, нпр. ConfigItem#, MyConfigItem#. Подразумевано је ConfigItem#.';
    $Self->{Translation}->{'class'} = 'класа';
    $Self->{Translation}->{'global'} = 'глобално';
    $Self->{Translation}->{'postproductive'} = 'пост-продукција';
    $Self->{Translation}->{'preproductive'} = 'пре-продукција';
    $Self->{Translation}->{'productive'} = 'продукција';


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
