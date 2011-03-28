# --
# Kernel/Output/HTML/LinkObjectITSMConfigItem.pm - layout backend module
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: LinkObjectITSMConfigItem.pm,v 1.12 2011-03-28 17:59:13 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::LinkObjectITSMConfigItem;

use strict;
use warnings;

use Kernel::Output::HTML::Layout;
use Kernel::System::GeneralCatalog;
use Kernel::System::ITSMConfigItem;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.12 $) [1];

=head1 NAME

Kernel::Output::HTML::LinkObjectITSMConfigItem - layout backend module

=head1 SYNOPSIS

All layout functions of link object (config item)

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::LinkObjectITSMConfigItem->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ConfigObject LogObject MainObject DBObject UserObject EncodeObject
        QueueObject GroupObject ParamObject TimeObject LanguageObject UserLanguage UserID)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }
    $Self->{LayoutObject}         = Kernel::Output::HTML::Layout->new( %{$Self} );
    $Self->{GeneralCatalogObject} = Kernel::System::GeneralCatalog->new( %{$Self} );
    $Self->{ConfigItemObject}     = Kernel::System::ITSMConfigItem->new( %{$Self} );

    # define needed variables
    $Self->{ObjectData} = {
        Object   => 'ITSMConfigItem',
        Realname => 'ConfigItem',
    };

    return $Self;
}

=item TableCreateComplex()

return an array with the block data

Return

    @BlockData = (
        {
            Object    => 'ITSMConfigItem',
            Blockname => 'ConfigItem Computer',
            Headline  => [
                {
                    Content => '',
                    Width   => 20,
                },
                {
                    Content => 'ConfigItem#',
                    Width   => 100,
                },
                {
                    Content => 'Name',
                },
                {
                    Content => 'Deployment State',
                    Width   => 130,
                },
                {
                    Content => 'Created',
                    Width   => 130,
                },
            ],
            ItemList => [
                [
                    {
                        Type             => 'CurInciSignal',
                        Key              => '123',
                        Content          => 'Incident',
                        CurInciStateType => 'incident',
                    },
                    {
                        Type    => 'Link',
                        Content => '123',
                        Link    => 'Action=AgentITSMConfigItemZoom;ConfigItemID=123',
                    },
                    {
                        Type      => 'Text',
                        Content   => 'The Name of the Config Item',
                        MaxLength => 50,
                    },
                    {
                        Type      => 'Text',
                        Content   => 'In Repair',
                        Translate => 1,
                    },
                    {
                        Type    => 'TimeLong',
                        Content => '2008-01-01 12:12:00',
                    },
                ],
                [
                    {
                        Type             => 'CurInciSignal',
                        Key              => '234',
                        Content          => 'Incident',
                        CurInciStateType => 'incident',
                    },
                    {
                        Type    => 'Link',
                        Content => '234',
                        Link    => 'Action=AgentITSMConfigItemZoom;ConfigItemID=234',
                    },
                    {
                        Type      => 'Text',
                        Content   => 'The Name of the Config Item 234',
                        MaxLength => 50,
                    },
                    {
                        Type      => 'Text',
                        Content   => 'Productive',
                        Translate => 1,
                    },
                    {
                        Type    => 'TimeLong',
                        Content => '2007-11-11 12:12:00',
                    },
                ],
            ],
        },
    );

    @BlockData = $LinkObject->TableCreateComplex(
        ObjectLinkListWithData => $ObjectLinkListRef,
    );

=cut

