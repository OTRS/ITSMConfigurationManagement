# --
# Kernel/Output/HTML/ITSMConfigItemLayoutTextArea.pm - layout backend module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutTextArea.pm,v 1.7 2010-02-11 21:51:33 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutTextArea;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.7 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutTextArea - layout backend module

=head1 SYNOPSIS

All layout functions of textarea objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutTextArea->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject EncodeObject LogObject MainObject ParamObject LayoutObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

=item OutputStringCreate()

create output string

    my $Value = $BackendObject->OutputStringCreate(
        Value => 11,       # (optional)
        Item => $ItemRef,
    );

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!'
        );
        return;
    }

    if ( !defined $Param{Value} ) {
        $Param{Value} = '';
    }

    # translate
    if ( $Param{Item}->{Input}->{Translation} ) {
        $Param{Value} = $Self->{LayoutObject}->{LanguageObject}->Get( $Param{Value} );
    }

    # do not transform links in print view
    my $LinkFeature = 1;
    if ( $Param{Print} ) {
        $LinkFeature = 0;
    }

    # transform ascii to html
    $Param{Value} = $Self->{LayoutObject}->Ascii2Html(
        Text           => $Param{Value},
        HTMLResultMode => 1,
        LinkFeature    => $LinkFeature,
    );

    return $Param{Value};
}

=item FormDataGet()

get form data as hash reference

    my $FormDataRef = $BackendObject->FormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub FormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my %FormData;

    # get form data
    $FormData{Value} = $Self->{ParamObject}->GetParam( Param => $Param{Key} );

    # set invalid param
    if ( $Param{Item}->{Input}->{Required} && !$FormData{Value} ) {
        $FormData{Invalid} = 1;
        $Param{Item}->{Form}->{ $Param{Key} }->{Invalid} = 1;
    }

    return \%FormData;
}

=item InputCreate()

create a input string

    my $Value = $BackendObject->InputCreate(
        Key => 'Item::1::Node::3',
        Value => 11,                # (optional)
        Item => $ItemRef,
    );

=cut

sub InputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my $Cols = $Param{Item}->{Input}->{Cols} || 58;
    my $Rows = $Param{Item}->{Input}->{Rows} || 10;

    my $Value = $Param{Value};
    if ( !defined $Param{Value} ) {
        $Value = $Param{Item}->{Input}->{ValueDefault} || '';
    }

    # translate
    if ( $Param{Item}->{Input}->{Translation} ) {
        $Value = $Self->{LayoutObject}->{LanguageObject}->Get($Value);
    }
    my $String = "<textarea name=\"$Param{Key}\" cols=\"$Cols\" rows=\"$Rows\">$Value</textarea>";

    return $String;
}

=item SearchFormDataGet()

get search form data

    my $Value = $BackendObject->SearchFormDataGet(
        Key => 'Item::1::Node::3',
    );

=cut

sub SearchFormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Key} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Key!'
        );
        return;
    }

    # get form data
    my @Values = $Self->{ParamObject}->GetArray( Param => $Param{Key} );

    return \@Values;
}

=item SearchInputCreate()

create a search input string

    my $Value = $BackendObject->SearchInputCreate(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub SearchInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my $Values = $Self->SearchFormDataGet(%Param);
    my $Value  = $Values->[0];
    if ( !defined $Value ) {
        $Value = '';
    }

    my $String = qq{<input type="Text" name="$Param{Key}" value="$Value" size="60">};

    return $String;
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

$Revision: 1.7 $ $Date: 2010-02-11 21:51:33 $

=cut
