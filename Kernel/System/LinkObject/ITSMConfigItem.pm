# --
# Kernel/System/LinkObject/ITSMConfigItem.pm - to link config item objects
# Copyright (C) 2001-2008 OTRS AG, http://otrs.org/
# --
# $Id: ITSMConfigItem.pm,v 1.4 2008-08-02 15:07:03 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.
# --

package Kernel::System::LinkObject::ITSMConfigItem;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for (qw(DBObject ConfigObject LogObject MainObject TimeObject LinkObject)) {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }
    $Self->{ConfigItemObject} = Kernel::System::ITSMConfigItem->new( %{$Self} );

    return $Self;
}

=item LinkListWithData()

fill up the link list with data

    $Success = $LinkObjectBackend->LinkListWithData(
        LinkList => $HashRef,
        UserID   => 1,
    );

=cut

sub LinkListWithData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(LinkList UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check link list
    if ( ref $Param{LinkList} ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'LinkList must be a hash reference!',
        );
        return;
    }

    for my $LinkType ( keys %{ $Param{LinkList} } ) {

        for my $Direction ( keys %{ $Param{LinkList}->{$LinkType} } ) {

            CONFIGITEMID:
            for my $ConfigItemID ( keys %{ $Param{LinkList}->{$LinkType}->{$Direction} } ) {

                # get last version data
                my $VersionData = $Self->{ConfigItemObject}->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                    UserID       => $Param{UserID},
                );

                # remove id from hash if config item can not get
                if ( !$VersionData || ref $VersionData ne 'HASH' || !%{$VersionData} ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$ConfigItemID};
                    next CONFIGITEMID;
                }

                # add version data
                $Param{LinkList}->{$LinkType}->{$Direction}->{$ConfigItemID} = $VersionData;
            }
        }
    }

    return 1;
}

=item ObjectDescriptionGet()

return a hash of object descriptions

Return
    %Description = (
        Normal => "ConfigItem# 1234455",
        Long   => "ConfigItem# 1234455: The Config Item Title",
    );

    %Description = $LinkObject->ObjectDescriptionGet(
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectDescriptionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create description
    my %Description = (
        Normal => 'ConfigItem',
        Long   => 'ConfigItem',
    );

    return %Description if $Param{Mode} && $Param{Mode} eq 'Temporary';

    # get last version data
    my $VersionData = $Self->{ConfigItemObject}->VersionGet(
        ConfigItemID => $Param{Key},
        XMLDataGet   => 0,
        UserID       => $Param{UserID},
    );

    return if !$VersionData;
    return if ref $VersionData ne 'HASH';
    return if !%{$VersionData};

    # create description
    %Description = (
        Normal => "ConfigItem# $VersionData->{Number}",
        Long   => "ConfigItem# $VersionData->{Number}: $VersionData->{Name}",
    );

    return %Description;
}

=item ObjectSearch()

return a hash list of the search results

Return
    $SearchList = {
        NOTLINKED => {
            Source => {
                12  => $DataOfItem12,
                212 => $DataOfItem212,
                332 => $DataOfItem332,
            },
        },
    };

    $SearchList = $LinkObjectBackend->ObjectSearch(
        SubObject    => '25',        # (optional)
        SearchParams => $HashRef,    # (optional)
        UserID       => 1,
    );

=cut

sub ObjectSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # set default params
    $Param{SearchParams} ||= {};

    # set focus
    my %Search;
    for my $Element (qw(Number Name)) {
        if ( $Param{SearchParams}->{$Element} ) {
            $Search{$Element} = '*' . $Param{SearchParams}->{$Element} . '*';
        }
    }

    my %SearchList;
    return %SearchList if !$Param{SubObject};

    # search the config items
    my $ConfigItemIDs = $Self->{ConfigItemObject}->ConfigItemSearchExtended(
        %{ $Param{SearchParams} },
        %Search,
        ClassIDs              => [ $Param{SubObject} ],
        PreviousVersionSearch => 0,
        UsingWildcards        => 1,
        OrderBy               => 'Number',
        Limit                 => 50,
        UserID                => $Param{UserID},
    );

    CONFIGITEMID:
    for my $ConfigItemID ( @{$ConfigItemIDs} ) {

        # get last version data
        my $VersionData = $Self->{ConfigItemObject}->VersionGet(
            ConfigItemID => $ConfigItemID,
            XMLDataGet   => 0,
            UserID       => $Param{UserID},
        );

        next CONFIGITEMID if !$VersionData;
        next CONFIGITEMID if ref $VersionData ne 'HASH';
        next CONFIGITEMID if !%{$VersionData};

        # add version data
        $SearchList{NOTLINKED}->{Source}->{$ConfigItemID} = $VersionData;
    }

    return \%SearchList;
}

=item LinkAddPre()

link add pre event module

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkAddPost()

link add pre event module

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePre()

link delete pre event module

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePost()

link delete post event module

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

1;