sub TableCreateComplex {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ObjectLinkListWithData} || ref $Param{ObjectLinkListWithData} ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ObjectLinkListWithData!',
        );
        return;
    }

    # convert the list
    my %LinkList;
    for my $LinkType ( keys %{ $Param{ObjectLinkListWithData} } ) {

        # extract link type List
        my $LinkTypeList = $Param{ObjectLinkListWithData}->{$LinkType};

        for my $Direction ( keys %{$LinkTypeList} ) {

            # extract direction list
            my $DirectionList = $Param{ObjectLinkListWithData}->{$LinkType}->{$Direction};

            CONFIGITEMID:
            for my $ConfigItemID ( keys %{$DirectionList} ) {

                # extract class
                my $Class = $DirectionList->{$ConfigItemID}->{Class} || '';

                next CONFIGITEMID if !$Class;

                $LinkList{$Class}->{$ConfigItemID}->{Data} = $DirectionList->{$ConfigItemID};
            }
        }
    }

    my @BlockData;
    for my $Class ( sort { lc $a cmp lc $b } keys %LinkList ) {

        # extract config item data
        my $ConfigItemList = $LinkList{$Class};

        # create the item list
        my @ItemList;
        for my $ConfigItemID (
            sort { $ConfigItemList->{$a}->{Data}->{Name} cmp $ConfigItemList->{$b}->{Data}->{Name} }
            keys %{$ConfigItemList}
            )
        {

            # extract version data
            my $Version = $ConfigItemList->{$ConfigItemID}->{Data};

            my @ItemColumns = (
                {
                    Type             => 'CurInciSignal',
                    Key              => $ConfigItemID,
                    Content          => $Version->{CurInciState},
                    CurInciStateType => $Version->{CurInciStateType},
                },
                {
                    Type    => 'Link',
                    Content => $Version->{Number},
                    Link    => '$Env{"Baselink"}Action=AgentITSMConfigItemZoom;ConfigItemID='
                        . $ConfigItemID,
                },
                {
                    Type      => 'Text',
                    Content   => $Version->{Name},
                    MaxLength => 50,
                },
                {
                    Type      => 'Text',
                    Content   => $Version->{CurDeplState},
                    Translate => 1,
                },
                {
                    Type    => 'TimeLong',
                    Content => $Version->{CreateTime},
                },
            );

            push @ItemList, \@ItemColumns;
        }

        return if !@ItemList;

        # define the block data
        my %Block = (
            Object    => $Self->{ObjectData}->{Object},
            Blockname => $Self->{ObjectData}->{Realname} . ' (' . $Class . ')',
            Headline  => [
                {
                    Content => 'Incident State',
                    Width   => 20,
                },
                {
                    Content => 'ConfigItem#',
                    Width   => 100,
                },
                {
                    Content => 'Name',
                },
                {
                    Content => 'Deployment State',
                    Width   => 130,
                },
                {
                    Content => 'Created',
                    Width   => 130,
                },
            ],
            ItemList => \@ItemList,
        );

        push @BlockData, \%Block;
    }

    return @BlockData;
}

=item TableCreateSimple()

return a hash with the link output data

Return

    %LinkOutputData = (
        Normal::Source => {
            ITSMConfigItem => [
                {
                    Type    => 'Link',
                    Content => 'CI:55555',
                    Title   => 'ConfigItem# 555555: The config item name',
                    Css     => 'style="text-decoration: line-through"',
                },
                {
                    Type    => 'Link',
                    Content => 'CI:22222',
                    Title   => 'ConfigItem# 22222: Title of config name 22222',
                },
            ],
        },
        ParentChild::Target => {
            ITSMConfigItem => [
                {
                    Type    => 'Link',
                    Content => 'CI:77777',
                    Title   => 'ConfigItem# 77777: ConfigItem name',
                },
            ],
        },
    );

    %LinkOutputData = $LinkObject->TableCreateSimple(
        ObjectLinkListWithData => $ObjectLinkListRef,
    );

=cut

sub TableCreateSimple {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ObjectLinkListWithData} || ref $Param{ObjectLinkListWithData} ne 'HASH' ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need ObjectLinkListWithData!',
        );
        return;
    }

    my %LinkOutputData;
    for my $LinkType ( keys %{ $Param{ObjectLinkListWithData} } ) {

        # extract link type List
        my $LinkTypeList = $Param{ObjectLinkListWithData}->{$LinkType};

        for my $Direction ( keys %{$LinkTypeList} ) {

            # extract direction list
            my $DirectionList = $Param{ObjectLinkListWithData}->{$LinkType}->{$Direction};

            my @ItemList;
            for my $ConfigItemID ( sort { $a <=> $b } keys %{$DirectionList} ) {

                # extract config item data
                my $Version = $DirectionList->{$ConfigItemID};

                # define item data
                my %Item = (
                    Type    => 'Link',
                    Content => 'CI:' . $Version->{Number},
                    Title => "ConfigItem# $Version->{Number} ($Version->{Class}): $Version->{Name}",
                    Link  => '$Env{"Baselink"}Action=AgentITSMConfigItemZoom;ConfigItemID='
                        . $ConfigItemID,
                );

                push @ItemList, \%Item;
            }

            # add item list to link output data
            $LinkOutputData{ $LinkType . '::' . $Direction }->{ITSMConfigItem} = \@ItemList;
        }
    }

    return %LinkOutputData;
}

