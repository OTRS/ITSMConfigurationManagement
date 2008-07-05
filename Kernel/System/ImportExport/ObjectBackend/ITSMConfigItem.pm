# --
# Kernel/System/ImportExport/ObjectBackend/ITSMConfigItem.pm - import/export backend for ITSMConfigItem
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItem.pm,v 1.1.1.1 2008-07-05 16:24:13 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;
use Kernel::System::Time;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1.1.1 $) [1];

=head1 NAME

Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem - import/export backend for ITSMConfigItem

=head1 SYNOPSIS

All functions to import and export ITSM config items

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::DB;
    use Kernel::System::Log;
    use Kernel::System::Main;
    use Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem;

    my $ConfigObject = Kernel::Config->new();
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $BackendObject = Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem->new(
        ConfigObject       => $ConfigObject,
        LogObject          => $LogObject,
        DBObject           => $DBObject,
        MainObject         => $MainObject,
        ImportExportObject => $ImportExportObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject DBObject MainObject ImportExportObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    $Self->{TimeObject}           = Kernel::System::Time->new( %{$Self} );
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );

    return $Self;
}

=item ObjectAttributesGet()

get the object attributes of an object as array/hash reference

    my $Attributes = $ObjectBackend->ObjectAttributesGet(
        UserID => 1,
    );

=cut

sub ObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed object
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need UserID!' );
        return;
    }

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    ) || {};

    my $Attributes = [
        {
            Key   => 'ClassID',
            Name  => 'Class',
            Input => {
                Type         => 'Selection',
                Data         => $ClassList,
                Required     => 1,
                Translation  => 0,
                PossibleNone => 1,
            },
        },
        {
            Key   => 'CountMax',
            Name  => 'Maximum number of one element',
            Input => {
                Type         => 'Text',
                ValueDefault => '10',
                Required     => 1,
                Regex        => qr{ \A \d+ \z }xms,
                Translation  => 0,
                Size         => 5,
                MaxLength    => 5,
            },
        },
    ];

    return $Attributes;
}

=item MappingObjectAttributesGet()

get the mapping attributes of an object as array/hash reference

    my $Attributes = $ObjectBackend->MappingObjectAttributesGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub MappingObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Self->{ImportExportObject}->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return [] if !$ObjectData;
    return [] if ref $ObjectData ne 'HASH';
    return [] if !$ObjectData->{ClassID};

    # get definition
    my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
    );

    return [] if !$XMLDefinition;
    return [] if ref $XMLDefinition ne 'HASH';
    return [] if !$XMLDefinition->{DefinitionRef};
    return [] if ref $XMLDefinition->{DefinitionRef} ne 'ARRAY';

    my $ElementList = [
        {
            Key   => 'Number',
            Value => 'Number',
        },
        {
            Key   => 'Name',
            Value => 'Name',
        },
        {
            Key   => 'DeplState',
            Value => 'Deployment State',
        },
        {
            Key   => 'InciState',
            Value => 'Incident State',
        },
    ];

    # add xml elements
    $Self->_MappingObjectAttributesGet(
        XMLDefinition => $XMLDefinition->{DefinitionRef},
        ElementList   => $ElementList,
        CountMax      => $ObjectData->{CountMax} || 10,
    );

    my $Attributes = [
        {
            Key   => 'Key',
            Name  => 'Key',
            Input => {
                Type         => 'Selection',
                Data         => $ElementList,
                Required     => 1,
                Translation  => 0,
                PossibleNone => 1,
            },
        },
        {
            Key   => 'Identifier',
            Name  => 'Identifier',
            Input => {
                Type => 'Checkbox',
            },
        },
    ];

    return $Attributes;
}

=item _MappingObjectAttributesGet()

recusion function for MappingObjectAttributesGet()

    $ObjectBackend->_MappingObjectAttributesGet(
        XMLDefinition => $ArrayRef,
        ElementList   => $ArrayRef,
    );

=cut

