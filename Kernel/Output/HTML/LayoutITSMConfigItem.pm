# --
# Kernel/Output/HTML/LayoutITSMConfigItem.pm - provides generic HTML output for ITSMConfigItem
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: LayoutITSMConfigItem.pm,v 1.2 2009-05-18 10:00:53 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::LayoutITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

=item ITSMConfigItemOutputStringCreate()

returns a output string

    my $String = $LayoutObject->ITSMConfigItemOutputStringCreate(
        Value => 11,       # (optional)
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemOutputStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Item!'
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # generate output string
    my $String = $BackendObject->OutputStringCreate(%Param);

    return $String;
}

=item ITSMConfigItemFormDataGet()

returns the values from the html form as hash reference

    my $FormDataRef = $LayoutObject->ITSMConfigItemFormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemFormDataGet {
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

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return {} if !$BackendObject;

    # get form data
    my $FormData = $BackendObject->FormDataGet(%Param);

    return $FormData;
}

=item ITSMConfigItemInputCreate()

returns a input field html string

    my $String = $LayoutObject->ITSMConfigItemInputCreate(
        Key => 'Item::1::Node::3',
        Value => 11,                # (optional)
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemInputCreate {
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

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # lookup item value
    my $String = $BackendObject->InputCreate(%Param);

    return $String;
}

=item ITSMConfigItemSearchFormDataGet()

returns the values from the search html form

    my $ArrayRef = $LayoutObject->ITSMConfigItemSearchFormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemSearchFormDataGet {
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

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return [] if !$BackendObject;

    # get form data
    my $Values = $BackendObject->SearchFormDataGet(%Param);

    return $Values;
}

=item ITSMConfigItemSearchInputCreate()

returns a search input field html string

    my $String = $LayoutObject->ITSMConfigItemSearchInputCreate(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemSearchInputCreate {
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

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # lookup item value
    my $String = $BackendObject->SearchInputCreate(%Param);

    return $String;
}

=item _ITSMLoadLayoutBackend()

load a input type backend module

    $BackendObject = $LayoutObject->_ITSMLoadLayoutBackend(
        Type => 'GeneralCatalog',
    );

=cut

sub _ITSMLoadLayoutBackend {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Type} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Type!',
        );
        return;
    }

    # check if object is already cached
    return $Self->{Cache}->{ITSMLoadLayoutBackend}->{ $Param{Type} }
        if $Self->{Cache}->{ITSMLoadLayoutBackend}->{ $Param{Type} };

    my $GenericModule = "Kernel::Output::HTML::ITSMConfigItemLayout$Param{Type}";

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
        LayoutObject => $Self,
    );

    if ( !$BackendObject ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => "Can't create a new instance of backend module $Param{Type}!",
        );
        return;
    }

    # cache the object
    $Self->{Cache}->{ITSMLoadLayoutBackend}->{ $Param{Type} } = $BackendObject;

    return $BackendObject;
}

1;