=item ContentStringCreate()

return a output string

    my $String = $LayoutObject->ContentStringCreate(
        ContentData => $HashRef,
    );

=cut

sub ContentStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ContentData} ) {
        $Self->{LogObject}->Log( Priority => 'error', Message => 'Need ContentData!' );
        return;
    }

    # extract content
    my $Content = $Param{ContentData};

    return if $Content->{Type} ne 'CurInciSignal';

    # set incident signal
    my %InciSignals = (
        incident    => 'redled',
        operational => 'greenled',
        unknown     => 'grayled',
        warning     => 'yellowled',
    );

    # investigate current incident signal
    $Content->{CurInciStateType} ||= 'unknown';
    my $CurInciSignal = $InciSignals{ $Content->{CurInciStateType} };
    $CurInciSignal ||= $InciSignals{unknown};

    my $String = $Self->{LayoutObject}->Output(
        Template => '<div class="Flag Small" title="$QData{"CurInciState"}"> '
            . '<span class="$QData{"CurInciSignal"}"></span> </div>',
        Data => {
            CurInciSignal => $CurInciSignal,
            CurInciState => $Content->{Content} || '',
        },
    );

    return $String;
}

=item SelectableObjectList()

return an array hash with selectable objects

Return

    @SelectableObjectList = (
        {
            Key      => '-',
            Value    => 'ConfigItem',
            Disabled => 1,
        },
        {
            Key   => 'ITSMConfigItem::25',
            Value => 'ConfigItem::Computer',
        },
        {
            Key   => 'ITSMConfigItem::26',
            Value => 'ConfigItem::Software',
        },
        {
            Key   => 'ITSMConfigItem::27',
            Value => 'ConfigItem::Network',
        },
    );

    @SelectableObjectList = $LinkObject->SelectableObjectList(
        Selected => $Identifier,  # (optional)
    );

=cut

sub SelectableObjectList {
    my ( $Self, %Param ) = @_;

    # define headline
    my @ObjectSelectList = (
        {
            Key      => '-',
            Value    => $Self->{ObjectData}->{Realname},
            Disabled => 1,
        }
    );

    # get class list
    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    return if !$ClassList;
    return if ref $ClassList ne 'HASH';

    # get the config with the default subobjects
    my $DefaultSubobject = $Self->{ConfigObject}->Get('LinkObject::DefaultSubObject') || {};

    CLASSID:
    for my $ClassID ( sort { lc $ClassList->{$a} cmp lc $ClassList->{$b} } keys %{$ClassList} ) {

        # show class only if user has access rights
        my $HasAccess = $Self->{ConfigItemObject}->Permission(
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
            Type    => 'rw',
        );

        next CLASSID if !$HasAccess;

        my $Class = $ClassList->{$ClassID} || '';
        my $Identifier = $Self->{ObjectData}->{Object} . '::' . $ClassID;

        # set selected flag
        my $Selected;
        if ( $Param{Selected} ) {

            if ( $Param{Selected} eq $Identifier ) {
                $Selected = 1;
            }
            elsif (
                $Param{Selected} eq $Self->{ObjectData}->{Object}
                && $DefaultSubobject->{ $Self->{ObjectData}->{Object} }
                )
            {

                # extract default class name
                my $DefaultClass = $DefaultSubobject->{ITSMConfigItem} || '';

                # check class
                if ( $DefaultClass eq $Class ) {
                    $Selected = 1;
                }
            }
        }

        # create row
        my %Row = (
            Key      => $Identifier,
            Value    => $Self->{ObjectData}->{Realname} . '::' . $Class,
            Selected => $Selected,
        );

        push @ObjectSelectList, \%Row;
    }

    return @ObjectSelectList;
}

