# --
# Kernel/Output/HTML/ITSMConfigItemLayoutDummy.pm - layout backend module
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItemLayoutDummy.pm,v 1.2 2009-05-18 10:00:35 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItemLayoutDummy;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

=head1 NAME

Kernel::Output::HTML::ITSMConfigItemLayoutDummy - layout backend module

=head1 SYNOPSIS

All layout functions of dummy objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItemLayoutDummy->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ConfigObject LogObject MainObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

=item OutputStringCreate()

create output string

    my $Value = $BackendObject->OutputStringCreate();

=cut

sub OutputStringCreate {
    return '&nbsp;';
}

=item FormDataGet()

get form data as hash reference

    my $FormDataRef = $BackendObject->FormDataGet();

=cut

sub FormDataGet {
    return {};
}

=item InputCreate()

create a input string

    my $Value = $BackendObject->InputCreate();

=cut

sub InputCreate {
    return '&nbsp;';
}

=item SearchFormDataGet()

get search form data

    my $Value = $BackendObject->SearchFormDataGet();

=cut

sub SearchFormDataGet {
    return [];
}

=item SearchInputCreate()

create a serch input string

    my $Value = $BackendObject->SearchInputCreate();

=cut

sub SearchInputCreate {
    return '&nbsp;';
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

$Revision: 1.2 $ $Date: 2009-05-18 10:00:35 $

=cut
