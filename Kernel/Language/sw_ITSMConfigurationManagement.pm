# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::sw_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Usanidi wa usimamizi wa kipengele ';
    $Self->{Translation}->{'Change class definition'} = 'Badili ufafanuzi wa tabaka';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Ufafanuzi';
    $Self->{Translation}->{'Change'} = 'Badilisha';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Hali ya tukio';
    $Self->{Translation}->{'Deployment State'} = 'Hali ya kutumia';
    $Self->{Translation}->{'Class'} = 'Tabaka';
    $Self->{Translation}->{'Deployment State Type'} = 'Aina ya hali ya kutumia';
    $Self->{Translation}->{'Current Incident State'} = 'Hali ya tukio la sasa';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aina ya hali ya tukio la sasa';
    $Self->{Translation}->{'Last changed'} = 'Mwisho kubadilishwa';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Usanidi wa Kipengele ';
    $Self->{Translation}->{'Filter for Classes'} = 'Chuja kwa ajili ya matabaka';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Chagua tabaka kutoka kwenye orodha ya kutengeneza kipengele cha usanidi kipya. ';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'Vitendo vya wingi vya kipengele cha usanidi cha ITSM';
    $Self->{Translation}->{'Deployment state'} = 'Hali ya kutumia';
    $Self->{Translation}->{'Incident state'} = 'Hali ya tukio';
    $Self->{Translation}->{'Link to another'} = 'Unganisha na nyingine';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Namba ya kipengele cha usanidi n batili!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Namba ya kipengele kingine cha usanidi cha kuunganisha nacho.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Jina la hiki kipengele cha usanidi';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Jina hili tayari limekwisha tumikana kipengele cha usanidi chenye namba i(z)fuatazo: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';
    $Self->{Translation}->{'History Content'} = 'Maudhui ya historia';
    $Self->{Translation}->{'Createtime'} = 'Muda wa kutengeneza';
    $Self->{Translation}->{'Zoom view'} = 'Mandhari iliyokuzwa';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Mipangilio ya muktadha';
    $Self->{Translation}->{'Config Items per page'} = 'Vipengele vya usanidi kwa kila ukurusa';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Tafuta';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Pia tafuta katika toleo lililopita?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Kipengele cha Usanidi';
    $Self->{Translation}->{'Configuration Item Information'} = 'Taarifa za kipengele cha usanidi';
    $Self->{Translation}->{'Current Deployment State'} = 'Hali ya kutumia ya sasa';
    $Self->{Translation}->{'Last changed by'} = 'Mwisho kubadilishwa na';
    $Self->{Translation}->{'Show one version'} = 'Onyesha toleo moja';
    $Self->{Translation}->{'Show all versions'} = 'Onyesha matoleo yote';
    $Self->{Translation}->{'Version Incident State'} = 'Toleo la hali ya tukio';
    $Self->{Translation}->{'Version Deployment State'} = 'Hali ya toleo la kutumia';
    $Self->{Translation}->{'Version Number'} = 'Namba ya toleo';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Toleo la kipengele cha usanidi kwa undani.';
    $Self->{Translation}->{'Property'} = 'Mali';

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
    $Self->{Translation}->{'ConfigItem'} = 'Kipengele cha usanidi';
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
    $Self->{Translation}->{'The deployment state of this config item'} = 'Hali ya matumizi ya hii kipengele cha usanidi ';
    $Self->{Translation}->{'The incident state of this config item'} = 'Hali ya tukio ya hiki kipengele cha usanidi';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Katikati';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Kima cha juu cha namba ya elementi mojawapo';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Uga zilizowazi zinaonyesha kwamba thamani za sasa zimewekwa.';
    $Self->{Translation}->{'Skipped'} = 'Rukwa';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Mfano';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Namba tambulishi';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'Ram';
    $Self->{Translation}->{'Hard Disk'} = 'Diski kuu';
    $Self->{Translation}->{'Capacity'} = 'Uwezo';
    $Self->{Translation}->{'Network Adapter'} = 'Adapta ya mtandao';
    $Self->{Translation}->{'IP over DHCP'} = 'IP kwa DHCP';
    $Self->{Translation}->{'IP Address'} = 'Anwani ya IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adapta ya Mchoro';
    $Self->{Translation}->{'Other Equipment'} = 'Vifaa vingine';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Tarehe ya kuisha kw audhamini.';
    $Self->{Translation}->{'Install Date'} = 'Tarehe ya kusakinisha';
    $Self->{Translation}->{'Phone 1'} = 'Simu ya 1';
    $Self->{Translation}->{'Phone 2'} = 'Simu ya 2';
    $Self->{Translation}->{'E-Mail'} = '';
    $Self->{Translation}->{'Network Address'} = 'Anwani ya mtandao';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnet mask';
    $Self->{Translation}->{'Gateway'} = 'Kichanganishi mtandao';
    $Self->{Translation}->{'Licence Type'} = 'Aina ya leseni';
    $Self->{Translation}->{'Licence Key'} = 'Neno kuu la leseni';
    $Self->{Translation}->{'Quantity'} = 'Wingi';
    $Self->{Translation}->{'Expiration Date'} = 'Tarehe ya mwisho';
    $Self->{Translation}->{'Media'} = 'Midia';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = 'Mtandao';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Expired'} = 'Imeisha';
    $Self->{Translation}->{'Maintenance'} = 'Matengenezo';
    $Self->{Translation}->{'Pilot'} = 'Kwanza';
    $Self->{Translation}->{'Planned'} = 'Iliyopangwa';
    $Self->{Translation}->{'Repair'} = 'Rekebisha';
    $Self->{Translation}->{'Retired'} = 'Staafu';
    $Self->{Translation}->{'Review'} = 'Mapitio';
    $Self->{Translation}->{'Test/QA'} = 'Jaribio/ Maswali na Majibu';
    $Self->{Translation}->{'Laptop'} = 'Kompyuta ya mkononi';
    $Self->{Translation}->{'Desktop'} = 'Eneo kazi';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Seva';
    $Self->{Translation}->{'Other'} = 'Engine';
    $Self->{Translation}->{'Monitor'} = 'Monita';
    $Self->{Translation}->{'Printer'} = 'Kichapishi';
    $Self->{Translation}->{'Switch'} = 'Swichi';
    $Self->{Translation}->{'Router'} = 'Kipanga njia';
    $Self->{Translation}->{'WLAN Access Point'} = 'Kiungo ufikivu cha WLAN';
    $Self->{Translation}->{'Security Device'} = 'Kifaa cha ulinzi';
    $Self->{Translation}->{'Backup Device'} = 'Kifaa cha chelezo';
    $Self->{Translation}->{'Mouse'} = 'Kipanya';
    $Self->{Translation}->{'Keyboard'} = 'Boabonye';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Beamer'} = 'Projector';
    $Self->{Translation}->{'Modem'} = 'Modemu';
    $Self->{Translation}->{'PCMCIA Card'} = 'Kadi ya PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Kifaa cha USB';
    $Self->{Translation}->{'Docking Station'} = 'Kituo egeshi';
    $Self->{Translation}->{'Scanner'} = 'Kitambazo';
    $Self->{Translation}->{'Building'} = 'Jengo';
    $Self->{Translation}->{'Office'} = 'Ofisi';
    $Self->{Translation}->{'Floor'} = 'Sakafu';
    $Self->{Translation}->{'Room'} = 'Chumba';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Workplace'} = 'Eneo la kazi';
    $Self->{Translation}->{'Outlet'} = 'Sehemu ya kutokea';
    $Self->{Translation}->{'IT Facility'} = 'P';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Programu-tumizi a mteja';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Seva ya programu-tumizi';
    $Self->{Translation}->{'Client OS'} = 'OS ya mteja';
    $Self->{Translation}->{'Server OS'} = 'OS ya seva';
    $Self->{Translation}->{'Admin Tool'} = 'Kifaa cha kiongozi';
    $Self->{Translation}->{'User Tool'} = 'Kifaa cha mtumiaji';
    $Self->{Translation}->{'Embedded'} = 'Pakichwa';
    $Self->{Translation}->{'Single Licence'} = 'Leseni moja';
    $Self->{Translation}->{'Per User'} = 'Kwa mtumiaji';
    $Self->{Translation}->{'Per Processor'} = 'Kwa kichakato';
    $Self->{Translation}->{'Per Server'} = 'Kwa seva';
    $Self->{Translation}->{'Per Node'} = 'Kwa fundo';
    $Self->{Translation}->{'Volume Licence'} = 'Leseni ya sauti';
    $Self->{Translation}->{'Enterprise Licence'} = 'Leseni ya Enterprie';
    $Self->{Translation}->{'Developer Licence'} = 'Leseni ya mtengenezaji';
    $Self->{Translation}->{'Demo'} = 'Onyesho';
    $Self->{Translation}->{'Time Restricted'} = 'Muda umezuiliwa';
    $Self->{Translation}->{'Freeware'} = 'Programu ya bure';
    $Self->{Translation}->{'Open Source'} = 'Chanzo cha wazi';
    $Self->{Translation}->{'Unlimited'} = 'Haina kikomo';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Sawa';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Angalia majina ya kipekee tu katika tabaka sawa la kipengele cha usanidi (\'Tabaka\') au zote (\'Zote\'), ambayo inamaanisha kila kipengele cha usanidi kilichopo kimejumuishwa wakati nakala pacha zinaangaliwa.';
    $Self->{Translation}->{'Config Items'} = 'Vipengele vya usanidi';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Sanidi moduli ya tukio ya kipengele ambacho kinawezesha kuingia katika historia katika kiolesura cha wakala.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Kikomo cha kipengele cha usanidi';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Kipanga njia cha mazingira ya nyuma cha utafutaji wa kipengele cha usanidi cha kiolesura cha wakala. ';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Tengeneza na simamia ufafanuzi wa vipengele vya usanidi.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Inafafanua ruhusa zinazohitajika kutengeneza vipengele vya usanidi vya ITSM kwa kutumia kiolesura cha jeneriki.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Inafafanua ruhusa zinazohitajika kupatavipengele vya usanidi vya ITSM kwa kutumia kiolesura cha jeneriki.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Inafafanua ruhusa zinazohitajika kutafuta vipengele vya usanidi vya ITSM kwa kutumia kiolesura cha jeneriki.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Inafafanua ruhusa zinazohitajika kusasisha vipengele vya usanidi vya ITSM kwa kutumia kiolesura cha jeneriki.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Inafafanua moduli ya mapitio kuonyesha mandhari ndogo ya orodha ya vipengele vya usanidi.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Inafafanua semi za mara kwa mara mojamoja kwa kila tabaka la kipengele ch usanidi kuangalia jina la kipengele cha usanidi na kuonyesha ujumbe wa makosa yanayohusiana.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Inafafanua kipengele cha chaguo msingi cha tabaka la \'Kipengelecha Usanidi cha ITSM\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Inafafanua namba ya safu mlalo kwa mhariri wa ufafanuzi wa CI katika kiolesura cha kiongozi';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Inawezesha upeo wa kutafuta kwa skerini ya Kipengele cha usanidi cha ITSM cha wakala.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Inafafanua kikomo cha kutafuta kwa skrini ya Kutafuta Kipengele cha usanidi cha ITSM  cha Wakala.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Inaelezea safu wima zote zilizoonyeshwa katika mapitio ya kipengele cha usanidi. Hili chaguo halina madhara katika nafasi ya safuwima. Kidokezo: Tabaka la safuwima linapatikana mara zote kama kichujio \'Vyote\' itachaguliwa.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Inafafanua safu wima zilizoonyeshwa katika utafutaji wa kipengele cha usanidi. Chaguo hili halina madhara katika nafasi ya safuwima.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Inafafanua safu wima za CI zilizoonyeshwa katika mapitio ya kipengele cha usanidi kutegemeana na tabaka la CI. Kila ingizo lazima liwe na kiambishi awali jina la tabaka na :: ( mfano Tarakilishi::)Kuna viumbi vichache vya CI ambavyo vipo kwa CI zote (mfano kwenye tabaka la tarakilishi: tarakilishi::jina, Tarakilishi::Hali yaCurDep, Tarakilishi::Muda wa kutengeneza). Kuonyesha kiumbi cha CI kimoja kimoja kama vilivyo fafanuliwa kwenye ufafanuzi wa CI, mpangilio ufuatao lazima utumike (mfano kwenye tabaka tarakilishi): Tarakilishi::diski kuu::1, Tarakilishi::Diski kuu ngumu::1Uwezo::1, Tarakilishi::Diski kuu ngumu::2, Tarakilishi::Diski kuu ngumu::2::Uwezo::1. Kama hakuna ingizo kwa tabaka la CI, safuwima chaguo msingi zinaonyeshwa kama zilivyofafanuliwa katika mpangilio
ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Inafafanua safu wima za CI zilizoonyeshwa katika kutafuta kipengele cha usanidi kutegemeana na tabaka la CI. Kila ingizo lazima liwe na kiambishi awali jina la tabaka na :: ( mfano Tarakilishi::)Kuna viumbi vichache vya CI ambavyo vipo kwa CI zote (mfano kwenye tabaka la tarakilishi: tarakilishi::jina, Tarakilishi::Hali yaCurDep, Tarakilishi::Muda wa kutengeneza). Kuonyesha kiumbi cha CI kimoja kimoja kama vilivyo fafanuliwa kwenye ufafanuzi wa CI, mpangilio ufuatao lazima utumike (mfano kwenye tabaka tarakilishi): Tarakilishi::diski kuu::1, Tarakilishi::Diski kuu ngumu::1Uwezo::1, Tarakilishi::Diski kuu ngumu::2, Tarakilishi::Diski kuu ngumu::2::Uwezo::1. Kama hakuna ingizo kwa tabaka la CI, safuwima chaguo msingi zinaonyeshwa kama zilivyofafanuliwa katika mpangilio
ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Inafafanua safu wima za CI zilizoonyeshwa katika mandhari ya jedwali tata la kiungo,kutegemeana na tabaka la CI. Kila ingizo lazima liwe na kiambishi awali jina la tabaka na :: ( mfano Tarakilishi::).Kuna viumbi vichache vya CI ambavyo vipo kwa CI zote (mfano kwenye tabaka la tarakilishi: tarakilishi::jina, Tarakilishi::Hali yaCurDep, Tarakilishi::Muda wa kutengeneza). Kuonyesha kiumbi cha CI kimoja kimoja kama vilivyo fafanuliwa kwenye ufafanuzi wa CI, mpangilio ufuatao lazima utumike (mfano kwenye tabaka tarakilishi): Tarakilishi::diski kuu::1, Tarakilishi::Diski kuu ngumu::1Uwezo::1, Tarakilishi::Diski kuu ngumu::2, Tarakilishi::Diski kuu ngumu::2::Uwezo::1. Kama hakuna ingizo kwa tabaka la CI, safuwima chaguo msingi zinaonyeshwa.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Nakala pacha';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Inawezesha kipengele cha kitendo ch wingi cha kipengele cha usanidi kwa maingira ya mbele ya wakala kufanya kazi katika kipengele cha usanidi zaidi ya kimoja kwa muda.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Inawezesha kipengele cha kitendo cha wingi cha kipengele cha usanidi kwa makundi yaliyoorodheshwa tu.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Wezesha/Kutowezesha kitendeakazi cha kuangalia vipengele vya usanidi kwa majina ya pekee. Kabla ya kuwezesha chaguo hili unatakiwa kuangalia mfumo wako kwa vipengele vya usanidi kama vipo tayari kwa majina nakala pacha. Unaweza kufanya hivi na maandiko bin/otrs. ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Moduli ya kuangalia makundi yanayohusika na tabaka.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Module ya kuangalia makundi yanayohusika na kipengele cha usanidi.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Moduli ya kutengeneza takwimu za kipengele cha usanidi cha ITSM>';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Usajili wa moduli ya mazingira ya nyuma ya kipengee kwa moduli ya Kuingiza/kuhamisha.';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Vigezo kwa ajili ya rangi ya hali za matumizi kama mandhari ya mapendeleo ya kiolesura cha wakala.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Vigezo kwa ajili ya hali za matumizi kama mandhari ya mapendeleo ya kiolesura cha wakala.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Vigezo kwa mfano ruhusa za vikundi kwa sifa za katalogi za ujumla.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Vigezo kwa ajili ya ukurasa (ambavyo vipengele vya usanidi vimeonyeshwa).';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kipengele cha usanidi cha ITSM katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kutafuta kipengele cha usanidi cha ITSM katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini iliyokuzwa ya kipengele cha usanidi cha ITSM katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kipengele cha usanidi cha ITSM kilichoongeza katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kipengele cha usanidi cha ITSM kilichohaririwa katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kipengele cha usanidi cha ITSM cha historia katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya kipengele cha usanidi cha ITSM cha kuchapisha katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Inachagua moduli ya kuzalisha namba ya kipengele cha usanidi. "OngezaOtomatiki" inaongeza namba ya kipengele ya usanidi, kitambulisho cha mfumo, kitambulisho cha tabaka la kipengele sanidi na kihesabuji vinatumika. Umbizo ni "Kitambulisho cha mfumo.kitambulisho cha tabaka la kipengele sanidi.Kihesabuji". mfano 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Inaweka hali ya kutumia katika skrini ya wingi wa kipengele cha usanidi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Inaweka hali ya tukio katika skrini ya kipengele cha usanidi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Inaonyesha kiongo katika menyu ambacho kinaunganisha kipengele cha usanidi na kipengee kingine katika mandhari iliyokuzwa ya kipengele cha usanidi ya kioleusura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Inaonyesha kiungo kwenye  menyu kuweza kufikia historia ya kipengele cha usanidi katika mapitio ya kipengele ya usanidi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Inaonyesha kiungo kwenye  menyu kuweza kufikia historia ya kipengele cha usanidi katika mandhari yake iliyokuzwa ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Onyesha kiungo katika menyu kutoa nakala pacha ya kipengele cha usanidi katika mapitio ya kipengele cha usanidi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Onyesha kiungo katika menyu kutoa nakala pacha ya kipengele cha usanidi katika mandhari yake ya kipengele cha usanidi cha kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Onyesha kiungo katika menyu kuhariri  kipengele cha usanidi katika mandhari yake iliyokuzwa ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Onyesha kiungo katika menyu kuchapisha kipengele cha usanidi katika mandhari yake iliyokuzwa ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Onyesha kiungo katika menyu kukuza katika kipengele cha usanidi katika mapitio ya kipengele cha usanidi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Inaonyesha historia ya kipengele cha usanidi (kwa mpangilio wa kurudi nyuma) katika kiolesura cha wakala.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Kitambulishi cha kipengele cha usanidi, mfano.ConfigItem#, MyConfigItem#. Chagu-msingi ni ConfigItem#.';
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