sub _MappingObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    return if !$Param{CountMax};
    return if !$Param{XMLDefinition};
    return if !$Param{ElementList};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{ElementList} ne 'ARRAY';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        my $CountMax = $Item->{CountMax} > $Param{CountMax} ? $Param{CountMax} : $Item->{CountMax};

        COUNT:
        for my $Count ( 1 .. $CountMax ) {

            # create key string
            my $Key = $Item->{Key} . '::' . $Count;

            # add prefix to key
            if ( $Param{KeyPrefix} ) {
                $Key = $Param{KeyPrefix} . '::' . $Key;
            }

            # create value string
            my $Value = $Item->{Key};

            # add count if required
            if ( $CountMax > 1 || $Item->{Sub} ) {
                $Value .= '::' . $Count;
            }

            # add prefix to key
            if ( $Param{ValuePrefix} ) {
                $Value = $Param{ValuePrefix} . '::' . $Value;
            }

            # add row
            my %Row = (
                Key   => $Key,
                Value => $Value,
            );
            push @{ $Param{ElementList} }, \%Row;

            next COUNT if !$Item->{Sub};

            # start recursion
            $Self->_MappingObjectAttributesGet(
                XMLDefinition => $Item->{Sub},
                ElementList   => $Param{ElementList},
                KeyPrefix     => $Key,
                ValuePrefix   => $Value,
                CountMax      => $CountMax,
            );
        }
    }

    return 1;
}

=item SearchAttributesGet()

get the search object attributes of an object as array/hash reference

    my $AttributeList = $ObjectBackend->SearchAttributesGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub SearchAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Self->{ImportExportObject}->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return [] if !$ObjectData;
    return [] if ref $ObjectData ne 'HASH';
    return [] if !$ObjectData->{ClassID};

    # get definition
    my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
    );

    return [] if !$XMLDefinition;
    return [] if ref $XMLDefinition ne 'HASH';
    return [] if !$XMLDefinition->{DefinitionRef};
    return [] if ref $XMLDefinition->{DefinitionRef} ne 'ARRAY';

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    ) || {};

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::IncidentState',
    ) || {};

    my $AttributeList = [
        {
            Key   => 'Number',
            Name  => 'Number',
            Input => {
                Type      => 'Text',
                Size      => 80,
                MaxLength => 255,
            },
        },
        {
            Key   => 'Name',
            Name  => 'Name',
            Input => {
                Type      => 'Text',
                Size      => 80,
                MaxLength => 255,
            },
        },
        {
            Key   => 'DeplStateIDs',
            Name  => 'Deployment State',
            Input => {
                Type        => 'Selection',
                Data        => $DeplStateList,
                Translation => 1,
                Size        => 5,
                Multiple    => 1,
            },
        },
        {
            Key   => 'InciStateIDs',
            Name  => 'Incident State',
            Input => {
                Type        => 'Selection',
                Data        => $InciStateList,
                Translation => 1,
                Size        => 5,
                Multiple    => 1,
            },
        },
    ];

    # add xml attributes
    $Self->_SearchAttributesGet(
        XMLDefinition => $XMLDefinition->{DefinitionRef},
        AttributeList => $AttributeList,
    );

    return $AttributeList;
}

=item _SearchAttributesGet()

recusion function for MappingObjectAttributesGet()

    $ObjectBackend->_SearchAttributesGet(
        XMLDefinition => $ArrayRef,
        AttributeList => $ArrayRef,
    );

=cut

sub _SearchAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{AttributeList};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{AttributeList} ne 'ARRAY';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set prefix
        my $Key  = $Item->{Key};
        my $Name = $Item->{Name};

        if ( $Param{KeyPrefix} ) {
            $Key = $Param{KeyPrefix} . '::' . $Key;
        }

        if ( $Param{NamePrefix} ) {
            $Name = $Param{NamePrefix} . '::' . $Name;
        }

        # add attribute, if marked as searchable
        if ( $Item->{Searchable} ) {

            if ( $Item->{Input}->{Type} eq 'Text' || $Item->{Input}->{Type} eq 'TextArea' ) {

                my %Row = (
                    Key   => $Key,
                    Name  => $Name,
                    Input => {
                        Type        => 'Text',
                        Translation => $Item->{Input}->{Input}->{Translation},
                        Size        => $Item->{Input}->{Input}->{Size} || 60,
                        MaxLength   => $Item->{Input}->{Input}->{MaxLength},
                    },
                );

                push @{ $Param{AttributeList} }, \%Row;
            }
            elsif ( $Item->{Input}->{Type} eq 'GeneralCatalog' ) {

                # get general catalog list
                my $GeneralCatalogList = $Self->{GeneralCatalogObject}->ItemList(
                    Class => $Item->{Input}->{Class},
                ) || {};

                my %Row = (
                    Key   => $Key,
                    Name  => $Name,
                    Input => {
                        Type        => 'Selection',
                        Data        => $GeneralCatalogList,
                        Translation => $Item->{Input}->{Input}->{Translation},
                        Size        => 5,
                        Multiple    => 1,
                    },
                );

                push @{ $Param{AttributeList} }, \%Row;
            }
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_SearchAttributesGet(
            XMLDefinition => $Item->{Sub},
            AttributeList => $Param{AttributeList},
            KeyPrefix     => $Key,
            NamePrefix    => $Name,
        );
    }

    return 1;
}

