# --
# Kernel/Output/HTML/ITSMConfigItemLayoutText.pm - layout backend module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutText.pm,v 1.10 2010-04-27 11:23:12 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutText;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.10 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutText - layout backend module

=head1 SYNOPSIS

All layout functions of text objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutText->new(
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

    my $Value = $Param{Value};
    if ( !defined $Param{Value} ) {
        $Value = $Param{Item}->{Input}->{ValueDefault} || '';
    }
    my $Size = $Param{Item}->{Input}->{Size} || 40;
    my $String = "<input type=\"Text\" name=\"$Param{Key}\" size=\"$Size\" ";

    if ($Value) {

        # translate
        if ( $Param{Item}->{Input}->{Translation} ) {
            $Value = $Self->{LayoutObject}->{LanguageObject}->Get($Value);
        }

        # transform ascii to html
        $Value = $Self->{LayoutObject}->Ascii2Html(
            Text           => $Value,
            HTMLResultMode => 1,
        );
    }

    $String .= "value=\"$Value\" ";

    # add maximum length
    if ( $Param{Item}->{Input}->{MaxLength} ) {
        $String .= "maxlength=\"$Param{Item}->{Input}->{MaxLength}\" ";
    }

    $String .= "> ";

    return $String;
}

=item SearchFormDataGet()

get search form data

    my $Value = $BackendObject->SearchFormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
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
    my $Value = $Self->{ParamObject}->GetParam( Param => $Param{Key} );

    return $Value;
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

    my $Value = $Self->SearchFormDataGet(%Param);
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

$Revision: 1.10 $ $Date: 2010-04-27 11:23:12 $

=cut
