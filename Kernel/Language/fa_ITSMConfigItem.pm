# --
# Kernel/Language/fa_ITSMConfigItem.pm - the persian (farsi) translation of fa_ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# Copyright (C) 2003-2009 Afshar Mohebbi <afshar.mohebbi at gmail.com>
# --
# $Id: fa_ITSMConfigItem.pm,v 1.1.2.2 2009-07-20 10:41:40 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1.2.2 $) [1];

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

    return 1;
}

1;