=item ExportDataGet()

get export data as 2D-array-hash reference

    my $ExportData = $ObjectBackend->ExportDataGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub ExportDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Self->{ImportExportObject}->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check object data
    if ( !$ObjectData || ref $ObjectData ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No object data found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    return if !$ClassList || ref $ClassList ne 'HASH';

    # check the class id
    if ( !$ObjectData->{ClassID} || !$ClassList->{ $ObjectData->{ClassID} } ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No valid class id found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get the mapping list
    my $MappingList = $Self->{ImportExportObject}->MappingList(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check the mapping list
    if ( !$MappingList || ref $MappingList ne 'ARRAY' || !@{$MappingList} ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No valid mapping list found for the template id $Param{TemplateID}",
        );
        return;
    }

    # create the mapping object list
    my @MappingObjectList;
    for my $MappingID ( @{$MappingList} ) {

        # get mapping object data
        my $MappingObjectData = $Self->{ImportExportObject}->MappingObjectDataGet(
            MappingID => $MappingID,
            UserID    => $Param{UserID},
        );

        # check mapping object data
        if ( !$MappingObjectData || ref $MappingObjectData ne 'HASH' ) {

            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid mapping list found for the template id $Param{TemplateID}",
            );
            return;
        }

        push @MappingObjectList, $MappingObjectData;
    }

    # get search data
    my $SearchData = $Self->{ImportExportObject}->SearchDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return if !$SearchData || ref $SearchData ne 'HASH';

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # check deployment state list
    if ( !$DeplStateList || ref $DeplStateList ne 'HASH' ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::ConfigItem::DeploymentState!",
        );
        return;
    }

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # check incident state list
    if ( !$InciStateList || ref $InciStateList ne 'HASH' ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::Core::IncidentState!",
        );
        return;
    }

    # get current definition of this class
    my $DefinitionData = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
        UserID  => $Param{UserID},
    );

    my %SearchParams;

    # add number to the search params
    if ( $SearchData->{Number} ) {
        $SearchParams{Number} = $SearchData->{Number};
        delete $SearchData->{Number};
    }

    # add name to the search params
    if ( $SearchData->{Name} ) {
        $SearchParams{Name} = $SearchData->{Name};
        delete $SearchData->{Name};
    }

    # add deployment state to the search params
    if ( $SearchData->{DeplStateIDs} ) {
        my @DeplStateIDs = split '#####', $SearchData->{DeplStateIDs};
        $SearchParams{DeplStateIDs} = \@DeplStateIDs;
        delete $SearchData->{DeplStateIDs};
    }

    # add incident state to the search params
    if ( $SearchData->{InciStateIDs} ) {
        my @InciStateIDs = split '#####', $SearchData->{InciStateIDs};
        $SearchParams{InciStateIDs} = \@InciStateIDs;
        delete $SearchData->{InciStateIDs};
    }

    # add all XML data to the search params
    my @SearchParamsWhat;
    $Self->_ExportXMLSearchDataPrepare(
        XMLDefinition => $DefinitionData->{DefinitionRef},
        What          => \@SearchParamsWhat,
        SearchData    => $SearchData,
    );

    # add XML search params to the search hash
    if (@SearchParamsWhat) {
        $SearchParams{What} = \@SearchParamsWhat;
    }

    # search the config items
    my $ConfigItemList = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
        %SearchParams,
        ClassIDs              => [ $ObjectData->{ClassID} ],
        PreviousVersionSearch => 0,
        UserID                => $Param{UserID},
    );

    my @ExportData;
    CONFIGITEMID:
    for my $ConfigItemID ( @{$ConfigItemList} ) {

        # get last version
        my $VersionData = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        next CONFIGITEMID if !$VersionData;
        next CONFIGITEMID if ref $VersionData ne 'HASH';

        # translate xmldata to a 2d hash
        my %XMLData2D;
        $Self->_ExportXMLDataPrepare(
            XMLDefinition => $DefinitionData->{DefinitionRef},
            XMLData       => $VersionData->{XMLData}->[1]->{Version}->[1],
            XMLData2D     => \%XMLData2D,
        );

        # add data to the export data array
        my @Item;
        MAPPINGOBJECT:
        for my $MappingObject (@MappingObjectList) {

            # extract key
            my $Key = $MappingObject->{Key};

            # handle empty key
            if ( !$Key ) {
                push @Item, '';
                next MAPPINGOBJECT;
            }

            # handle config item number
            if ( $Key eq 'Number' ) {
                push @Item, $VersionData->{Number};
                next MAPPINGOBJECT;
            }

            # handle current config item name
            if ( $Key eq 'Name' ) {
                push @Item, $VersionData->{Name};
                next MAPPINGOBJECT;
            }

            # handel deployment state
            if ( $Key eq 'DeplState' ) {
                $VersionData->{DeplStateID} ||= 'DUMMY';
                push @Item, $DeplStateList->{ $VersionData->{DeplStateID} };
                next MAPPINGOBJECT;
            }

            # handel incident state
            if ( $Key eq 'InciState' ) {
                $VersionData->{InciStateID} ||= 'DUMMY';
                push @Item, $InciStateList->{ $VersionData->{InciStateID} };
                next MAPPINGOBJECT;
            }

            # handle all XML data elements
            push @Item, $XMLData2D{$Key};
        }

        push @ExportData, \@Item;
    }

    return \@ExportData;
}

