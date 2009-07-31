# --
# Kernel/System/ITSMConfigItem/History.pm - module for ITSMConfigItem.pm with history functions
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: History.pm,v 1.3 2009-07-31 12:19:51 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::History;

use Kernel::System::User;
use Kernel::System::Time;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

=head1 NAME

Kernel::System::ITSMConfigItem::History - module for ITSMConfigItem.pm with history functions

=head1 SYNOPSIS

All history functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::Config;
    use Kernel::System::Encode;
    use Kernel::System::Log;
    use Kernel::System::DB;
    use Kernel::System::Main;
    use Kernel::System::ITSMConfigItem::History;

    my $ConfigObject = Kernel::Config->new();
    my $EncodeObject = Kernel::System::Encode->new(
        ConfigObject => $ConfigObject,
    );
    my $LogObject = Kernel::System::Log->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
    );
    my $MainObject = Kernel::System::Main->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        EncodeObject => $EncodeObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $HistoryObject = Kernel::System::ITSMConfigItem::History->new(
        ConfigObject => $ConfigObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(DBObject ConfigObject LogObject MainObject EncodeObject)) {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    $Self->{TimeObject} = Kernel::System::Time->new( %{$Self} );

    return $Self;
}

=item HistoryGet()

Returns an array reference with all history entries for the given config item.
Each array element is a hash reference representing one history entry.

These hash references contain information about:

    * HistoryEntryID
    * ConfigItemID
    * HistoryType
    * HistoryTypeID
    * Comment
    * CreatedBy
    * CreatedTime
    * UserID
    * UserLogin
    * UserLastname
    * UserFirstname

    my $Info = $HistoryObject->HistoryGet(
        ConfigItemID => 1234,
    );

=cut

