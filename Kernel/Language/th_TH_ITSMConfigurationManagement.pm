# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::th_TH_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'การจัดการ Config Item';
    $Self->{Translation}->{'Change class definition'} = 'นิยามของคลาสการเปลี่ยนแปลง';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'นิยาม';
    $Self->{Translation}->{'Change'} = 'เปลี่ยน';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'สถานภาพของเหต์การณ์';
    $Self->{Translation}->{'Deployment State'} = 'สถานภาพการใช้งาน';
    $Self->{Translation}->{'Class'} = 'คลาส';
    $Self->{Translation}->{'Deployment State Type'} = 'ประเภทสถานภาพการใช้งาน';
    $Self->{Translation}->{'Current Incident State'} = 'สถานภาพของเหต์การณ์ปัจจุบัน';
    $Self->{Translation}->{'Current Incident State Type'} = 'ประเภทสถานภาพของเหต์การณ์ปัจจุบัน';
    $Self->{Translation}->{'Last changed'} = 'การเปลี่ยนแปลงล่าสุด';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Config Item';
    $Self->{Translation}->{'Filter for Classes'} = 'ตัวกรองสำหรับคลาส';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'เลือกคลาสจากรายการที่จะสร้าง Config Item ใหม่';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'การทำงานเป็นกลุ่มของ ITSM ConfigItem';
    $Self->{Translation}->{'Deployment state'} = 'สถานภาพการใช้งาน';
    $Self->{Translation}->{'Incident state'} = 'สถานภาพของเหตุการณ์';
    $Self->{Translation}->{'Link to another'} = 'เชื่อมโยงไปที่อื่น';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'จำนวนรายการการกำหนดค่าไม่ถูกต้อง!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'จำนวนของรายการการกำหนดค่าอื่นๆที่ต้องการเชื่อมโยง';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = ' ชื่อของรายการการตั้งค่านี้\'';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'ชื่อที่ถูกการใช้งานโดย ConfigItems มีจำนวนดังต่อไปนี้ (s): %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';
    $Self->{Translation}->{'History Content'} = 'เนื้อหาประวัติ';
    $Self->{Translation}->{'Createtime'} = 'เวลาที่สร้าง';
    $Self->{Translation}->{'Zoom view'} = 'มุมมองการซูม';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'การตั้งค่าข้อความ';
    $Self->{Translation}->{'Config Items per page'} = 'Config Items ในแต่ละหน้า';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'ดำเนินการค้นหา';
    $Self->{Translation}->{'Also search in previous versions?'} = 'ค้นหาเวอร์ชั่นที่แล้วด้วยหรือไม่?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'รายการการกำหนดค่า';
    $Self->{Translation}->{'Configuration Item Information'} = 'ข้อมูลรายการการกำหนดค่า';
    $Self->{Translation}->{'Current Deployment State'} = 'สถานภาพการใช้งานปัจจุบัน';
    $Self->{Translation}->{'Last changed by'} = 'การเปลี่ยนแปลงล่าสุดโดย';
    $Self->{Translation}->{'Show one version'} = 'แสดงหนึ่งเวอร์ชั่น';
    $Self->{Translation}->{'Show all versions'} = 'แสดงเวอร์ชั่นทั้งหมด';
    $Self->{Translation}->{'Version Incident State'} = 'เวอร์ชั่นของสถานภาพของเหตุการณ์';
    $Self->{Translation}->{'Version Deployment State'} = 'เว่อร์ชั่นสถานภาพการใช้งาน';
    $Self->{Translation}->{'Version Number'} = 'หมายเลขเวอร์ชั้น';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'เนื้อหาเวอร์ชั่น Configuration Item';
    $Self->{Translation}->{'Property'} = 'คุณสมบัติ';

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
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';
    $Self->{Translation}->{'printed by %s at %s'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '';
    $Self->{Translation}->{'No ClassID is given!'} = '';
    $Self->{Translation}->{'No access rights for this class given!'} = '';
    $Self->{Translation}->{'No Result!'} = 'ไม่มีผลลัพธ์!';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'สถานภาพการพัฒนาการของ config item นี้ ';
    $Self->{Translation}->{'The incident state of this config item'} = 'สถานภาพเหตุการณ์ของ config item นี';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'ระหว่าง';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'จำนวนสูงสุดของหนึ่งอุปกรณ์';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'เขตข้อมูลว่างเปล่าบ่งชี้ว่าค่าปัจจุบันจะถูกเก็บไว้';
    $Self->{Translation}->{'Skipped'} = 'ข้ามแล้ว';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'โมเดล';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'หมายเลขซีเรียล';
    $Self->{Translation}->{'CPU'} = 'ซีพียู';
    $Self->{Translation}->{'Ram'} = 'แรม';
    $Self->{Translation}->{'Hard Disk'} = 'ฮาร์ดดิสก์';
    $Self->{Translation}->{'Capacity'} = 'ความจุ';
    $Self->{Translation}->{'Network Adapter'} = 'การ์ดเชื่อมต่อเครือข่าย';
    $Self->{Translation}->{'IP over DHCP'} = 'IP ผ่าน DHCP';
    $Self->{Translation}->{'IP Address'} = 'ที่อยู่ไอพี';
    $Self->{Translation}->{'Graphic Adapter'} = 'ตัวปรับต่อกราฟฟิค';
    $Self->{Translation}->{'Other Equipment'} = 'อุปกรณ์อื่น ๆ';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'การรับประกันวันหมดอายุ';
    $Self->{Translation}->{'Install Date'} = 'วันติดตั้ง';
    $Self->{Translation}->{'Phone 1'} = 'โทรศัพท์ 1';
    $Self->{Translation}->{'Phone 2'} = 'โทรศัพท์ 2';
    $Self->{Translation}->{'E-Mail'} = '';
    $Self->{Translation}->{'Network Address'} = 'ที่อยู่เครือข่าย';
    $Self->{Translation}->{'Subnet Mask'} = 'เครือข่ายย่อยมาส์ก';
    $Self->{Translation}->{'Gateway'} = 'ประตูสัญญาณ';
    $Self->{Translation}->{'Licence Type'} = 'ประเภทลายเซนต์';
    $Self->{Translation}->{'Licence Key'} = 'กุญแจลายเซนต์';
    $Self->{Translation}->{'Quantity'} = 'จำนวน';
    $Self->{Translation}->{'Expiration Date'} = 'วันหมดอายุ';
    $Self->{Translation}->{'Media'} = 'มีเดีย';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Expired'} = 'หมดอายุ';
    $Self->{Translation}->{'Maintenance'} = 'การดูแลรักษา';
    $Self->{Translation}->{'Pilot'} = 'การนำร่อง';
    $Self->{Translation}->{'Planned'} = 'การวางแผน';
    $Self->{Translation}->{'Repair'} = 'ซ่อม';
    $Self->{Translation}->{'Retired'} = 'เกษียณ';
    $Self->{Translation}->{'Review'} = 'ตัวอย่าง';
    $Self->{Translation}->{'Test/QA'} = 'ทดสอบ/QA';
    $Self->{Translation}->{'Laptop'} = 'แล็ปท็อป';
    $Self->{Translation}->{'Desktop'} = 'เดสทอป';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'เซิร์ฟเวอร์';
    $Self->{Translation}->{'Other'} = 'อื่นๆ';
    $Self->{Translation}->{'Monitor'} = 'จอภาพ';
    $Self->{Translation}->{'Printer'} = 'เครื่องพิมพ์';
    $Self->{Translation}->{'Switch'} = 'สับเปลี่ยน';
    $Self->{Translation}->{'Router'} = 'เราเตอร์';
    $Self->{Translation}->{'WLAN Access Point'} = 'จุดเชื่อมต่อWLAN';
    $Self->{Translation}->{'Security Device'} = 'อุปกรณ์รักษาความปลอดภัย';
    $Self->{Translation}->{'Backup Device'} = 'อุปกรณ์สำรองข้อมูล';
    $Self->{Translation}->{'Mouse'} = 'เม้าส์';
    $Self->{Translation}->{'Keyboard'} = 'แป้นพิมพ์';
    $Self->{Translation}->{'Camera'} = 'กล้อง';
    $Self->{Translation}->{'Beamer'} = 'ผู้คาน';
    $Self->{Translation}->{'Modem'} = 'โมเดม';
    $Self->{Translation}->{'PCMCIA Card'} = 'บัตร PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'อุปกรณ์ USB';
    $Self->{Translation}->{'Docking Station'} = 'สถานี Docking';
    $Self->{Translation}->{'Scanner'} = 'เครื่องสแกน';
    $Self->{Translation}->{'Building'} = 'การสร้าง';
    $Self->{Translation}->{'Office'} = 'ออฟฟิศ';
    $Self->{Translation}->{'Floor'} = 'ชั้น';
    $Self->{Translation}->{'Room'} = 'ห้อง';
    $Self->{Translation}->{'Rack'} = 'จำพวก';
    $Self->{Translation}->{'Workplace'} = 'ที่ทำงาน';
    $Self->{Translation}->{'Outlet'} = 'เอาท์เล็ท';
    $Self->{Translation}->{'IT Facility'} = 'สิ่งอำนวยความสะดวกด้านไอที';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'แอพลิเคชันของลูกค้า';
    $Self->{Translation}->{'Middleware'} = 'มิดเดิ้ลแวย์';
    $Self->{Translation}->{'Server Application'} = 'แอพลิเคชันเซิร์ฟเวอร์';
    $Self->{Translation}->{'Client OS'} = 'OS ของลูกค้า';
    $Self->{Translation}->{'Server OS'} = 'OS เซิร์ฟเวอร์';
    $Self->{Translation}->{'Admin Tool'} = 'เครื่องมือแอดมิน';
    $Self->{Translation}->{'User Tool'} = 'เครื่องมือของผู้ใช้';
    $Self->{Translation}->{'Embedded'} = 'การฝังตัว';
    $Self->{Translation}->{'Single Licence'} = 'ลายเซนต์เดียว';
    $Self->{Translation}->{'Per User'} = 'ต่อผู้ใช้';
    $Self->{Translation}->{'Per Processor'} = 'สำหรับตัวประมวลผล';
    $Self->{Translation}->{'Per Server'} = 'ต่อเซิร์ฟเวอร์';
    $Self->{Translation}->{'Per Node'} = 'ต่อหนึ่งโหนด';
    $Self->{Translation}->{'Volume Licence'} = 'ลายเซนต์อุปกรณ์เสียง';
    $Self->{Translation}->{'Enterprise Licence'} = 'ลายเวนต์เอ็นเตอร์ไพรส์';
    $Self->{Translation}->{'Developer Licence'} = 'ลายเซนต์ผู้พัฒนา';
    $Self->{Translation}->{'Demo'} = 'การสาธิต';
    $Self->{Translation}->{'Time Restricted'} = 'เวลา จำกัด';
    $Self->{Translation}->{'Freeware'} = 'ฟรีแวร์';
    $Self->{Translation}->{'Open Source'} = 'โอเพนซอร์ส';
    $Self->{Translation}->{'Unlimited'} = 'ไม่จำกัด';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'โอเค';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'ตรวจสอบชื่อเฉพาะเท่านั้นที่อยู่ใน ConfigItem ชั้นเดียวกัน (ชั้น) หรือทั้งหมด (ทั้งหมด) ซึ่งหมายความว่าConfigItem ที่มีอยู่ทั้งหมดจะถูกนำเข้าบัญชีเพื่อค้นหารายการที่ซ้ำกัน';
    $Self->{Translation}->{'Config Items'} = 'Config Items';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'โมดูลกิจกรรมของConfig item ที่ช่วยให้เข้าสู่ระบบประวัติในอินเตอร์เฟสของเอเย่นต์';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'การจำกัด Configuration Item';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Configuration Item ค้นหา backend router ของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'สร้างและจัดการคำนิยามสำหรับ Configuration Items';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'กำหนดสิทธิ์ที่จำเป็นในการสร้างรายการการตั้งค่า ITSMโดยใช้อินเตอร์เฟซทั่วไป';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'กำหนดสิทธิ์ที่จำเป็นในการเอารายการการตั้งค่า ITSMโดยใช้อินเตอร์เฟซทั่วไป';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'กำหนดสิทธิ์ที่จำเป็นในการค้นหารายการการตั้งค่า ITSMโดยใช้อินเตอร์เฟซทั่วไป';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'กำหนดสิทธิ์ที่จำเป็นในการอัพเดตรายการการตั้งค่า ITSMโดยใช้อินเตอร์เฟซทั่วไป';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'กำหนดโมดูลภาพรวมในการแสดงมุมมองขนาดเล็กของรายการ  Configuration Items';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'กำหนดนิพจน์ทั่วไปเป็นรายบุคคลในConfigItem แต่ละชั้น เพื่อตรวจสอบชื่อ ConfigItem และเพื่อแสดงข้อความผิดพลาดที่สอดคล้องกัน';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'กำหนดอบเจกต์ย่อยเริ่มต้นของคลาส \'ITSMConfigItem\'';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'กำหนดจำนวนแถวสำหรับตัวแก้ไขการนิยาม CI ในอินเตอร์เฟสของผู้ดูแลระบบ';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'กำหนดขีดจำกัดของการค้นหาสำหรับหน้าจอ AgentITSMConfigItem';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'กำหนดขีดจำกัดของการค้นหาสำหรับหน้าจอ AgentITSMConfigItemSearch';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'กำหนดคอลัมน์ที่จะแสดงในภาพรวมของconfig item ตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์ หมายเหตุ: ระดับของคอลัมน์สามารถใช้ได้เสมอถ้าตัวกรอง \'ทั้งหมด\' ถูกเลือก';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'กำหนดคอลัมน์ที่จะแสดงในการค้นหา config item ตัวเลือกนี้จะไม่มีผลต่อตำแหน่งของคอลัมน์ ';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'กำหนดคอลัมน์ที่แสดง CIs ในภาพรวมของรายการการตั้งค่าซึ่งขึ้นอยู่กับคลาส CI รายการการป้อนแต่ละรายการจะต้องนำหน้าด้วยชื่อคลาสและเครื่องหมายทวิภาคคู่ (เช่นคอมพิวเตอร์: :) มีแอตทริบิวต์ CI เพียงไม่กี่แอตทริบิวต์ ที่ใช้กันทั่วไปใน CIs ทั้งหมด (ตัวอย่างสำหรับคลาสคอมพิวเตอร์: คอมพิวเตอร์::ชื่อ, คอมพิวเตอร์::CurDeplState, คอมพิวเตอร์::CreateTime) ในการแสดงแอตทริบิวต์ CI ตามที่กำหนดไว้ในคำนิยาม CI จะต้องใช้รูปแบบต่อไปนี้(ตัวอย่างสำหรับคลาสคอมพิวเตอร์): คอมพิวเตอร์::ฮาร์ดดิสก์::1, คอมพิวเตอร์::ฮาร์ดดิสก์::1::ความจุ::1, คอมพิวเตอร์::ฮาร์ดดิสก์::2, คอมพิวเตอร์::ฮาร์ดดิสก์::2::ความจุ::1  หากไม่มีการป้อนคลาสที่ CI แล้วคอลัมน์เริ่มต้นจะแสดงตามที่กำหนดไว้ในการตั้งค่า ITSMConfigItem ::Frontend :: AgentITSMConfigItem ### ShowColumns';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'กำหนดคอลัมน์ที่แสดง CIs ในการค้นหาของรายการการตั้งค่าซึ่งขึ้นอยู่กับคลาส CI รายการการป้อนแต่ละรายการจะต้องนำหน้าด้วยชื่อคลาสและเครื่องหมายทวิภาคคู่ (เช่นคอมพิวเตอร์: :) มีแอตทริบิวต์ CI เพียงไม่กี่แอตทริบิวต์ ที่ใช้กันทั่วไปใน CIs ทั้งหมด (ตัวอย่างสำหรับคลาสคอมพิวเตอร์: คอมพิวเตอร์::ชื่อ, คอมพิวเตอร์::CurDeplState, คอมพิวเตอร์::CreateTime) ในการแสดงแอตทริบิวต์ CI ตามที่กำหนดไว้ในคำนิยาม CI จะต้องใช้รูปแบบต่อไปนี้(ตัวอย่างสำหรับคลาสคอมพิวเตอร์): คอมพิวเตอร์::ฮาร์ดดิสก์::1, คอมพิวเตอร์::ฮาร์ดดิสก์::1::ความจุ::1, คอมพิวเตอร์::ฮาร์ดดิสก์::2, คอมพิวเตอร์::ฮาร์ดดิสก์::2::ความจุ::1 หากไม่มีการป้อนคลาสที่ CI แล้วคอลัมน์เริ่มต้นจะแสดงตามที่กำหนดไว้ในการตั้งค่า ITSMConfigItem ::Frontend :: AgentITSMConfigItem ### ShowColumns';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'กำหนดคอลัมน์ที่แสดง CIs ในตารางการเชื่อมโยงมุมมองที่ซับซ้อนซึ่งขึ้นอยู่กับคลาส CI รายการการป้อนแต่ละรายการจะต้องนำหน้าด้วยชื่อคลาสและเครื่องหมายทวิภาคคู่ (เช่นคอมพิวเตอร์: :) มีแอตทริบิวต์ CI เพียงไม่กี่แอตทริบิวต์ ที่ใช้กันทั่วไปใน CIs ทั้งหมด (ตัวอย่างสำหรับคลาสคอมพิวเตอร์: คอมพิวเตอร์::ชื่อ, คอมพิวเตอร์::CurDeplState, คอมพิวเตอร์::CreateTime) ในการแสดงแอตทริบิวต์ CI ตามที่กำหนดไว้ในคำนิยาม CI จะต้องใช้รูปแบบต่อไปนี้(ตัวอย่างสำหรับคลาสคอมพิวเตอร์): คอมพิวเตอร์::ฮาร์ดดิสก์::1, คอมพิวเตอร์::ฮาร์ดดิสก์::1::ความจุ::1, คอมพิวเตอร์::ฮาร์ดดิสก์::2, คอมพิวเตอร์::ฮาร์ดดิสก์::2::ความจุ::1 หากไม่มีการป้อนคลาสที่ CI แล้วคอลัมน์เริ่มต้นจะแสดงตามที่กำหนดไว้ในการตั้งค่า ITSMConfigItem ::Frontend :: AgentITSMConfigItem ### ShowColumns';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'ซ้ำ';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'เปิดใช้งานการตั้งค่ารายการคุณลักษณะของการทำงานเป็นกลุ่ม สำหรับฟรอนต์เอนของเอเย่นต์เพื่อทำงานกับรายการการกำหนดค่าที่มีมากกว่าหนึ่งในหนึ่งครั้ง';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'เปิดใช้งานการตั้งค่ารายการคุณลักษณะของการทำงานเป็นกลุ่มเฉพาะสำหรับกลุ่มที่ระบุไว้';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'เปิด / ปิดการใช้งานฟังก์ชั่นเพื่อตรวจสอบ ConfigItems สำหรับชื่อที่ไม่ซ้ำกัน ก่อนเปิดใช้งานตัวเลือกนี้คุณควรตรวจสอบระบบของคุณสำหรับรายการการตั้งค่าที่มีอยู่แล้วด้วยชื่อที่ซ้ำกัน คุณสามารถทำเช่นนี้ด้วยสคริปต์ดังต่อไปนี้ bin / otrs.ITSMConfigItemListDuplicates.pl';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'โมดูลในการตรวจสอบผู้รับผิดชอบกลุ่มสำหรับคลาส';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'โมดูลในการตรวจสอบผู้รับผิดชอบกลุ่มสำหรับ configuration item';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'โมดูลสร้างสถิติ ITSM config item';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'การลงทะเบียนโมดูล Object backend สำหรับโมดูลนำเข้าหรือส่งออก';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'พารามิเตอร์สำหรับการพัฒนาสถานภาพของสีในมุมมองการตั้งค่าของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'พารามิเตอร์สำหรับการพัฒนาสถานภาพในมุมมองการตั้งค่าของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'พารามิเตอร์สำหรับตัวอย่างกลุ่มที่ได้รับอนุญาตของแอตทริบิวต์แค็ตตาล็อกทั่วไป';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'พารามิเตอร์สำหรับแต่ละหน้า(ซึ่ง configuration items แสดง)';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานในหน้าจอรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานในหน้าจอการค้นหารายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานในหน้าจอการซูมรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานการเพิ่มในหน้าจอรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานการแก้ไขในหน้าจอรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานประวัติในหน้าจอรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'จำเป็นต้องมีการอนุญาติในการใช้งานการพิมพ์ในหน้าจอรายการการตั้งค่า ITSM ในอินเตอร์เฟซของเอเย่นต์';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'เลือกหมายเลขรายการตั้งค่าตัวกำเนิดโมดูล "AutoIncrement" จะเพิ่มหมายเลขรายการกำหนดค่า SystemID ConfigItemClassID และตัวนับที่มีการใช้ รูปแบบคือ "SystemID.ConfigItemClassID.Counter" เช่น 1205000004, 1205000005';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'ตั้งค่าสถานะการใช้งานในหน้าจอการตั้งค่ารายการเป็นกลุ่มของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'ตั้งค่าสถานะของเหตุการณ์ในหน้าจอการตั้งค่ารายการเป็นกลุ่มของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อลิงค์รายการการตั้งค่ากับออบเจกค์อื่นในการซูมในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะเข้าชมประวัติของ configuration item ในมุมมองทั่วไปของconfiguration itemในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะเข้าชมประวัติของ configuration item ในมุมมองการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะจำลอง configuration item ในมุมมองทั่วไปของconfiguration item ในอินเตอร์เฟซเอเย่นต์ ';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะจำลองconfiguration item ในมุมมองการซูมของอินเตอร์เฟซเอเย่นต์ ';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะแก้ไข configuration item ในมุมมองการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'แสดงลิงค์ในเมนูในการที่จะพิมพ์ configuration item ในมุมมองการซูมของอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'แสดงลิงค์ในเมนูเพื่อซูมรายการการตั้งค่าในมุมมองภาพรวมของรายการการตั้งค่าในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'แสดงประวัติ config item (ลำดับย้อนกลับ) ในอินเตอร์เฟซเอเย่นต์';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'ตัวบ่งชี้สำหรับ  Configuration Item เช่น ConfigItem#, MyConfigItem# ค่าเริ่มต้นคือ ConfigItem#';
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