=item _ExportXMLSearchDataPrepare()

recusion function to prepare the export XML search params

    $ObjectBackend->_ExportXMLSearchDataPrepare(
        XMLDefinition => $ArrayRef,
        What          => $ArrayRef,
        SearchData    => $HashRef,
    );

=cut

sub _ExportXMLSearchDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{What};
    return if !$Param{SearchData};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{What} ne 'ARRAY';
    return if ref $Param{SearchData} ne 'HASH';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create key
        my $Key = $Param{Prefix} ? $Param{Prefix} . '::' . $Item->{Key} : $Item->{Key};

        # prepare value
        my $Values = $Self->{ConfigItemObject}->XMLExportSearchValuePrepare(
            Item  => $Item,
            Value => $Param{SearchData}->{$Key},
        );

        if ($Values) {

            # create search key
            my $SearchKey = $Key;
            $SearchKey =~ s{ :: }{\'\}[%]\{\'}xmsg;

            # create search hash
            my $SearchHash = {
                '[1]{\'Version\'}[1]{\'' . $SearchKey . '\'}[%]{\'Content\'}' => $Values,
            };

            push @{ $Param{What} }, $SearchHash;
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_ExportXMLSearchDataPrepare(
            XMLDefinition => $Item->{Sub},
            What          => $Param{What},
            SearchData    => $Param{SearchData},
            Prefix        => $Key,
        );
    }

    return 1;
}

=item _ExportXMLDataPrepare()

recusion function to prepare the export XML data

    $ObjectBackend->_ExportXMLDataPrepare(
        XMLDefinition => $ArrayRef,
        XMLData       => $HashRef,
        XMLData2D     => $HashRef,
    );

=cut

sub _ExportXMLDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLData};
    return if !$Param{XMLData2D};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLData2D} ne 'HASH';

    if ( $Param{Prefix} ) {
        $Param{Prefix} .= '::';
    }
    $Param{Prefix} ||= '';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # stop loop, if no content was given
            last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};

            # create key
            my $Key = $Param{Prefix} . $Item->{Key} . '::' . $Counter;

            # prepare value
            $Param{XMLData2D}->{$Key} = $Self->{ConfigItemObject}->XMLExportValuePrepare(
                Item => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content} || '',
            );

            next COUNTER if !$Item->{Sub};

            # start recursion, if "Sub" was found
            $Self->_ExportXMLDataPrepare(
                XMLDefinition => $Item->{Sub},
                XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                XMLData2D     => $Param{XMLData2D},
                Prefix        => $Key,
            );
        }
    }

    return 1;
}

