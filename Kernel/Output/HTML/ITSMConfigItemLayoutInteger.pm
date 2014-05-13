# --
# Kernel/Output/HTML/ITSMConfigItemLayoutInteger.pm - layout backend module
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutInteger;

use strict;
use warnings;

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutInteger - layout backend module

=head1 SYNOPSIS

All layout functions of integer objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutInteger->new(
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
    );

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Value} ) {
        $Param{Value} = '';
    }

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

    # set min, max and default
    my $ValueMin = $Param{Item}->{Input}->{ValueMin} || 1;
    my $ValueMax = $Param{Item}->{Input}->{ValueMax} || 1;
    if ( $ValueMin > $ValueMax ) {
        $ValueMin = $ValueMax;
    }
    if (
        $Param{Item}->{Input}->{ValueDefault}
        && (
            $Param{Item}->{Input}->{ValueDefault} < $ValueMin
            || $Param{Item}->{Input}->{ValueDefault} > $ValueMax
        )
        )
    {
        $Param{Item}->{Input}->{ValueDefault} = '';
    }

    # create data array
    my $IntegerList = [];
    for my $Counter ( $ValueMin .. $ValueMax ) {
        push @{$IntegerList}, $Counter;
    }

    # generate string
    my $String = $Self->{LayoutObject}->BuildSelection(
        Data         => $IntegerList,
        Name         => $Param{Key},
        PossibleNone => 1,
        Translation  => 0,
        SelectedID   => $Param{Value} || $Param{Item}->{Input}->{ValueDefault} || '',
    );

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
    my @Values;
    if ( $Param{Value} ) {
        @Values = @{ $Param{Value} };
    }
    else {
        @Values = $Self->{ParamObject}->GetArray( Param => $Param{Key} );
    }

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
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set min, max
    my $ValueMin = $Param{Item}->{Input}->{ValueMin} || 1;
    my $ValueMax = $Param{Item}->{Input}->{ValueMax} || 1;
    if ( $ValueMin > $ValueMax ) {
        $ValueMin = $ValueMax;
    }

    # set preselected value, either from previous selection or the default
    my $Values = $Self->SearchFormDataGet(%Param);

    # check whether the preselected value is within the valid range
    my @FilteredValues;
    VALUE:
    for my $Value ( @{$Values} ) {
        next VALUE if !defined $Value;
        next VALUE if !$Value;
        next VALUE if $Value < $ValueMin;
        next VALUE if $Value > $ValueMax;

        push @FilteredValues, $Value;
    }

    # create data array
    my @IntegerList = ( $ValueMin .. $ValueMax );

    # generate string
    my $String = $Self->{LayoutObject}->BuildSelection(
        Data        => \@IntegerList,
        Name        => $Param{Key},
        Size        => 5,
        Translation => 0,
        SelectedID  => \@FilteredValues,
        Multiple    => 1,
    );

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
