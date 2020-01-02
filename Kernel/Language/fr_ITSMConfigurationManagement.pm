# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::fr_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestion des éléments de configuration';
    $Self->{Translation}->{'Change class definition'} = 'Modifier la définition d\'une classe';
    $Self->{Translation}->{'Config Item Class'} = 'Classe d\'élément de configuration';
    $Self->{Translation}->{'Definition'} = 'Définition';
    $Self->{Translation}->{'Change'} = 'Modifier';

    # Template: AgentDashboardITSMConfigItemGeneric
    $Self->{Translation}->{'Incident State'} = 'État d\'incident';
    $Self->{Translation}->{'Deployment State'} = 'État de déploiement';
    $Self->{Translation}->{'Class'} = 'Classe';
    $Self->{Translation}->{'Deployment State Type'} = 'Type d\'état du déploiement';
    $Self->{Translation}->{'Current Incident State'} = 'État actuel de l\'incident';
    $Self->{Translation}->{'Current Incident State Type'} = 'Type d\'état actuel de l\'incident';
    $Self->{Translation}->{'Last changed'} = 'Dernières modifications';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Élément de configuration';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtres pour les classes';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Choisissez une classe pour créer un nouvel élément de configuration.';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = 'État du déploiement';
    $Self->{Translation}->{'Incident state'} = 'État de l\'incident';
    $Self->{Translation}->{'Link to another'} = 'Lier à un autre';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Numéro d\'élément de configuration invalide !';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Le numéro d\'un autre élément de configuration à lier.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Voulez-vous vraiment supprimer cet élément de configuration ?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Le nom de cet élément de configuration';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Le nom est déjà utilisé par l\'élément de configuration avec le numéro suivant : %s';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Historique de l\'élément de configuration %s';
    $Self->{Translation}->{'History Content'} = 'Contenu de l\'historique';
    $Self->{Translation}->{'Createtime'} = 'Date de création';
    $Self->{Translation}->{'Zoom view'} = 'Vue détaillée';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Réglages de contexte';
    $Self->{Translation}->{'Config Items per page'} = 'Éléments de configuration par page';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Run Search'} = 'Lancer la recherche';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Chercher également dans les versions précédentes ?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Élément de configuration';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informations de l\'élément de configuration';
    $Self->{Translation}->{'Current Deployment State'} = 'État actuel de déploiement';
    $Self->{Translation}->{'Last changed by'} = 'Dernières modifications effectuées par';
    $Self->{Translation}->{'Show one version'} = 'Afficher une seule version';
    $Self->{Translation}->{'Show all versions'} = 'Afficher toutes les versions';
    $Self->{Translation}->{'Version Incident State'} = 'État de la version de l\'incident';
    $Self->{Translation}->{'Version Deployment State'} = 'État de la version du déploiement';
    $Self->{Translation}->{'Version Number'} = 'Numéro de version';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Détails de la version de l\'élément de configuration';
    $Self->{Translation}->{'Property'} = 'Propriété';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'No access to Class is given!'} = 'Aucun accès à la classe n\'a été donné !';
    $Self->{Translation}->{'Overview: ITSM ConfigItem'} = 'Vue d\'ensemble: éléments de configuration';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemBulk.pm
    $Self->{Translation}->{'No ConfigItemID is given!'} = 'Aucun ID d\'élément de configuration n\'a été donné !';
    $Self->{Translation}->{'You need at least one selected Configuration Item!'} = 'Vous devez sélectionner au moins un élément de configuration !';
    $Self->{Translation}->{'You don\'t have write access to this configuration item: %s.'} =
        'Vous n\'avez pas le droit de modifier l\'élément de configuration %s.';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemDelete.pm
    $Self->{Translation}->{'Config item "%s" not found in database!'} = 'L\'élément de configuration "%s" n\'a pas été trouvé dans la base de données !';
    $Self->{Translation}->{'Was not able to delete the configitem ID %s!'} = 'Impossible de supprimer l\'ID de l\'élément de configuration %s !';
    $Self->{Translation}->{'No version found for ConfigItemID %s!'} = 'Aucune version trouvée pour l\'ID de l\'élément de configuration %s !';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemEdit.pm
    $Self->{Translation}->{'No ConfigItemID, DuplicateID or ClassID is given!'} = 'Aucun ID d\'élément de configuration, de duplication ou de classe n\'a été donné !';
    $Self->{Translation}->{'No access is given!'} = 'Aucun accès n\'a été donné !';
    $Self->{Translation}->{'No definition was defined for class %s!'} = 'Aucune définition définie pour la classe %s !';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'Can\'t show history, no ConfigItemID is given!'} = 'Impossible d\'afficher l\'historique, aucun ID d\'élément de configuration n\'a été donné !';
    $Self->{Translation}->{'Can\'t show history, no access rights given!'} = 'Impossible d\'afficher l\'historique, aucun accès n\'a été donné !';
    $Self->{Translation}->{'New ConfigItem (ID=%s)'} = 'Nouvel élément de configuration (ID=%s)';
    $Self->{Translation}->{'New version (ID=%s)'} = 'Nouvelle version (ID=%s)';
    $Self->{Translation}->{'Deployment state updated (new=%s, old=%s)'} = 'État de déploiement mis à jour (nouveau=%s, ancien=%s)';
    $Self->{Translation}->{'Incident state updated (new=%s, old=%s)'} = 'État de l\'incident mis à jour (nouveau=%s, ancien=%s)';
    $Self->{Translation}->{'ConfigItem (ID=%s) deleted'} = 'Élément de configuration (ID=%s) supprimé';
    $Self->{Translation}->{'Link to %s (type=%s) added'} = 'Lier à %s (type=%s) ajouté';
    $Self->{Translation}->{'Link to %s (type=%s) deleted'} = 'Lier à %s (type=%s) supprimé';
    $Self->{Translation}->{'ConfigItem definition updated (ID=%s)'} = 'Définition de l\'élément de configuration mise à jour (ID=%s)';
    $Self->{Translation}->{'Name updated (new=%s, old=%s)'} = 'Nom mis à jour (nouveau=%s, ancien=%s)';
    $Self->{Translation}->{'Attribute %s updated from "%s" to "%s"'} = 'Attribue %s mis à jour de "%s" à "%s"';
    $Self->{Translation}->{'Version %s deleted'} = 'Version %s supprimée';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'No ConfigItemID or VersionID is given!'} = 'Aucun ID d\'élément de configuration ou de version n\'a été donné !';
    $Self->{Translation}->{'Can\'t show config item, no access rights given!'} = 'Impossible d\'afficher l\'élément de configuration, aucun accès n\'a été donné !';
    $Self->{Translation}->{'ConfigItemID %s not found in database!'} = 'L\'ID de l\'élément de configuration %s n\'a pas été trouvé dans la base de données !';
    $Self->{Translation}->{'VersionID %s not found in database!'} = 'L\'ID de version %s n\'a pas été trouvé dans la base de données !';
    $Self->{Translation}->{'ConfigItem'} = 'Élément de configuration';
    $Self->{Translation}->{'printed by %s at %s'} = 'Imprimé par %s à %s';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'Invalid ClassID!'} = 'ID de classe invalide !';
    $Self->{Translation}->{'No ClassID is given!'} = 'Aucun ID de classe n\'a été donné !';
    $Self->{Translation}->{'No access rights for this class given!'} = 'Aucuns droits d\'accès pour cette classe n\'a été donné !';
    $Self->{Translation}->{'No Result!'} = 'Aucuns résultats !';
    $Self->{Translation}->{'Config Item Search Results'} = 'Résultat de la recherche des éléments de configuration';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemZoom.pm
    $Self->{Translation}->{'Can\'t show item, no access rights for ConfigItem are given!'} =
        'Impossible d\'afficher l\'élément, aucuns droits d\'accès pour cet élément de configuration n\'a été donné !';
    $Self->{Translation}->{'operational'} = '';
    $Self->{Translation}->{'warning'} = '';
    $Self->{Translation}->{'incident'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = 'L\'état de déploiement de cet élément de configuration';
    $Self->{Translation}->{'The incident state of this config item'} = 'L\'état d\'incident de cet élément de configuration';

    # Perl Module: Kernel/Output/HTML/Dashboard/ITSMConfigItemGeneric.pm
    $Self->{Translation}->{'Shown config items'} = 'Afficher les éléments de configuration';

    # Perl Module: Kernel/Output/HTML/ITSMConfigItem/LayoutDate.pm
    $Self->{Translation}->{'Between'} = 'Entre';

    # Perl Module: Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm
    $Self->{Translation}->{'Maximum number of one element'} = 'Quantité maximale pour un élément';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Les champs vides indiquent que les valeurs par défauts sont gardées';
    $Self->{Translation}->{'Skipped'} = 'Passé(s)';

    # Perl Module: var/packagesetup/ITSMConfigurationManagement.pm
    $Self->{Translation}->{'Model'} = 'Modèle';
    $Self->{Translation}->{'Customer Company'} = '';
    $Self->{Translation}->{'Serial Number'} = 'Numéro de série';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Hard Disk'} = 'Disque dur';
    $Self->{Translation}->{'Capacity'} = 'Capacité';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptateur réseau';
    $Self->{Translation}->{'IP over DHCP'} = 'IP sur DHCP';
    $Self->{Translation}->{'IP Address'} = 'Adresse IP';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adaptateur graphique';
    $Self->{Translation}->{'Other Equipment'} = 'Autre équipement';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Date d\'expiration de la garantie';
    $Self->{Translation}->{'Install Date'} = 'Date d\'installation';
    $Self->{Translation}->{'Phone 1'} = 'Téléphone 1';
    $Self->{Translation}->{'Phone 2'} = 'Téléphone 2';
    $Self->{Translation}->{'E-Mail'} = 'Adresse e-mail';
    $Self->{Translation}->{'Network Address'} = 'Adresse réseau';
    $Self->{Translation}->{'Subnet Mask'} = 'Masque du sous réseau';
    $Self->{Translation}->{'Gateway'} = 'Passerelle';
    $Self->{Translation}->{'Licence Type'} = 'Type de la licence';
    $Self->{Translation}->{'Licence Key'} = 'Clé de la licence';
    $Self->{Translation}->{'Quantity'} = 'Quantité';
    $Self->{Translation}->{'Expiration Date'} = 'Date d\'expiration';
    $Self->{Translation}->{'Media'} = 'Média';

    # Database XML Definition: ITSMConfigurationManagement.sopm
    $Self->{Translation}->{'Computer'} = 'Ordinateur';
    $Self->{Translation}->{'Hardware'} = 'Matériel';
    $Self->{Translation}->{'Network'} = 'Réseau';
    $Self->{Translation}->{'Software'} = 'Logiciel';
    $Self->{Translation}->{'Expired'} = 'Expiré';
    $Self->{Translation}->{'Maintenance'} = 'Maintenance';
    $Self->{Translation}->{'Pilot'} = 'Pilote';
    $Self->{Translation}->{'Planned'} = 'Planifié';
    $Self->{Translation}->{'Repair'} = 'En réparation';
    $Self->{Translation}->{'Retired'} = 'Retiré';
    $Self->{Translation}->{'Review'} = 'Revue';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'Laptop'} = 'Ordinateur portable';
    $Self->{Translation}->{'Desktop'} = 'Ordinateur';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Server'} = 'Serveur';
    $Self->{Translation}->{'Other'} = 'Autre';
    $Self->{Translation}->{'Monitor'} = 'Moniteur';
    $Self->{Translation}->{'Printer'} = 'Imprimante';
    $Self->{Translation}->{'Switch'} = 'Commutateur';
    $Self->{Translation}->{'Router'} = 'Routeur';
    $Self->{Translation}->{'WLAN Access Point'} = 'Point d\'access WLAN';
    $Self->{Translation}->{'Security Device'} = 'Périphérique de sécurité';
    $Self->{Translation}->{'Backup Device'} = 'Élément de sauvegarde';
    $Self->{Translation}->{'Mouse'} = 'Souris';
    $Self->{Translation}->{'Keyboard'} = 'Clavier';
    $Self->{Translation}->{'Camera'} = 'Caméra';
    $Self->{Translation}->{'Beamer'} = 'Vidéoprojecteur';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'PCMCIA Card'} = 'Carte PCMCIA';
    $Self->{Translation}->{'USB Device'} = 'Périphérique USB';
    $Self->{Translation}->{'Docking Station'} = 'Station d\'accueil';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Building'} = 'Bâtiment';
    $Self->{Translation}->{'Office'} = 'Bureau';
    $Self->{Translation}->{'Floor'} = 'Étage';
    $Self->{Translation}->{'Room'} = 'Pièce';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Workplace'} = 'Emplacement';
    $Self->{Translation}->{'Outlet'} = 'Prise';
    $Self->{Translation}->{'IT Facility'} = 'Département "Technologies de l\'Information"';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Client Application'} = 'Application cliente';
    $Self->{Translation}->{'Middleware'} = 'Intergiciel (middleware)';
    $Self->{Translation}->{'Server Application'} = 'Application serveur';
    $Self->{Translation}->{'Client OS'} = 'OS client';
    $Self->{Translation}->{'Server OS'} = 'OS serveur';
    $Self->{Translation}->{'Admin Tool'} = 'Outil d\'administration';
    $Self->{Translation}->{'User Tool'} = 'Outil utilisateur';
    $Self->{Translation}->{'Embedded'} = 'Embarqué';
    $Self->{Translation}->{'Single Licence'} = 'License unique';
    $Self->{Translation}->{'Per User'} = 'Par utilisateur';
    $Self->{Translation}->{'Per Processor'} = 'Par processeur';
    $Self->{Translation}->{'Per Server'} = 'Par serveur';
    $Self->{Translation}->{'Per Node'} = 'Par noeud';
    $Self->{Translation}->{'Volume Licence'} = 'License par volume';
    $Self->{Translation}->{'Enterprise Licence'} = 'License entreprise';
    $Self->{Translation}->{'Developer Licence'} = 'License développeur';
    $Self->{Translation}->{'Demo'} = 'Démo';
    $Self->{Translation}->{'Time Restricted'} = 'Limitée dans le temps';
    $Self->{Translation}->{'Freeware'} = 'Logiciel gratuit (freeware)';
    $Self->{Translation}->{'Open Source'} = 'Open-source';
    $Self->{Translation}->{'Unlimited'} = 'Illimité';

    # JS File: ITSM.Agent.ConfigItem.Zoom
    $Self->{Translation}->{'Ok'} = 'Ok';

    # SysConfig
    $Self->{Translation}->{'Assigned CIs'} = 'Éléments de configuration attribués';
    $Self->{Translation}->{'CIs assigned to customer company'} = 'Éléments de configuration attribués à un client';
    $Self->{Translation}->{'CIs assigned to customer user'} = 'Éléments de configuration attribués à un utilisateur client';
    $Self->{Translation}->{'CMDB Settings'} = 'Paramètres de la CMDB (base de données des éléments de configuration)';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Éléments de configuration';
    $Self->{Translation}->{'Config item add.'} = 'Élément de configuration ajouté';
    $Self->{Translation}->{'Config item edit.'} = 'Éléments de configuration édité';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = 'Historique de l\'élément de configuration.';
    $Self->{Translation}->{'Config item print.'} = 'Impression de l\'élément de configuration.';
    $Self->{Translation}->{'Config item zoom.'} = 'Vue détaillée de l\'élément de configuration.';
    $Self->{Translation}->{'ConfigItemNumber'} = 'Numéro de l\'élément de configuration';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limite d\'éléments de configuration';
    $Self->{Translation}->{'Configuration Item limit per page.'} = 'Limite d\'éléments de configuration par page.';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Base de données des éléments de configuration.';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Créer et gérer les définitions des éléments de configuration.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item widget depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting AgentCustomerInformationCenter::Backend###0060-CIC-ITSMConfigItemCustomerCompany (key DefaultColumns).'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view for all CI classes. If there is no entry, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Delete Configuration Item'} = 'Supprimer un élément de configuration';
    $Self->{Translation}->{'Deployment State Color'} = 'Couleur de l\'état de déploiement';
    $Self->{Translation}->{'Duplicate'} = 'Dupliquer';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = 'Vue d\'ensemble de l\'élément de configuration';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Overview.'} = 'Vue d\'ensemble.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the customer company config item overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Paramètres pour l\'exemple des permissions de groupes des attributs du catalogue général.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '';
    $Self->{Translation}->{'Permission Group'} = '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = 'Rechercher les éléments de configuration.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = 'classe';
    $Self->{Translation}->{'global'} = 'global';
    $Self->{Translation}->{'postproductive'} = 'post-productif';
    $Self->{Translation}->{'preproductive'} = 'pré-productif';
    $Self->{Translation}->{'productive'} = 'productif';


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
