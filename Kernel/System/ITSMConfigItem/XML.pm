# --
# Kernel/System/ITSMConfigItem/XML.pm - sub module of ITSMConfigItem.pm with xml functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: XML.pm,v 1.7 2009-08-19 22:48:14 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::XML;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::XML - sub module of Kernel::System::ITSMConfigItem

=head1 SYNOPSIS

All xml functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item XMLValueLookup()

lookup a xml value

    my $Value = $ConfigItemObject->XMLValueLookup(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLValueLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # lookup item value
    my $Value = $BackendObject->ValueLookup(%Param);

    return $Value;
}

=item XMLStatsAttributeCreate()

create a attribute array for the stats framework

    my $Value = $ConfigItemObject->XMLStatsAttributeCreate(
        Item => $ItemRef,
    );

=cut

sub XMLStatsAttributeCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return if !$BackendObject;

    # create stats attribute array
    my $Attribute = $BackendObject->StatsAttributeCreate(%Param);

    return $Attribute;
}

=item XMLExportSearchValuePrepare()

prepare xml search data for export

    my $ArrayRef = $ConfigItemObject->XMLExportSearchValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLExportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return if !$BackendObject;

    # prepare value
    my $Array = $BackendObject->ExportSearchValuePrepare(%Param);

    return $Array;
}

=item XMLExportValuePrepare()

prepare xml data for export

    my $Value = $ConfigItemObject->XMLExportValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLExportValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return if !$BackendObject;

    # prepare value
    my $Value = $BackendObject->ExportValuePrepare(%Param);

    return $Value;
}

=item XMLImportSearchValuePrepare()

prepare xml search data for import

    my $ArrayRef = $ConfigItemObject->XMLImportSearchValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLImportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return if !$BackendObject;

    # prepare value
    my $Array = $BackendObject->ImportSearchValuePrepare(%Param);

    return $Array;
}

=item XMLImportValuePrepare()

prepare xml data for import

    my $Value = $ConfigItemObject->XMLImportValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLImportValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_LoadXMLTypeBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return if !$BackendObject;

    # prepare value
    my $Value = $BackendObject->ImportValuePrepare(%Param);

    return $Value;
}

=item _XMLVersionSearch()

search xml data of a version and return a hash reference

    my $VersionIDs = $ConfigItemObject->_XMLVersionSearch(
        ClassIDs => [1, 2, 3],  # (optional)

        What => [
            # each array element is a and condition
            {
                # or condition in hash
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => '%contentA%',
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => '%contentA%',
            },
            {
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => '%contentB%',
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => '%contentB%',
            }
            {
                # use array reference if different content with same key was searched
                "[%]{'ElementA'}[%]{'ElementB'}[%]{'Content'}" => [
                    '%contentC%',
                    '%contentD%',
                    '%contentE%',
                ],
                "[%]{'ElementA'}[%]{'ElementC'}[%]{'Content'}" => [
                    '%contentC%',
                    '%contentD%',
                    '%contentE%',
                ],
            },
        ],

        PreviousVersionSearch => 1,  # (optional) default 0 (0|1)
    );

=cut

sub _XMLVersionSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{What} || ref $Param{What} ne 'ARRAY' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Need What as array reference!",
        );
        return;
    }

    # prepare like string
    for my $Row ( @{ $Param{What} } ) {

        VALUES:
        for my $Values ( values %{$Row} ) {

            next VALUES if !$Values;

            # values is an array
            if ( ref $Values eq 'ARRAY' ) {
                for my $Value ( @{$Values} ) {
                    $Self->_PrepareLikeString( \$Value );
                }
                next VALUES;
            }

            $Self->_PrepareLikeString( \$Values );
        }
    }

    if ( !$Param{ClassIDs} || ref $Param{ClassIDs} ne 'ARRAY' || !@{ $Param{ClassIDs} } ) {

        # get class list
        my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        @{ $Param{ClassIDs} } = keys %{$ClassList};
    }

    # quote
    for my $ClassID ( @{ $Param{ClassIDs} } ) {
        $Self->{DBObject}->Quote( $ClassID, 'Integer' );
    }

    # search in active versions
    my %VersionIDs;
    for my $ClassID ( @{ $Param{ClassIDs} } ) {

        # start xml search
        my @Keys = $Self->{XMLObject}->XMLHashSearch(
            Type => "ITSM::ConfigItem::$ClassID",
            What => $Param{What},
        );

        # add all ids to version id hash
        for my $VersionID (@Keys) {
            $VersionIDs{$VersionID} = 1
        }
    }

    return \%VersionIDs if !$Param{PreviousVersionSearch};

    # search also in old versions (archiv)
    for my $ClassID ( @{ $Param{ClassIDs} } ) {

        # start xml search
        my @Keys = $Self->{XMLObject}->XMLHashSearch(
            Type => "ITSM::ConfigItem::Archiv::$ClassID",
            What => $Param{What},
        );

        # add all ids to version id hash
        for my $VersionID (@Keys) {
            $VersionIDs{$VersionID} = 1
        }
    }

    return \%VersionIDs;
}

