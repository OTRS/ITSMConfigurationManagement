# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::id_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Pengelolaan item konfigurasi';
    $Self->{Translation}->{'Change class definition'} = 'ubah definisi kelas';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definisi';
    $Self->{Translation}->{'Change'} = 'Ubah';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'Kondisi insiden';
    $Self->{Translation}->{'Deployment State'} = 'Status penyebaran';
    $Self->{Translation}->{'Class'} = 'Kelas';
    $Self->{Translation}->{'Deployment State Type'} = 'Tipe status penyebaran';
    $Self->{Translation}->{'Current Incident State'} = 'Kondisi insiden saat ini';
    $Self->{Translation}->{'Current Incident State Type'} = 'Tipe Status insiden saat ini';
    $Self->{Translation}->{'Last changed'} = 'Terakhir diubah';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Item konfigurasi';
    $Self->{Translation}->{'Filter for Classes'} = 'Saringan untuk kelas-kelas';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Pilih satu kelas dari datar untuk membuat sebuah item konfigurasi baru';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'Tindakan masal ItemKonfigurasi ITSM';
    $Self->{Translation}->{'Deployment state'} = 'Status penyebaran';
    $Self->{Translation}->{'Incident state'} = 'Status insiden';
    $Self->{Translation}->{'Link to another'} = 'Tautan untuk ke lainnya';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Nomor item konfigurasi tidak sah';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Jumlah item konfigurasi lainnya yang akan di hubungkan';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Nama item konfigurasi ini';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Nama ini telah di gunakan oleh ItemKonfigurasi dengan nomor(nomor-nomor) berikut: %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';
    $Self->{Translation}->{'History Content'} = 'Isi sejarah';
    $Self->{Translation}->{'Createtime'} = 'BuatWaktu';
    $Self->{Translation}->{'Zoom view'} = 'Pandangan dekat';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Setting Konteks';
    $Self->{Translation}->{'Config Items per page'} = 'Item konfigurasi per halaman';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Mulai Pencarian';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Cari di versi sebelumnya juga ?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Item Konfigurasi';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informasi item konfigurasi';
    $Self->{Translation}->{'Current Deployment State'} = 'Status penyebaraan saat ini';
    $Self->{Translation}->{'Last changed by'} = 'Terakhir dirubah oleh';
    $Self->{Translation}->{'Show one version'} = 'Tunjukan satu versi';
    $Self->{Translation}->{'Show all versions'} = 'Tunjukan semua versi';
    $Self->{Translation}->{'Version Incident State'} = 'Versi status insiden';
    $Self->{Translation}->{'Version Deployment State'} = 'Versi status penyebaran';
    $Self->{Translation}->{'Version Number'} = 'Nomor versi';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Rincian versi item konfigurasi';
    $Self->{Translation}->{'Property'} = 'Milik';

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
    $Self->{Translation}->{'ConfigItem'} = 'ItemKonfigurasi';
    $Self->{Translation}->{'printed by %s at %s'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = '';
    $Self->{Translation}->{'No ClassID is given!'} = '';
    $Self->{Translation}->{'No access rights for this class given!'} = '';
    $Self->{Translation}->{'No Result!'} = 'Tidak ada hasil!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Konfigurasi pencarian nilai';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        '';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Status penyebaran item konfigurasi ini';
    $Self->{Translation}->{'The incident state of this config item'} = 'Status insiden item konfigurasi ini';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = '';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Diantara';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Jumlah maksimum dari 1 elemen';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Bidang kosong mengindikasikan bahwa nilai saat ini disimpan';
    $Self->{Translation}->{'Skipped'} = 'Dilewati';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Nomor seri';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'Ram';
    $Self->{Translation}->{'Hard Disk'} = 'Hard Disk';
    $Self->{Translation}->{'Capacity'} = 'Kapasitas';
    $Self->{Translation}->{'Network Adapter'} = 'Adapter Jaringan';
    $Self->{Translation}->{'IP over DHCP'} = 'IP lebih dari DHCP';
    $Self->{Translation}->{'IP Address'} = 'Alamat IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adapter grafis';
    $Self->{Translation}->{'Other Equipment'} = 'Peralatan lainnya';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Tanggal kadaluarsa garansi';
    $Self->{Translation}->{'Install Date'} = 'Tanggal instalasi';
    $Self->{Translation}->{'Phone 1'} = 'Telepon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telepon 2';
    $Self->{Translation}->{'E-Mail'} = '';
    $Self->{Translation}->{'Network Address'} = 'Alamat Jaringan';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnet Mask';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Licence Type'} = 'Tipe Lisensi';
    $Self->{Translation}->{'Licence Key'} = 'Kunci lisensi';
    $Self->{Translation}->{'Quantity'} = 'Kuantitas';
    $Self->{Translation}->{'Expiration Date'} = 'Tanggal Kadaluarsa';
    $Self->{Translation}->{'Media'} = 'Media';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Expired'} = 'Telah kadaluarsa';
    $Self->{Translation}->{'Maintenance'} = 'Pemeliharaan';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Telah direncanakan';
    $Self->{Translation}->{'Repair'} = 'Perbaiki';
    $Self->{Translation}->{'Retired'} = 'Pensiun';
    $Self->{Translation}->{'Review'} = 'Ulasan';
    $Self->{Translation}->{'Test/QA'} = 'Uji/QA';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Other'} = 'Lain-lain';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Printer'} = 'Pencetak';
    $Self->{Translation}->{'Switch'} = 'Tukar';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'WLAN Access Point'} = 'Titik akses WLAN';
    $Self->{Translation}->{'Security Device'} = 'Perangkat keamanan';
    $Self->{Translation}->{'Backup Device'} = 'Perangkat Backup';
    $Self->{Translation}->{'Mouse'} = 'Mouse';
    $Self->{Translation}->{'Keyboard'} = 'Keyboard';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'Kartu PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Perangkat USB';
    $Self->{Translation}->{'Docking Station'} = 'Stasiun dok';
    $Self->{Translation}->{'Scanner'} = 'Pemindai';
    $Self->{Translation}->{'Building'} = 'Membangun';
    $Self->{Translation}->{'Office'} = 'Kantor';
    $Self->{Translation}->{'Floor'} = 'Lantai';
    $Self->{Translation}->{'Room'} = 'Ruangan';
    $Self->{Translation}->{'Rack'} = 'Rak';
    $Self->{Translation}->{'Workplace'} = 'Tempat kerja';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'IT Facility'} = 'Fasilitas IT';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Aplikasi pelanggan';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Server Application'} = 'Aplikasi server';
    $Self->{Translation}->{'Client OS'} = 'OS pelanggan';
    $Self->{Translation}->{'Server OS'} = 'OS Server';
    $Self->{Translation}->{'Admin Tool'} = 'Peralatan Admin';
    $Self->{Translation}->{'User Tool'} = 'Peralatan pengguna';
    $Self->{Translation}->{'Embedded'} = 'Tertanam';
    $Self->{Translation}->{'Single Licence'} = 'Lisensi tunggal';
    $Self->{Translation}->{'Per User'} = 'Per Pengguna';
    $Self->{Translation}->{'Per Processor'} = 'Per Prosesor';
    $Self->{Translation}->{'Per Server'} = 'Per server';
    $Self->{Translation}->{'Per Node'} = 'Per Node';
    $Self->{Translation}->{'Volume Licence'} = 'Lisensi Jilid';
    $Self->{Translation}->{'Enterprise Licence'} = 'Lisensi perusahaan';
    $Self->{Translation}->{'Developer Licence'} = 'Lisensi pengembang';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Time Restricted'} = 'Dibatasi waktu';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'Open Source'} = 'Sumber Terbuka';
    $Self->{Translation}->{'Unlimited'} = 'Tidak terbatas';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = '';
    $Self->{Translation}->{'CIs assigned to customer company'} = '';
    $Self->{Translation}->{'CIs assigned to customer user'} = '';
    $Self->{Translation}->{'CMDB Settings'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Periksa hanya nama unik saja di dalam kelas(\'kelas\') itemkonfigurasi yang sama atau secara global (\'global), yang berarti setiap ItemKonfigurasi yang ada akan diperhitungkan ketika mencari duplikat';
    $Self->{Translation}->{'Config Items'} = 'item konfigurasi';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Modul peristiwa item konfigurasi yang mengaktifkan logging ke riwayat pada antarmuka agen';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Batas item konfigurasi';
    $Self->{Translation}->{'Configuration Item limit per page.'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Router pencarian backend item konfigurasi pada antarmuka agen';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Buat dan atur definisi - definisi untuk item konfigurasi';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Definisikan izin yang di butuhkan untuk menciptakan item konfigurasi ITSM dengan menggunakan antarmuka umum.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Definisikan izin yang di butuhkan untuk mendapatkan item konfigurasi ITSM dengan menggunakan antarmuka umum.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Definisikan izin yang di butuhkan untuk mencari item konfigurasi ITSM dengan menggunakan antarmuka umum.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Definisikan izin yang di butuhkan untuk memperbarui item konfigurasi ITSM dengan menggunakan antarmuka umum.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Definisikan modul gambaran untuk menunjukan tampilan kecil dari sebuah daftar item konfigurasi';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Definisikan ekspresi regular secara individual untuk setiap kelas ItemKonfigurasi untuk memeriksa nama ItemKonfigurasi untuk menunjukan pesan error yang sesuai';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definisikan subobjek default dari kelas \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Definisikan jumlah baris untuk pengubah definisiCI pada antarmuka Admin';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Definisikan batas pencarian untuk layar AgentITSMConfigItem ';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Definisikan batas pencarian untuk Layar AgentITSMConfigItemSearch ';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Definisikan kolom yang di tunjukan pada gambaran item konfigurasi. Pilihan ini tidak mempengaruhi posisi kolom. Catatan: kolom kelas selalu tersedia jika saringan \'Semua\' dipilih.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Definisikan kolom yang ditunjukan didalam pencarian item konfigurasi. Pilihan ini tidak mempengaruhi posisi kolom';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Definisikan kolom yang ditunjukan oleh CI di dalam gambaran item konfigurasi tergantung pada kelas CI. Setiap entri harus diawali dengan nama kelas dan dua tanda titik dua (contohnya komputer::). Ada beberapa CI-Atribut yang umum pada semua CI (Contoh untuk kelas Komputer: Komputer::Nama, Komputer::CurDeplState, Komputer::Waktupembuatan). Untuk menunjukan CI-Atribut secara individual seperti yang didefinisikan di dalam CI-Definisi, Skema berikut ini harus di gunakan (Contoh untuk kelas Komputer): Komputer::HardDisk::1, komputer::HardDisk::1::kapasitas::1, komputer::HardDisk::2, Komputer::HardDisk::2::Kapasitas::1. Jika tidak ada entri untuk sebuah kelas CI, Maka kolom default yang akan ditunjukan sesuai dengan yang di tentukan pada pengaturanITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Mendefinisikan kolom yang ditampilkan dari CI dalam pencarian config barang tergantung pada kelas CI. Setiap entri harus diawali dengan nama kelas dan titik dua ganda (i.e. Computer::). Ada beberapa CI-Atribut yang umum untuk semua CI (Contoh untuk Komputer kelas: Komputer :: Nama, Komputer :: CurDeplState, Komputer :: CreateTime). Untuk menunjukkan individu CI-Atribut sebagaimana didefinisikan dalam CI-Definition, skema berikut harus digunakan (misalnya untuk Komputer kelas):  Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Jika tidak ada entri untuk kelas CI, maka kolom standar ditampilkan sebagaimana didefinisikan dalam pengaturan ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Mendefinisikan kolom yang ditampilkan dari CI di link tabel tampilan yang kompleks, tergantung pada kelas CI. Setiap entri harus diawali dengan nama kelas dan titik dua ganda (i.e. Computer::). Ada beberapa CI-Atribut yang umum untuk semua CI (Contoh untuk Komputer kelas: Komputer :: Nama, Komputer :: CurDeplState, Komputer :: CreateTime). Untuk menunjukkan individu CI-Atribut sebagaimana didefinisikan dalam CI-Definition, skema berikut harus digunakan (misalnya untuk Komputer kelas):  Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Jika tidak ada entri untuk kelas CI, maka kolom standar ditampilkan sebagaimana didefinisikan dalam pengaturan ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Duplikat';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Memungkinkan fitur item konfigurasi tindakan massal untuk agen frontend untuk bekerja pada lebih dari satu item konfigurasi pada suatu waktu.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Memungkinkan fitur tindakan massal item konfigurasi hanya untuk kelompok terdaftar.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Mengaktifkan / menonaktifkan fungsi untuk memeriksa ConfigItems untuk nama yang unik. Sebelum mengaktifkan opsi ini Anda harus memeriksa sistem anda untuk produk-config yang sudah ada dengan nama duplikat. Anda dapat melakukan ini dengan script bin/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modul untuk memeriksa kelompok yang bertanggung jawab untuk kelas.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Modul untuk memeriksa kelompok yang bertanggung jawab untuk item konfigurasi.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modul untuk menghasilkan statistik config barang ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objek backend pendaftaran modul untuk modul impor / ekspor.';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Parameter untuk warna state penyebaran dalam preferensi melihat antarmuka agen.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parameter untuk state penyebaran dalam preferensi melihat antarmuka agen.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter untuk grup conoth perizinan dari atribut katalog umum';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parameter untuk halaman (di mana item konfigurasi akan ditampilkan).';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan layar item konfigurasi ITSM di antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan konfigurasi ITSM layar pencarian item dalam antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan konfigurasi ITSM item layar zoom di antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan add ITSM layar item konfigurasi dalam antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan mengedit ITSM layar item konfigurasi dalam antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'izin yang diperlukan untuk menggunakan sejarah ITSM layar item konfigurasi dalam antarmuka agen.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Izin Yang diperlukan untuk review using Sejarah ITSM Layar Item Konfigurasi Antarmuka agen.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Memilih item konfigurasi modul generator nomor. "AutoIncrement" increment nomor item konfigurasi, SystemID, yang ConfigItemClassID dan meja yang digunakan. Formatnya adalah "SystemID.ConfigItemClassID.Counter", misalnya 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Atur status penyebaran di item konfigurasi layar terbesar dari antarmuka agen.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Atur status kejadian pada item konfigurasi layar terbesar dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Menunjukkan link dalam menu yang memungkinkan menghubungkan item konfigurasi dengan objek lain di config barang pandangan zoom dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Menunjukkan link dalam menu untuk mengakses sejarah item konfigurasi pada item konfigurasi gambaran dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan link dalam menu untuk mengakses sejarah item konfigurasi dalam tampilan zoom-nya dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Menunjukkan link dalam menu untuk menduplikasi item konfigurasi pada item konfigurasi gambaran dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan link dalam menu untuk menduplikasi item konfigurasi dalam tampilan zoom-nya dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan link dalam menu untuk mengedit item konfigurasi dalam tampilan zoom-nya dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan link dalam menu untuk mencetak item konfigurasi dalam tampilan zoom-nya dari antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Menunjukkan sejarah config item (urutan terbalik) di antarmuka agen.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Pengenal untuk item konfigurasi, misalnya ConfigItem #, MyConfig Item #. default adalah ConfigItem #.';
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