=item SearchOptionList()

return an array hash with search options

Return

    @SearchOptionList = (
        {
            Key       => 'Number',
            Name      => 'ConfigItem#',
            InputStrg => $FormString,
            FormData  => '1234',
        },
        {
            Key       => 'Name',
            Name      => 'Name',
            InputStrg => $FormString,
            FormData  => 'BlaBla',
        },
    );

    @SearchOptionList = $LinkObject->SearchOptionList(
        SubObject => '25',  # (optional)
    );

=cut

sub SearchOptionList {
    my ( $Self, %Param ) = @_;

    # search option list
    my @SearchOptionList = (
        {
            Key  => 'Number',
            Name => 'ConfigItem#',
            Type => 'Text',
        },
        {
            Key  => 'Name',
            Name => 'Name',
            Type => 'Text',
        },
        {
            Key  => 'DeplStateIDs',
            Name => 'Deployment State',
            Type => 'List',
        },
        {
            Key  => 'InciStateIDs',
            Name => 'Incident State',
            Type => 'List',
        },
    );

    # add object dependence attributes
    #if ( $Param{SubObject} ) {
    #
    #    # get class list
    #    my $ClassList = $Self->{GeneralCatalogObject}->ItemList(
    #        Class => 'ITSM::ConfigItem::Class',
    #    );
    #
    #    if ( $ClassList && $ClassList eq 'HASH' ) {
    #
    #        # add here the search attributes of the subobject!
    #    }
    #}

    # add formkey
    for my $Row (@SearchOptionList) {
        $Row->{FormKey} = 'SEARCH::' . $Row->{Key};
    }

    # add form data and input string
    ROW:
    for my $Row (@SearchOptionList) {

        # prepare text input fields
        if ( $Row->{Type} eq 'Text' ) {

            # get form data
            $Row->{FormData} = $Self->{ParamObject}->GetParam( Param => $Row->{FormKey} );

            # parse the input text block
            $Self->{LayoutObject}->Block(
                Name => 'InputText',
                Data => {
                    Key => $Row->{FormKey},
                    Value => $Row->{FormData} || '',
                },
            );

            # add the input string
            $Row->{InputStrg} = $Self->{LayoutObject}->Output(
                TemplateFile => 'LinkObject',
            );

            next ROW;
        }

        # prepare list boxes
        if ( $Row->{Type} eq 'List' ) {

            # get form data
            my @FormData = $Self->{ParamObject}->GetArray( Param => $Row->{FormKey} );
            $Row->{FormData} = \@FormData;

            # prepare deployment state list
            my %ListData;
            if ( $Row->{Key} eq 'DeplStateIDs' ) {

                # get deployment state list
                my $DeplStateList = $Self->{GeneralCatalogObject}->ItemList(
                    Class => 'ITSM::ConfigItem::DeploymentState',
                );

                # add list
                if ( $DeplStateList && ref $DeplStateList eq 'HASH' ) {
                    %ListData = %{$DeplStateList};
                }
            }

            # prepare incident state list
            elsif ( $Row->{Key} eq 'InciStateIDs' ) {

                # get incident state list
                my $InciStateList = $Self->{GeneralCatalogObject}->ItemList(
                    Class => 'ITSM::Core::IncidentState',
                );

                # add list
                if ( $InciStateList && ref $InciStateList eq 'HASH' ) {
                    %ListData = %{$InciStateList};
                }
            }

            # add the input string
            $Row->{InputStrg} = $Self->{LayoutObject}->BuildSelection(
                Data       => \%ListData,
                Name       => $Row->{FormKey},
                SelectedID => $Row->{FormData},
                Size       => 3,
                Multiple   => 1,
            );

            next ROW;
        }
    }

    return @SearchOptionList;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

=head1 VERSION

$Revision: 1.12 $ $Date: 2011-03-28 17:59:13 $

=cut
