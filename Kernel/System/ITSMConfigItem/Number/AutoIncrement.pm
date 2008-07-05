# --
# Kernel/System/ITSMConfigItem/Number/AutoIncrement.pm - config item number backend module
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: AutoIncrement.pm,v 1.1.1.1 2008-07-05 16:24:13 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::ITSMConfigItem::Number::AutoIncrement;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.1.1.1 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::Number::AutoIncrement - config item number backend module

=head1 SYNOPSIS

All auto increment config item number functions

=over 4

=cut

=item _ConfigItemNumberCreate()

create a new config item number

    my $Number = $BackendObject->_ConfigItemNumberCreate(
        ClassID => 123,
    );

=cut

sub _ConfigItemNumberCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ClassID} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need ClassID!' );
        return;
    }

    # get system id
    my $SystemID = $Self->{ConfigObject}->Get('SystemID');

    # get current counter
    my $CurrentCounter = $Self->CurrentCounterGet(
        ClassID => $Param{ClassID},
        Type    => 'AutoIncrement',
    ) || 0;

    CIPHER:
    for my $Cipher ( 1 .. 1_000_000_000 ) {

        # create new number
        my $Number = $SystemID . $Param{ClassID} . sprintf( "%06d", ( $CurrentCounter + $Cipher ) );

        # find existing number
        my $Dublicate = $Self->ConfigItemNumberLookup(
            ConfigItemNumber => $Number,
        );

        next CIPHER if $Dublicate;

        # set counter
        $Self->CurrentCounterSet(
            ClassID => $Param{ClassID},
            Type    => 'AutoIncrement',
            Counter => ( $CurrentCounter + $Cipher ),
        );

        return $Number;
    }

    return;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.1.1.1 $ $Date: 2008-07-05 16:24:13 $

=cut
