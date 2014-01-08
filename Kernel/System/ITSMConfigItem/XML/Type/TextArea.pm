# --
# Kernel/System/ITSMConfigItem/XML/Type/TextArea.pm - xml backend module
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::XML::Type::TextArea;

use strict;
use warnings;

=head1 NAME

Kernel::System::ITSMConfigItem::XML::Type::TextArea - xml backend module

=head1 SYNOPSIS

All xml functions of textarea objects

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::ITSMConfigItem;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ConfigItemObject = Kernel::System::ITSMConfigItem->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    $BackendObject = $ConfigItemObject->_LoadXMLTypeBackend(
        Type => 'TextArea',
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject EncodeObject LogObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

=item ValueLookup()

get the text data of a version

    my $Value = $BackendObject->ValueLookup(
        Value => 11,  # (optional)
    );

=cut

sub ValueLookup {
    my ( $Self, %Param ) = @_;

    return $Param{Value};
}

=item StatsAttributeCreate()

create a attribute array for the stats framework

    my $Attribute = $BackendObject->StatsAttributeCreate(
        Key  => 'Key::Subkey',
        Name => 'Name',
        Item => $ItemRef,
    );

=cut

sub StatsAttributeCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Name Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create arrtibute
    my $Attribute = [
        {
            Name             => $Param{Name},
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => $Param{Key},
            Block            => 'InputField',
        },
    ];

    return $Attribute;
}

=item ExportSearchValuePrepare()

prepare search value for export

    my $ArrayRef = $BackendObject->ExportSearchValuePrepare(
        Value => 11, # (optional)
    );

=cut

sub ExportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    return if !defined $Param{Value};
    return $Param{Value};
}

=item ExportValuePrepare()

prepare value for export

    my $Value = $BackendObject->ExportValuePrepare(
        Value => 11, # (optional)
    );

=cut

sub ExportValuePrepare {
    my ( $Self, %Param ) = @_;

    return if !defined $Param{Value};
    return $Param{Value};
}

=item ImportSearchValuePrepare()

prepare search value for import

    my $ArrayRef = $BackendObject->ImportSearchValuePrepare(
        Value => 11, # (optional)
    );

=cut

sub ImportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    return if !defined $Param{Value};
    return $Param{Value};
}

=item ImportValuePrepare()

prepare value for import

    my $Value = $BackendObject->ImportValuePrepare(
        Value => 11, # (optional)
    );

=cut

sub ImportValuePrepare {
    my ( $Self, %Param ) = @_;

    return if !defined $Param{Value};
    return $Param{Value};
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