sub HistoryGet {
    my ( $Self, %Params ) = @_;

    # check needed stuff
    for my $Needed ( qw(ConfigItemID) ) {
        if ( !$Params{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $SQL = qq~SELECT ch.id, ch.config_item_id, ch.content, ch.type_id,
                        ch.create_by, ch.create_time, cht.name
                    FROM configitem_history ch, configitem_history_type cht
                    WHERE ch.type_id = cht.id AND
                        ch.config_item_id = ?
                    ORDER BY ch.id~;

    $Self->{DBObject}->Prepare(
        SQL  => $SQL,
        Bind => [ \$Params{ConfigItemID} ],
    );

    my @Entries;

    my $UserObject = Kernel::System::User->new(
        %{$Self},
    );

    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        my %Tmp = (
            HistoryEntryID => $Row[0],
            ConfigItemID   => $Row[1],
            Comment        => $Row[2],
            HistoryTypeID  => $Row[3],
            CreateBy       => $Row[4],
            CreateTime     => $Row[5],
            HistoryType    => $Row[6],
        );

        push @Entries, \%Tmp;
    }

    for my $Entry ( @Entries ) {

        my %UserInfo = $UserObject->GetUserData(
            UserID => $Entry->{CreateBy},
            Cached => 1
        );

        $Entry->{UserID}         = $UserInfo{UserID};
        $Entry->{UserLogin}      = $UserInfo{UserLogin};
        $Entry->{UserFirstname}  = $UserInfo{UserFirstname};
        $Entry->{UserLastname}   = $UserInfo{UserLastname};
    }

    return \@Entries;
}

=item HistoryEntryGet()

Returns a hash reference with information about a single history entry.
The hash reference contain information about:

    * HistoryEntryID
    * ConfigItemID
    * HistoryType
    * HistoryTypeID
    * Comment
    * CreatedBy
    * CreatedTime
    * UserID
    * UserLogin
    * UserLastname
    * UserFirstname

    my $Info = $HistoryObject->HistoryEntryGet(
        HistoryEntryID => 1234,
    );

=cut

sub HistoryEntryGet {
    my ( $Self, %Params ) = @_;

    # check needed stuff
    for my $Needed ( qw(HistoryEntryID) ) {
        if ( !$Params{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $SQL = qq~SELECT ch.id, ch.config_item_id, ch.content, ch.type_id,
                        ch.create_by, ch.create_time, cht.name
                    FROM configitem_history ch, configitem_history_type cht
                    WHERE ch.type_id = cht.id AND
                        ch.id = ?~;

    $Self->{DBObject}->Prepare(
        SQL  => $SQL,
        Bind => [ \$Params{HistoryEntryID} ],
    );

    my %Entry;

    my $UserObject = Kernel::System::User->new(
        %{$Self},
    );

    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {

        my %UserInfo = $UserObject->GetUserData(
            UserID => $Row[4],
            Cached => 1
        );

        %Entry = (
            HistoryEntryID => $Row[0],
            ConfigItemID   => $Row[1],
            Comment        => $Row[2],
            HistoryTypeID  => $Row[3],
            CreateBy       => $Row[4],
            CreateTime     => $Row[5],
            HistoryType    => $Row[6],
            UserID         => $UserInfo{UserID},
            UserLogin      => $UserInfo{UserLogin},
            UserFirstname  => $UserInfo{UserFirstname},
            UserLastname   => $UserInfo{UserLastname},
        );
    }

    return \%Entry;
}

=item HistoryAdd()

Adds a single history entry to the history.

    $HistoryObject->HistoryAdd(
        ConfigItemID  => 1234,
        HistoryType   => 'NewConfigItem', # either HistoryType or HistoryTypeID is needed
        HistoryTypeID => 1,
        UserID        => 1,
        Comment       => 'Any useful information',
    );

=cut

sub HistoryAdd {
    my ( $Self, %Params ) = @_;

    # check needed stuff
    for my $Needed ( qw(ConfigItemID UserID Comment) ) {
        if ( !$Params{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    if ( ! ( $Params{HistoryType} || $Params{HistoryTypeID} ) ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => "Need HistoryType or HistoryTypeID!" );
        return;
    }

    # get history type id from history type if history type is given.
    if ( $Params{HistoryType} ) {
        my $SQL = qq~SELECT id FROM configitem_history_type WHERE name = ? AND valid_id = 1~;
        $Self->{DBObject}->Prepare(
            SQL  => $SQL,
            Bind => [ \$Params{HistoryType} ],
        );

        my ($Id);

        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $Id = $Row[0];
        }

        if ( !$Id ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Invalid history type given!" );
            return;
        }

        $Self->{LogObject}->Log( Priority => 'notice', Message => $Params{HistoryType} . ' => ' . $Id );

        $Params{HistoryTypeID} = $Id;
    }
    elsif ( $Params{HistoryTypeID} ) {
        my $SQL = qq~SELECT id FROM configitem_history_type WHERE id = ? AND valid_id = 1~;
        $Self->{DBObject}->Prepare(
            SQL  => $SQL,
            Bind => [ \$Params{HistoryTypeID} ],
        );

        my ($Id);

        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $Id = $Row[0];
        }

        if ( !$Id ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Invalid history type id given!" );
            return;
        }

        $Params{HistoryTypeID} = $Id;
    }

    if ( $Params{ConfigItemID} ) {
        my $SQL = qq~SELECT id FROM configitem WHERE id = ?~;
        $Self->{DBObject}->Prepare(
            SQL  => $SQL,
            Bind => [ \$Params{ConfigItemID} ],
        );

        my ($Id);

        while ( my @Row = $Self->{DBObject}->FetchrowArray() ) {
            $Id = $Row[0];
        }

        if ( !$Id ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Invalid config item id given!" );
            return;
        }
    }

    my $InsertSQL = qq~INSERT INTO configitem_history (
                            config_item_id, content, create_by, create_time, type_id )
                        VALUES ( ?, ?, ?, current_timestamp, ? )~;

    $Self->{DBObject}->Do(
        SQL  => $InsertSQL,
        Bind => [
            \$Params{ConfigItemID},
            \$Params{Comment},
            \$Params{UserID},
            \$Params{HistoryTypeID},
        ],
    );
}

=item HistoryDelete()

Deletes complete history for a given config item

    $HistoryObject->HistoryDelete(
        ConfigItemID => 123,
    );

=cut

sub HistoryDelete {
    my ( $Self, %Params ) = @_;

    # check needed stuff
    for my $Needed ( qw(ConfigItemID) ) {
        if ( !$Params{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $SQL = qq~DELETE FROM configitem_history WHERE config_item_id = ?~;

    $Self->{DBObject}->Do(
        SQL  => $SQL,
        Bind => [ \$Params{ConfigItemID} ],
    );
}

=item HistoryEntryDelete()

Deletes a single history entry.

    $HistoryObject->HistoryEntryDelete(
        HistoryEntryID => 123,
    );

=cut

sub HistoryEntryDelete {
    my ( $Self, %Params ) = @_;

    # check needed stuff
    for my $Needed ( qw(HistoryEntryID) ) {
        if ( !$Params{$Needed} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $Needed!" );
            return;
        }
    }

    my $SQL = qq~DELETE FROM configitem_history WHERE id = ?~;

    $Self->{DBObject}->Do(
        SQL  => $SQL,
        Bind => [ \$Params{HistoryEntryID} ],
    );
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/gpl-2.0.txt.

=cut

=head1 VERSION

$Revision: 1.3 $ $Date: 2009-07-31 12:19:51 $

=cut