=item ImportDataSave()

import one row of the import data

    my $ConfigItemID = $ObjectBackend->ImportDataSave(
        TemplateID    => 123,
        ImportDataRow => $ArrayRef,
        UserID        => 1,
    );

=cut

sub ImportDataSave {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID ImportDataRow UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check import data row
    if ( ref $Param{ImportDataRow} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'ImportDataRow must be an array reference',
        );
        return;
    }

    # get object data
    my $ObjectData = $Self->{ImportExportObject}->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check object data
    if ( !$ObjectData || ref $ObjectData ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No object data found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    return if !$ClassList || ref $ClassList ne 'HASH';

    # check the class id
    if ( !$ObjectData->{ClassID} || !$ClassList->{ $ObjectData->{ClassID} } ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No valid class id found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get the mapping list
    my $MappingList = $Self->{ImportExportObject}->MappingList(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check the mapping list
    if ( !$MappingList || ref $MappingList ne 'ARRAY' || !@{$MappingList} ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "No valid mapping list found for the template id $Param{TemplateID}",
        );
        return;
    }

    # create the mapping object list
    my @MappingObjectList;
    my %Identifier;
    my $Counter = 0;
    MAPPINGID:
    for my $MappingID ( @{$MappingList} ) {

        # get mapping object data
        my $MappingObjectData = $Self->{ImportExportObject}->MappingObjectDataGet(
            MappingID => $MappingID,
            UserID    => $Param{UserID},
        );

        # check mapping object data
        if ( !$MappingObjectData || ref $MappingObjectData ne 'HASH' ) {

            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "No valid mapping list found for the template id $Param{TemplateID}",
            );
            return;
        }

        push @MappingObjectList, $MappingObjectData;

        next MAPPINGID if !$MappingObjectData->{Identifier};

        # check if identifier already exists
        if ( $Identifier{ $MappingObjectData->{Key} } ) {

            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Can't import this entity. "
                    . "'$MappingObjectData->{Key}' has been used multiple times as an identifier.!",
            );
            return;
        }

        # set identifier value
        $Identifier{ $MappingObjectData->{Key} } = $Param{ImportDataRow}->[$Counter];

        next MAPPINGID if $MappingObjectData->{Key} && $Param{ImportDataRow}->[$Counter];

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't import this entity. Identifier field is empty!",
        );
        return;
    }
    continue {
        $Counter++;
    }

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # check deployment state list
    if ( !$DeplStateList || ref $DeplStateList ne 'HASH' ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::ConfigItem::DeploymentState!",
        );
        return;
    }

    # reverse the deployment state list
    my %DeplStateListReverse = reverse %{$DeplStateList};

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # check incident state list
    if ( !$InciStateList || ref $InciStateList ne 'HASH' ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::Core::IncidentState!",
        );
        return;
    }

    # reverse the incident state list
    my %InciStateListReverse = reverse %{$InciStateList};

    # get current definition of this class
    my $DefinitionData = $Self->{ConfigItemObject}->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
        UserID  => $Param{UserID},
    );

    # check definition data
    if ( !$DefinitionData || ref $DefinitionData ne 'HASH' ) {

        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't get the definition of class id $ObjectData->{ClassID}!",
        );
        return;
    }

    # get config item ids (using the identifiers)
    my $ConfigItemID;
    if (%Identifier) {

        my %SearchParams;

        # add number to the search params
        if ( $Identifier{Number} ) {
            $SearchParams{Number} = $Identifier{Number};
            delete $Identifier{Number};
        }

        # add name to the search params
        if ( $Identifier{Name} ) {
            $SearchParams{Name} = $Identifier{Name};
            delete $Identifier{Name};
        }

        # add deployment state to the search params
        if ( $Identifier{DeplState} ) {

            # extract deployment state id
            my $DeplStateID = $DeplStateListReverse{ $Identifier{DeplState} } || '';

            if ( !$DeplStateID ) {

                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Can't import this entity. The deployment state "
                        . "'$Identifier{DeplState}' is invalid!",
                );
                return;
            }

            $SearchParams{DeplStateIDs} = [$DeplStateID];
            delete $Identifier{DeplState};
        }

        # add incident state to the search params
        if ( $Identifier{InciState} ) {

            # extract incident state id
            my $InciStateID = $InciStateListReverse{ $Identifier{InciState} } || '';

            if ( !$InciStateID ) {

                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Can't import this entity. The incident state "
                        . "'$Identifier{InciState}' is invalid!",
                );
                return;
            }

            $SearchParams{InciStateIDs} = [$InciStateID];
            delete $Identifier{InciState};
        }

        # add all XML data to the search params
        my @SearchParamsWhat;
        $Self->_ImportXMLSearchDataPrepare(
            XMLDefinition => $DefinitionData->{DefinitionRef},
            What          => \@SearchParamsWhat,
            Identifier    => \%Identifier,
        );

        # add XML search params to the search hash
        if (@SearchParamsWhat) {
            $SearchParams{What} = \@SearchParamsWhat;
        }

        # search existing config item with same identifikator
        my $ConfigItemList = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
            %SearchParams,
            ClassIDs              => [ $ObjectData->{ClassID} ],
            PreviousVersionSearch => 0,
            UsingWildcards        => 0,
            UserID                => $Param{UserID},
        );

        if ( scalar @{$ConfigItemList} > 1 ) {

            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Can't import this entity. Identifier fields NOT unique!",
            );
            return;
        }

        $ConfigItemID = $ConfigItemList->[0];
    }

    # get version data of the config item
    my $VersionData = {};
    if ($ConfigItemID) {

        # get last version
        $VersionData = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        # remove empty xml data
        if (
            !$VersionData->{XMLData}
            || ref $VersionData->{XMLData} ne 'ARRAY'
            || !@{ $VersionData->{XMLData} }
            )
        {
            delete $VersionData->{XMLData};
        }
    }

    my %XMLData2D;
    $Counter = 0;
    MAPPINGOBJECTDATA:
    for my $MappingObjectData (@MappingObjectList) {

        next MAPPINGOBJECTDATA if $MappingObjectData->{Key} eq 'Number';

        # handle name
        if ( $MappingObjectData->{Key} eq 'Name' ) {
            $VersionData->{Name} = $Param{ImportDataRow}->[$Counter];
            next MAPPINGOBJECTDATA;
        }

        # handle deployment state
        if ( $MappingObjectData->{Key} eq 'DeplState' ) {

            # extract deployment state id
            my $DeplStateID = $DeplStateListReverse{ $Param{ImportDataRow}->[$Counter] } || '';

            if ( !$DeplStateID ) {

                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Can't import this entity. The deployment state "
                        . "'$Param{ImportDataRow}->[$Counter]' is invalid!",
                );
                return;
            }

            $VersionData->{DeplStateID} = $DeplStateID;
            next MAPPINGOBJECTDATA;
        }

        # handle incident state
        if ( $MappingObjectData->{Key} eq 'InciState' ) {

            # extract incident state id
            my $InciStateID = $InciStateListReverse{ $Param{ImportDataRow}->[$Counter] } || '';

            if ( !$InciStateID ) {

                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Can't import this entity. The incident state "
                        . "'$Param{ImportDataRow}->[$Counter]' is invalid!",
                );
                return;
            }

            $VersionData->{InciStateID} = $InciStateID;
            next MAPPINGOBJECTDATA;
        }

        # handle xml data
        $XMLData2D{ $MappingObjectData->{Key} } = $Param{ImportDataRow}->[$Counter];
    }
    continue {
        $Counter++;
    }

    # translate xmldata from 2d hash to the multidim structure
    my $XMLData = $Self->_ImportXMLDataPrepare(
        XMLDefinition => $DefinitionData->{DefinitionRef},
        XMLData2D     => \%XMLData2D,
    );

    # add XML data to the version data
    if ( $XMLData && ref $XMLData eq 'HASH' && %{$XMLData} ) {
        $VersionData->{XMLData}->[1]->{Version}->[1] = $XMLData;
    }

    # add the new config item
    my $NewConfigItem;
    if ( !$ConfigItemID ) {

        # add new config item
        $ConfigItemID = $Self->{ConfigItemObject}->ConfigItemAdd(
            ClassID => $ObjectData->{ClassID},
            UserID  => $Param{UserID},
        );

        # check config item id
        if ( !$ConfigItemID ) {

            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Can't import this entity. Error when adding the new config item.",
            );
            return;
        }

        $NewConfigItem = 1;
    }

    # add new version
    my $VersionID = $Self->{ConfigItemObject}->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $VersionData->{Name},
        DefinitionID => $DefinitionData->{DefinitionID},
        DeplStateID  => $VersionData->{DeplStateID},
        InciStateID  => $VersionData->{InciStateID},
        XMLData      => $VersionData->{XMLData},
        UserID       => $Param{UserID},
    );

    return $ConfigItemID if $VersionID;

    $Self->{LogObject}->Log(
        Priority => 'error',
        Message  => "Can't import this entity. Error when adding the new config item version.",
    );

    return if !$NewConfigItem;

    # delete the new config item
    $Self->{ConfigItemObject}->ConfigItemDelete(
        ConfigItemID => $ConfigItemID,
        UserID       => $Param{UserID},
    );

    return;
}

