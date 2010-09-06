# --
# Kernel/Language/fa_ITSMConfigItem.pm - the persian (farsi) translation of fa_ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2003-2009 Afshar Mohebbi <afshar.mohebbi at gmail.com>
# --
# $Id: fa_ITSMConfigItem.pm,v 1.3 2010-09-06 20:31:09 en Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Config Item';
    $Lang->{'Config Item-Area'}       = 'محدوده CI';
    $Lang->{'Config Item Management'} = 'مدیریت CI';
    $Lang->{'Change Definition'}      = 'تغییر تعریف';
    $Lang->{'Class'}                  = 'کلاس';
    $Lang->{'Show Versions'}          = 'ویرایش‌ها را نمایش بده';
    $Lang->{'Hide Versions'}          = 'ویرایش‌ها را مخفی کن';
    $Lang->{'Last changed by'}        = 'آخرین تغییر به وسیله';
    $Lang->{'Last changed'}           = 'آخرین تغییر';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'عملیات تغییر تعریف ناموفق بود. برای کسب اطلاع بیشتر log سیستم را ببینید.';
    $Lang->{'Also search in previous versions?'} = 'در ویرایش‌های قبلی هم جستجو انجام شود؟';
    $Lang->{'Config Items shown'}                = 'CIهای نمایش داده شده';
    $Lang->{'Config Items available'}            = 'CIهای در دسترس';
    $Lang->{'Deployment State'}                  = 'وضعیت نصب در محل';
    $Lang->{'Current Deployment State'}          = 'وضعیت فعلی نصب';
    $Lang->{'Incident State'}                    = 'وضعیت رخداد';
    $Lang->{'Current Incident State'}            = 'وضعیت جاری رخداد';
    $Lang->{'The name of this config item'}      = 'نام این CIها';
    $Lang->{'The deployment state of this config item'}
        = 'وضعیت نصب این CI';
    $Lang->{'The incident state of this config item'} = 'وضعیت رخداد این CI';
    $Lang->{'Last Change'}                            = 'آخرین تغییر';
    $Lang->{'Duplicate'}                              = 'تکثیر';
    $Lang->{'Expired'}                                = 'منقضی شده';
    $Lang->{'Inactive'}                               = 'غیر فعال';
    $Lang->{'Maintenance'}                            = 'پشتیبانی و نگهداری';
    $Lang->{'Pilot'}                                  = 'نمونه آزمایشی';
    $Lang->{'Planned'}                                = 'برنامه ریزی شده';
    $Lang->{'Production'}                             = 'در حال تولید';
    $Lang->{'Repair'}                                 = 'تعمیر';
    $Lang->{'Retired'}                                = 'بازنشسته شده';
    $Lang->{'Review'}                                 = 'بازبینی';
    $Lang->{'Test/QA'}                                = 'تست/تضمین کیفیت';
    $Lang->{'Operational'}                            = 'عملیاتی';
    $Lang->{'Incident'}                               = 'رخداد';
    $Lang->{'Desktop'}                                = 'رومیزی';
    $Lang->{'Laptop'}                                 = 'کیفی';
    $Lang->{'Other'}                                  = 'غیره';
    $Lang->{'PDA'}                                    = 'PDA';
    $Lang->{'Phone'}                                  = 'تلفن';
    $Lang->{'Server'}                                 = 'سرور';
    $Lang->{'Backup Device'}                          = 'وسایل پشتیبان‌گیری';
    $Lang->{'Beamer'}                                 = 'پرتو افکن';
    $Lang->{'Camera'}                                 = 'دوربین';
    $Lang->{'Docking Station'}                        = 'ایستگاه اتصال';
    $Lang->{'Keybord'}                                = 'صفحه کلید';
    $Lang->{'Modem'}                                  = 'مودم';
    $Lang->{'Monitor'}                                = 'صفحه نمایش';
    $Lang->{'Mouse'}                                  = 'ماوس';
    $Lang->{'Other'}                                  = 'غیره';
    $Lang->{'PCMCIA Card'}                            = 'کارت PCMCIA';
    $Lang->{'Printer'}                                = 'چاپگر';
    $Lang->{'Router'}                                 = 'مسیریاب';
    $Lang->{'Scanner'}                                = 'اسکنر';
    $Lang->{'Security Device'}                        = 'وسایل امنیتی';
    $Lang->{'Switch'}                                 = 'سویچ';
    $Lang->{'USB Device'}                             = 'تجهیزات USB';
    $Lang->{'WLAN Access Point'}                      = 'نقاط دسترسی WLAN';
    $Lang->{'GSM'}                                    = 'GSM';
    $Lang->{'LAN'}                                    = 'LAN';
    $Lang->{'Other'}                                  = 'غیره';
    $Lang->{'Telco'}                                  = 'Telco';
    $Lang->{'WLAN'}                                   = 'WLAN';
    $Lang->{'Admin Tool'}                             = 'ابزار مدیریتی';
    $Lang->{'Client Application'}                     = 'برنامه‌های کلاینت';
    $Lang->{'Client OS'}                              = 'سیستم عامل کلاینت';
    $Lang->{'Embedded'}                               = 'داخلی';
    $Lang->{'Middleware'}                             = 'میان افزار';
    $Lang->{'Other'}                                  = 'غیره';
    $Lang->{'Server Application'}                     = 'نرم افزار سرور';
    $Lang->{'Server OS'}                              = 'سیستم عامل سرور';
    $Lang->{'User Tool'}                              = 'ابزار کاربر';
    $Lang->{'Concurrent Users'}                       = 'کاربران موازی';
    $Lang->{'Demo'}                                   = 'نسخه نمایشی';
    $Lang->{'Developer Licence'}                      = 'اجازه‌نامه توسعه دهنده';
    $Lang->{'Enterprise Licence'}                     = 'اجازه‌نامه سازمانی';
    $Lang->{'Freeware'}                               = 'نرم افزار مجانی';
    $Lang->{'Open Source'}                            = 'کد باز';
    $Lang->{'Per Node'}                               = 'به ازای کامپیوتر';
    $Lang->{'Per Processor'}                          = 'به ازای پردازشگر';
    $Lang->{'Per Server'}                             = 'به ازای سرور';
    $Lang->{'Per User'}                               = 'به ازای کاربر';
    $Lang->{'Single Licence'}                         = 'اجازه‌نامه تکی';
    $Lang->{'Time Restricted'}                        = 'دارای محدوده زمانی';
    $Lang->{'Unlimited'}                              = 'نامحدود';
    $Lang->{'Volume Licence'}                         = 'اجازه‌نامه حجمی';
    $Lang->{'Model'}                                  = 'مدل';
    $Lang->{'Serial Number'}                          = 'شماره سریال';
    $Lang->{'Operating System'}                       = 'سیستم عامل';
    $Lang->{'CPU'}                                    = 'سی‌پی‌یو';
    $Lang->{'Ram'}                                    = 'رم';
    $Lang->{'Hard Disk'}                              = 'هارد دیسک';
    $Lang->{'Hard Disk::Capacity'}                    = 'هارد دیسک::ظرفیت';
    $Lang->{'Capacity'}                               = 'ظرفیت';
    $Lang->{'FQDN'}                                   = 'FQDN';
    $Lang->{'Network Adapter'}                        = 'کارت شبکه';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'کارت شبکه::IP از طریق DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'کارت شبکه::آدرس IP';
    $Lang->{'IP over DHCP'}                           = 'IP از طریق DHCP';
    $Lang->{'IP Address'}                             = 'آدرس IP';
    $Lang->{'Graphic Adapter'}                        = 'کارت گرافیک';
    $Lang->{'Other Equipment'}                        = 'تجهیزات متفرقه';
    $Lang->{'Warranty Expiration Date'}               = 'تاریخ انقضای ضمانت‌نامه';
    $Lang->{'Install Date'}                           = 'تاریخ نصب';
    $Lang->{'Network Address'}                        = 'آدرس شبکه';
    $Lang->{'Network Address::Subnet Mask'}           = 'آدرس شبکه::Subnet Mask';
    $Lang->{'Network Address::Gateway'}               = 'آدرس شبکه::Gateway';
    $Lang->{'Subnet Mask'}                            = 'Subnet Mask';
    $Lang->{'Gateway'}                                = 'Gateway';
    $Lang->{'Licence Type'}                           = 'نوع اجازه‌نامه';
    $Lang->{'Licence Key'}                            = 'کلید اجازه‌نامه';
    $Lang->{'Licence Key::Quantity'}                  = 'کلید اجازه‌نامه::تعداد';
    $Lang->{'Licence Key::Expiration Date'}           = 'کلید اجازه‌نامه::تاریخ انقضا';
    $Lang->{'Quantity'}                               = 'تعداد';
    $Lang->{'Expiration Date'}                        = 'تاریخ انقضا';
    $Lang->{'Media'}                                  = 'رسانه';
    $Lang->{'Maximum number of one element'}          = 'حداکثر شماره یک عنصر';
    $Lang->{'Identifier'}                             = 'معرف';
    $Lang->{'Phone 1'}                                = '';
    $Lang->{'Phone 2'}                                = '';
    $Lang->{'Address'}                                = 'نشانی';
    $Lang->{'Building'}                               = 'ساختمان';
    $Lang->{'Floor'}                                  = 'طبقه';
    $Lang->{'IT Facility'}                            = 'تسهیلات IT';
    $Lang->{'Office'}                                 = 'اداره';
    $Lang->{'Outlet'}                                 = 'پریز';
    $Lang->{'Rack'}                                   = 'قفسه';
    $Lang->{'Room'}                                   = 'اتاق';
    $Lang->{'Workplace'}                              = 'محل کار';
    $Lang->{'CIHistory::ConfigItemCreate'}              = '';
    $Lang->{'CIHistory::VersionCreate'}                 = '';
    $Lang->{'CIHistory::DeploymentStateUpdate'}         = '';
    $Lang->{'CIHistory::IncidentStateUpdate'}           = '';
    $Lang->{'CIHistory::ConfigItemDelete'}              = '';
    $Lang->{'CIHistory::LinkAdd'}                       = '';
    $Lang->{'CIHistory::LinkDelete'}                    = '';
    $Lang->{'CIHistory::DefinitionUpdate'}              = '';
    $Lang->{'CIHistory::NameUpdate'}                    = '';
    $Lang->{'CIHistory::ValueUpdate'}                   = '';
    $Lang->{'CIHistory::VersionDelete'}                 = '';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Lang->{'Module to genetare ITSM config item statistics.'} = '';
    $Lang->{'Object backend module registration for the import/export module.'} = '';
    $Lang->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Lang->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Lang->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Lang->{'Module to check the group responsible for a class.'} = '';
    $Lang->{'Module to check the group responsible for a configuration item.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Lang->{'Configuration item search backend router of the agent interface.'} = '';

    return 1;
}

1;
