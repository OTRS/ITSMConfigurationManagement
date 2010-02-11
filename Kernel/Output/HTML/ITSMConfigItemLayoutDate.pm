# --
# Kernel/Output/HTML/ITSMConfigItemLayoutDate.pm - layout backend module
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutDate.pm,v 1.4 2010-02-11 09:35:56 bes Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutDate;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutDate - layout backend module

=head1 SYNOPSIS

All layout functions of date objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutDate->new(
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
        Value => '2007-01-01',  # (optional)
    );

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    return '' if !$Param{Value};

    $Param{Value} = $Self->{LayoutObject}->Output(
        Template => '$TimeLong{"$QData{"Date"}"}',
        Data     => {
            Date => $Param{Value} . ' 00:00:00',
        },
    );
    $Param{Value} =~ s/00:00:00//;

    return $Param{Value} || '';
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
    my $Day   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Day' );
    my $Month = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Month' );
    my $Year  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Year' );

    if ( $Day && $Month && $Year ) {
        $Day   = sprintf( "%02d", $Day );
        $Month = sprintf( "%02d", $Month );
        $Year  = sprintf( "%02d", $Year );

        $FormData{Value} = $Year . '-' . $Month . '-' . $Day;
    }

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
        Value => '2007-03-26',      # (optional)
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

    my %Values;
    if ( $Param{Value} || $Param{Item}->{Input}->{ValueDefault} ) {
        my $Value = $Param{Value} || $Param{Item}->{Input}->{ValueDefault};

        if ( $Value =~ /^(\d\d\d\d)-(\d\d|\d)-(\d\d|\d)$/i ) {
            $Values{ $Param{Key} . '::Year' }  = $1;
            $Values{ $Param{Key} . '::Month' } = $2;
            $Values{ $Param{Key} . '::Day' }   = $3;
        }
    }

    my $String = $Self->{LayoutObject}->BuildDateSelection(
        Prefix           => $Param{Key} . '::',
        Format           => 'DateInputFormat',
        YearPeriodPast   => 10,
        YearPeriodFuture => 10,
        %Values,
    );

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
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get form data
    my $Used  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Used' );
    my $Day   = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Day' );
    my $Month = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Month' );
    my $Year  = $Self->{ParamObject}->GetParam( Param => $Param{Key} . '::Year' );

    my $Values = [];
    if ( $Used && $Day && $Month && $Year ) {
        $Day   = sprintf '%02d', $Day;
        $Month = sprintf '%02d', $Month;
        $Year  = sprintf '%02d', $Year;

        my $Date = $Year . '-' . $Month . '-' . $Day;
        push @{$Values}, $Date;
    }

    return $Values;
}

=item SearchInputCreate()

create a serch input string

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

    # just for convenience
    my $Key = $Param{Key};

    # collect arguments for BuildDateSelection()
    my %Values;
    $Values{ $Key . '::Optional' } = 1;
    $Values{ $Key . '::Used' }     = $Self->{ParamObject}->GetParam( Param => $Key . '::Used' );
    $Values{ $Key . '::Day' }      = $Self->{ParamObject}->GetParam( Param => $Key . '::Day' );
    $Values{ $Key . '::Month' }    = $Self->{ParamObject}->GetParam( Param => $Key . '::Month' );
    $Values{ $Key . '::Year' }     = $Self->{ParamObject}->GetParam( Param => $Key . '::Year' );

    my $String = $Self->{LayoutObject}->BuildDateSelection(
        Prefix           => $Key . '::',
        Format           => 'DateInputFormat',
        YearPeriodPast   => 10,
        YearPeriodFuture => 10,
        %Values,
    );

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

$Revision: 1.4 $ $Date: 2010-02-11 09:35:56 $

=cut