=item _ImportXMLSearchDataPrepare()

recusion function to prepare the import XML search params

    $ObjectBackend->_ImportXMLSearchDataPrepare(
        XMLDefinition => $ArrayRef,
        What          => $ArrayRef,
        Identifier    => $HashRef,
    );

=cut

sub _ImportXMLSearchDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{What};
    return if !$Param{Identifier};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{What} ne 'ARRAY';
    return if ref $Param{Identifier} ne 'HASH';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create key
        my $Key = $Param{Prefix} ? $Param{Prefix} . '::\d+::' . $Item->{Key} : $Item->{Key};
        $Key .= '::\d+';

        my $IdentifierKey;
        IDENTIFIERKEY:
        for my $IdentKey ( keys %{ $Param{Identifier} } ) {

            next IDENTIFIERKEY if $IdentKey !~ m{ \A $Key \z }xms;

            $IdentifierKey = $IdentKey;
        }

        if ($IdentifierKey) {

            # prepare value
            my $Value = $Self->{ConfigItemObject}->XMLImportSearchValuePrepare(
                Item  => $Item,
                Value => $Param{Identifier}->{$IdentifierKey},
            );

            if ($Value) {

                # prepare key
                my $Counter = 0;
                while ( $IdentifierKey =~ m{ :: }xms ) {

                    if ( $Counter % 2 ) {
                        $IdentifierKey =~ s{ :: }{]\{'}xms;
                    }
                    else {
                        $IdentifierKey =~ s{ :: }{'\}[}xms;
                    }

                    $Counter++;
                }

                # create search hash
                my $SearchHash = {
                    '[1]{\'Version\'}[1]{\'' . $IdentifierKey . ']{\'Content\'}' => $Value,
                };

                push @{ $Param{What} }, $SearchHash;
            }
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_ImportXMLSearchDataPrepare(
            XMLDefinition => $Item->{Sub},
            What          => $Param{What},
            Identifier    => $Param{Identifier},
            Prefix        => $Key,
        );
    }

    return 1;
}

=item _ImportXMLDataPrepare()

recusion function to prepare the import XML data

    my $XMLData = $ObjectBackend->_ImportXMLDataPrepare(
        XMLDefinition => $ArrayRef,
        XMLData2D     => $HashRef,
    );

=cut

sub _ImportXMLDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLData2D};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLData2D} ne 'HASH';

    my $XMLData = ();

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # create inputkey
            my $Key = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $Key = $Param{Prefix} . '::' . $Key;
            }

            # prepare value
            my $Value = $Self->{ConfigItemObject}->XMLImportValuePrepare(
                Item  => $Item,
                Value => $Param{XMLData2D}->{$Key},
            );

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                my $SubXMLData = $Self->_ImportXMLDataPrepare(
                    XMLDefinition => $Item->{Sub},
                    XMLData2D     => $Param{XMLData2D},
                    Prefix        => $Key,
                );

                $XMLData->{ $Item->{Key} }->[$Counter] = $SubXMLData;
            }

            if ( defined $Value ) {
                $XMLData->{ $Item->{Key} }->[$Counter]->{Content} = $Value;
            }
        }
    }

    return $XMLData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.1.1.1 $ $Date: 2008-07-05 16:24:13 $

=cut
