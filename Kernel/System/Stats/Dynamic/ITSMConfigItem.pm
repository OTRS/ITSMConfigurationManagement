# --
# Kernel/System/Stats/Dynamic/ITSMConfigItem.pm - all dynamic itsm config item stats functions
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMConfigItem;

use strict;
use warnings;

use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(DBObject ConfigObject EncodeObject LogObject UserObject MainObject TimeObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );

    return $Self;
}

sub GetObjectName {
    my $Self = shift;

    return 'ITSMConfigItem';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get deployment state list
    my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # get incident state list
    my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # get current time to fix bug#3830
    my $TimeStamp = $Self->{TimeObject}->CurrentTimestamp();
    my ($Date) = split /\s+/, $TimeStamp;
    my $Today = sprintf "%s 23:59:59", $Date;

    # create object attribute array
    my @ObjectAttributes = (
        {
            Name                => 'Class',
            UseAsXvalue         => 1,
            UseAsValueSeries    => 1,
            UseAsRestriction    => 1,
            Element             => 'ClassIDs',
            Block               => 'MultiSelectField',
            LanguageTranslation => 0,
            Values              => $ClassList,
        },
        {
            Name             => 'Deployment State',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'DeplStateIDs',
            Block            => 'MultiSelectField',
            Values           => $DeplStateList,
        },
        {
            Name             => 'Incident State',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'InciStateIDs',
            Block            => 'MultiSelectField',
            Values           => $InciStateList,
        },
        {
            Name             => 'Number',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Number',
            Block            => 'InputField',
        },
        {
            Name             => 'Name',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Name',
            Block            => 'InputField',
        },
        {
            Name             => 'Create Time',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CreateTime',
            TimePeriodFormat => 'DateInputFormat',
            Block            => 'Time',
            Values           => {
                TimeStart => 'ConfigItemCreateTimeNewerDate',
                TimeStop  => 'ConfigItemCreateTimeOlderDate',
            },
        },
        {
            Name             => 'Change Time',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'ChangeTime',
            TimePeriodFormat => 'DateInputFormat',
            Block            => 'Time',
            TimeStop         => $TimeStamp,
            Values           => {
                TimeStart => 'ConfigItemChangeTimeNewerDate',
                TimeStop  => 'ConfigItemChangeTimeOlderDate',
            },
        },
    );

    # add the xml data
    CLASSID:
    for my $ClassID ( sort keys %{$ClassList} ) {

        # get xml definition hash
        my $XMLDefinition = $Self->{ConfigItemObject}->DefinitionGet(
            ClassID => $ClassID,
        );

        next CLASSID if !$XMLDefinition->{DefinitionID};

        $Self->_XMLAttributeAdd(
            ObjectAttributes => \@ObjectAttributes,
            XMLDefinition    => $XMLDefinition->{DefinitionRef},
            Prefix           => 'XML::' . $ClassID,
            PrefixName       => $ClassList->{$ClassID},
        );
    }

    return @ObjectAttributes;
}

sub _XMLAttributeAdd {
    my ( $Self, %Param ) = @_;

    return if !$Param{ObjectAttributes};
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    if ( $Param{Prefix} ) {
        $Param{Prefix} .= '::';
    }
    if ( $Param{PrefixName} ) {
        $Param{PrefixName} .= '::';
    }

    $Param{Level}      ||= 0;
    $Param{Prefix}     ||= '';
    $Param{PrefixName} ||= '';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        next ITEM if !$Item->{Searchable} && !$Item->{Sub};

        # create key and name
        my $Key  = $Param{Prefix} . $Item->{Key};
        my $Name = $Param{PrefixName} . $Item->{Name};

        # add attribute
        my $Attribute = $Self->{ConfigItemObject}->XMLStatsAttributeCreate(
            Key  => $Key,
            Item => $Item,
            Name => $Name,
        );

        next ITEM if !$Attribute;
        next ITEM if ref $Attribute ne 'ARRAY';
        next ITEM if !scalar @{$Attribute};

        # add attributes to object array
        push @{ $Param{ObjectAttributes} }, @{$Attribute};

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_XMLAttributeAdd(
            XMLDefinition => $Item->{Sub},
            Level         => $Param{Level} + 1,
            Prefix        => $Key,
            PrefixName    => $Name,
        );
    }

    return 1;
}

sub GetStatElement {
    my ( $Self, %Param ) = @_;

    # set limit
    $Param{Limit} = 1_000_000;

    # extract all xml param keys from the param hash
    my @XMLParams = grep { $_ =~ m{\A XML::}xms } keys %Param;

    if (@XMLParams) {
        return 'You must define a class in one axis.' if !$Param{ClassIDs};
        return 'You must define a class in one axis.' if ref $Param{ClassIDs} ne 'ARRAY';
    }

    my %XMLClassIDs;
    for my $ParamKey (@XMLParams) {

        # extract search values
        my $SearchValues = $Param{$ParamKey};

        # prepare param value
        if ( !ref $SearchValues ) {
            $SearchValues = [$SearchValues];
        }

        next if !@{$SearchValues};

        # split param key
        my ( $ClassID, $SearchKey ) = $ParamKey =~ m{ \A XML:: ( \d+ ) :: (.+) \z }xms;

        # prepare search key
        $SearchKey =~ s[ :: ]['}[%]{']xmsg;

        # Add class id to xml class id hash
        $XMLClassIDs{$ClassID} = 1;

        # create search hash
        my $SearchHash = {
            '[1]{\'Version\'}[1]{\'' . $SearchKey . '\'}[%]{\'Content\'}' => $SearchValues,
        };

        push @{ $Param{What} }, $SearchHash;
    }

    if (%XMLClassIDs) {
        my @Exists = grep { $XMLClassIDs{$_} } @{ $Param{ClassIDs} };

        return 0 if !@Exists;
    }

    # start config item extended search
    my $ConfigItemIDs = $Self->{ConfigItemObject}->ConfigItemSearchExtended(%Param);

    return scalar @{$ConfigItemIDs};
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

sub ImportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

1;
