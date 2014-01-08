# --
# Kernel/System/ITSMConfigItem/Permission/ItemClassGroupCheck.pm - check if a user can access an item
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Permission::ItemClassGroupCheck;

use strict;
use warnings;

use Kernel::System::Group;

=head1 NAME

Kernel::System::ITSMConfigItem::Permission::ItemClassGroupCheck - check if a user can access an item

=head1 SYNOPSIS

All config item functions.

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
    use Kernel::System::GeneralCatalog;
    use Kernel::System::ITSMConfigItem;
    use Kernel::System::ITSMConfigItem::Permission::ItemClassGroupCheck;

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
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
    );
    my $DBObject = Kernel::System::DB->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        MainObject   => $MainObject,
    );
    my $ConfigItemObject = Kernel::System::ITSMConfigItem->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    my $GeneralCatalogObject = Kernel::System::GeneralCatalog->new(
        ConfigObject => $ConfigObject,
        EncodeObject => $EncodeObject,
        LogObject    => $LogObject,
        DBObject     => $DBObject,
        MainObject   => $MainObject,
    );
    my $CheckObject = Kernel::System::ITSMConfigItem::Permission::ItemClassGroupCheck->new(
        ConfigObject         => $ConfigObject,
        EncodeObject         => $EncodeObject,
        LogObject            => $LogObject,
        DBObject             => $DBObject,
        MainObject           => $MainObject,
        ConfigItemObject     => $ConfigItemObject,
        GeneralCatalogObject => $GeneralCatalogObject,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for my $Object (
        qw(ConfigObject LogObject DBObject MainObject EncodeObject ConfigItemObject GeneralCatalogObject)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    $Self->{GroupObject} = Kernel::System::Group->new( %{$Self} );

    return $Self;
}

=item Run()

this method does the check if the user can access an item

    my $HasAccess = $CheckObject->Run(
        UserID => 123,
        Type   => 'ro',
        ItemID => 345,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(UserID Type ItemID)) {
        if ( !$Param{$Needed} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get config item data
    my $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
        ConfigItemID => $Param{ItemID},
    );

    # get Class data
    my $ClassItem = $Self->{GeneralCatalogObject}->ItemGet(
        ItemID => $ConfigItem->{ClassID}
    );

    # get user groups
    my @GroupIDs = $Self->{GroupObject}->GroupMemberList(
        UserID => $Param{UserID},
        Type   => $Param{Type},
        Result => 'ID',
        Cached => 1,
    );

    # looking for group id, return access if user is in group
    for my $GroupID (@GroupIDs) {
        return 1 if $ClassItem->{Permission} && $GroupID eq $ClassItem->{Permission};
    }

    # return no access
    return;
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
