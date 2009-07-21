# --
# Kernel/Output/HTML/ITSMConfigItemLayoutCustomer.pm - layout backend module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutCustomer.pm,v 1.3 2009-07-21 00:44:57 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutCustomer;

use strict;
use warnings;

use Kernel::System::CustomerUser;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutCustomer - layout backend module

=head1 SYNOPSIS

All layout functions of customer objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutCustomer->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject EncodeObject LogObject MainObject ParamObject DBObject LayoutObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new( %{$Self} );

    return $Self;
}

=item OutputStringCreate()

create output string

    my $Value = $BackendObject->OutputStringCreate(
        Value => 11,       # (optional)
    );

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    # transform ascii to html
    $Param{Value} = $Self->{LayoutObject}->Ascii2Html(
        Text => $Param{Value} || '',
        HTMLResultMode => 1,
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

    # get selected customer user
    $FormData{Value} = $Self->{ParamObject}->GetParam( Param => $Param{Key} );

    # check search button
    if ( $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::ButtonSearch' ) ) {
        $Param{Item}->{Form}->{ $Param{Key} }->{Search}
            = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Search' );
    }

    # check select button
    elsif ( $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::ButtonSelect' ) ) {
        $FormData{Value} = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Select' );
    }

    # check clear button
    elsif ( $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::ButtonClear' ) ) {
        $FormData{Value} = '';
    }
    else {

        # reset value if search field is emty
        if (
            !$Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Search' )
            && defined $FormData{Value}
            )
        {
            $FormData{Value} = '';
        }

        # check required option
        if ( $Param{Item}->{Input}->{Required} && !$FormData{Value} ) {
            $Param{Item}->{Form}->{ $Param{Key} }->{Invalid} = 1;
            $FormData{Invalid} = 1;
        }
    }

    return \%FormData;
}

=item InputCreate()

create a input string

    my $Value = $BackendObject->InputCreate(
        Key => 'Item::1::Node::3',
        Value => 11,       # (optional)
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

    my $Value = '';
    if ( defined $Param{Value} ) {
        $Value = $Param{Value};
    }
    elsif ( $Param{Item}->{Input}->{ValueDefault} ) {
        $Value = $Param{Item}->{Input}->{ValueDefault};
    }
    my $Size         = $Param{Item}->{Input}->{Size} || 50;
    my $Search       = '';
    my $StringOption = '';
    my $StringSelect = '';

    # customer search
    if ( $Param{Item}->{Form}->{ $Param{Key} }->{Search} ) {

        # start search
        my %CustomerSearchList = $Self->{CustomerUserObject}->CustomerSearch(
            Search => $Param{Item}->{Form}->{ $Param{Key} }->{Search},
        );
        if (%CustomerSearchList) {

            # create option list
            $StringOption = $Self->{LayoutObject}->BuildSelection(
                Name => $Param{Key} . '::Select',
                Data => \%CustomerSearchList,
            );
            $StringOption .= '<br>';

            # create select button
            $StringSelect = '<input class="button" type="submit" name="'
                . $Param{Key}
                . '::ButtonSelect" '
                . 'value="$Text{"Select"}">&nbsp;';

            # set search
            $Search = $Param{Item}->{Form}->{ $Param{Key} }->{Search};
        }
    }

    # create customer string
    elsif ($Value) {

        # get customer data
        my %CustomerSearchList = $Self->{CustomerUserObject}->CustomerSearch(
            Search => $Value,
        );

        # transform ascii to html
        $Search = $Self->{LayoutObject}->Ascii2Html(
            Text => $CustomerSearchList{$Value} || '',
            HTMLResultMode => 1,
        );
    }

    # create string
    my $String
        = '<input type="hidden" name="'
        . $Param{Key}
        . '" value="'
        . $Value . '">'
        . '<input type="Text" name="'
        . $Param{Key}
        . '::Search" size="'
        . $Size
        . '" value="'
        . $Search . '">' . '<br>'
        . $StringOption
        . $StringSelect
        . '<input class="button" type="submit" name="'
        . $Param{Key}
        . '::ButtonSearch" value="$Text{"Search"}">'
        . '&nbsp;'
        . '<input class="button" type="submit" name="'
        . $Param{Key}
        . '::ButtonClear" value="$Text{"Clear"}">';

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
    my @Values = $Self->{ParamObject}->GetArray( Param => $Param{Key} );

    return \@Values;
}

=item SearchInputCreate()

create a search input string

    my $Value = $BackendObject->SearchInputCreate(
        Key => 'Item::1::Node::3',
    );

=cut

sub SearchInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Key} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Key!'
        );
        return;
    }

    my $String = "<input type=\"Text\" name=\"$Param{Key}\" size=\"60\">";

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

$Revision: 1.3 $ $Date: 2009-07-21 00:44:57 $

=cut
