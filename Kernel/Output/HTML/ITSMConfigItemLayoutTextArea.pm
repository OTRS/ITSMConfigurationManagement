# --
# Kernel/Output/HTML/ITSMConfigItemLayoutTextArea.pm - layout backend module
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutTextArea;

use strict;
use warnings;

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
            Message  => 'Need Item!',
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

    my $LinkFeature    = 1;
    my $HTMLResultMode = 1;

    # do not transform links in print view
    if ( $Param{Print} ) {
        $LinkFeature = 0;

        # do not convert whitespace and newlines in PDF mode
        if ( $Self->{ConfigObject}->Get('PDF') ) {
            $HTMLResultMode = 0;
        }
    }

    # transform ascii to html
    $Param{Value} = $Self->{LayoutObject}->Ascii2Html(
        Text           => $Param{Value},
        HTMLResultMode => $HTMLResultMode,
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
                Message  => "Need $Argument!",
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

    # value was entered in the form, a regex is defined and the value does not match the regex
    if (
        $FormData{Value}
        && $Param{Item}->{Input}->{RegEx}
        && $FormData{Value} !~ m{ $Param{Item}->{Input}->{RegEx} }xms
        )
    {

        $FormData{Invalid} = 1;
        $Param{Item}->{Form}->{ $Param{Key} }->{Invalid} = 1;
        $Param{Item}->{Form}->{ $Param{Key} }->{RegExErrorMessage}
            = $Param{Item}->{Input}->{RegExErrorMessage};
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
                Message  => "Need $Argument!",
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

    my $Class    = 'W50pc';
    my $Required = $Param{Required};
    my $Invalid  = $Param{Invalid};
    my $ItemId   = $Param{ItemId};

    if ($Required) {
        $Class .= ' Validate_Required';
    }

    if ($Invalid) {
        $Class .= ' ServerError';
    }

    # translate
    if ( $Param{Item}->{Input}->{Translation} ) {
        $Value = $Self->{LayoutObject}->{LanguageObject}->Get($Value);
    }
    my $String
        = "<textarea name=\"$Param{Key}\" id=\"$ItemId\" cols=\"$Cols\" rows=\"$Rows\" class=\"$Class\">$Value</textarea>";

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
            Message  => 'Need Key!',
        );
        return;
    }

    # get form data
    my $Value;
    if ( $Param{Value} ) {
        $Value = $Param{Value};
    }
    else {
        $Value = $Self->{ParamObject}->GetParam( Param => $Param{Key} );
    }
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
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Value = $Self->SearchFormDataGet(%Param);
    if ( !defined $Value ) {
        $Value = '';
    }

    my $String = qq{<input type="text" name="$Param{Key}" value="$Value" class="W50pc">};

    return $String;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