=item _XMLVersionGet()

get the xml data of a version

    my $ArrayRef = $ConfigItemObject->_XMLVersionGet(
        ClassID   => 1,
        VersionID => 123,
    );

=cut

sub _XMLVersionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID VersionID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get version
    my @XML = $Self->{XMLObject}->XMLHashGet(
        Type => "ITSM::ConfigItem::$Param{ClassID}",
        Key  => $Param{VersionID},
    );

    return \@XML if @XML;

    # get version from archiv
    @XML = $Self->{XMLObject}->XMLHashGet(
        Type => "ITSM::ConfigItem::Archiv::$Param{ClassID}",
        Key  => $Param{VersionID},
    );

    return \@XML;
}

=item _XMLVersionAdd()

add the xml data of a new version and move old xml versions in archiv class

    my $XMLID = $ConfigItemObject->_XMLVersionAdd(
        ClassID      => 1,
        ConfigItemID => 222,
        VersionID    => 123,
        XMLData      => $ArrayRef,
    );

=cut

sub _XMLVersionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID ConfigItemID VersionID XMLData)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # add xml version
    my $XMLID = $Self->{XMLObject}->XMLHashAdd(
        Type    => "ITSM::ConfigItem::$Param{ClassID}",
        Key     => $Param{VersionID},
        XMLHash => $Param{XMLData},
    );

    # get last versions
    my $OldVersionIDs = $Self->VersionList(
        ConfigItemID => $Param{ConfigItemID},
    );

    # Find Version to move
    my $MoveVersion;
    OLDVERSIONID:
    for my $OldVersionID ( @{$OldVersionIDs} ) {
        last OLDVERSIONID if $OldVersionID eq $Param{VersionID};

        $MoveVersion = $OldVersionID;
    }

    return $XMLID if !$MoveVersion;

    # move old version in archiv
    $Self->{XMLObject}->XMLHashMove(
        OldType => "ITSM::ConfigItem::$Param{ClassID}",
        OldKey  => $MoveVersion,
        NewType => "ITSM::ConfigItem::Archiv::$Param{ClassID}",
        NewKey  => $MoveVersion,
    );

    return $XMLID;
}

=item _XMLVersionDelete()

delete the xml data of a version

    my $True = $ConfigItemObject->_XMLVersionDelete(
        VersionID => 123,
        UserID    => 1,
    );

=cut

sub _XMLVersionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(VersionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get version data
    my $Version = $Self->VersionGet(
        VersionID => $Param{VersionID},
    );

    return if !$Version;

    # delete xml data from a version
    $Self->{XMLObject}->XMLHashDelete(
        Type => "ITSM::ConfigItem::$Version->{ClassID}",
        Key  => $Param{VersionID},
    );

    # delete xml data from archiv
    $Self->{XMLObject}->XMLHashDelete(
        Type => "ITSM::ConfigItem::Archiv::$Version->{ClassID}",
        Key  => $Param{VersionID},
    );

    return 1;
}

=item _LoadXMLTypeBackend()

load a xml item module

    $BackendObject = $ConfigItemObject->_LoadXMLTypeBackend(
        Type => 'GeneralCatalog',
    );

=cut

sub _LoadXMLTypeBackend {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Type} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Type!',
        );
        return;
    }

    # check if object is already cached
    return $Self->{Cache}->{LoadXMLTypeBackend}->{ $Param{Type} }
        if $Self->{Cache}->{LoadXMLTypeBackend}->{ $Param{Type} };

    my $GenericModule = "Kernel::System::ITSMConfigItem::XML::Type::$Param{Type}";

    # load the backend module
    if ( !$Self->{MainObject}->Require($GenericModule) ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't load backend module $Param{Type}!"
        );
        return;
    }

    # create new instance
    my $BackendObject = $GenericModule->new(
        %{$Self},
        %Param,
    );

    if ( !$BackendObject ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't create a new instance of backend module $Param{Type}!",
        );
        return;
    }

    # cache the object
    $Self->{Cache}->{LoadXMLTypeBackend}->{ $Param{Type} } = $BackendObject;

    return $BackendObject;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

=head1 VERSION

$Revision: 1.7 $ $Date: 2009-08-19 22:48:14 $

=cut
