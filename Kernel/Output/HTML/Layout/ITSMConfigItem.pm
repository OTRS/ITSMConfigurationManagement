# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::Layout::ITSMConfigItem;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::Output::HTML::Layout::ITSMConfigItem - all ConfigItem-related HTML functions

=head1 DESCRIPTION

All ITSM Configuration Management-related HTML functions

=head1 PUBLIC INTERFACE

=head2 ITSMConfigItemOutputStringCreate()

returns an output string

    my $String = $LayoutObject->ITSMConfigItemOutputStringCreate(
        Value => 11,       # (optional)
        Item  => $ItemRef,
        Print => 1,        # (optional, default 0)
    );

=cut

sub ITSMConfigItemOutputStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
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

=head2 ITSMConfigItemFormDataGet()

returns the values from the html form as hash reference

    my $FormDataRef = $LayoutObject->ITSMConfigItemFormDataGet(
        Key          => 'Item::1::Node::3',
        Item         => $ItemRef,
        ConfigItemID => 123,
    );

=cut

sub ITSMConfigItemFormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item ConfigItemID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
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

=head2 ITSMConfigItemInputCreate()

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
            $Kernel::OM->Get('Kernel::System::Log')->Log(
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

=head2 ITSMConfigItemSearchFormDataGet()

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
            $Kernel::OM->Get('Kernel::System::Log')->Log(
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

=head2 ITSMConfigItemSearchInputCreate()

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
            $Kernel::OM->Get('Kernel::System::Log')->Log(
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

=head2 _ITSMLoadLayoutBackend()

load a input type backend module

    $BackendObject = $LayoutObject->_ITSMLoadLayoutBackend(
        Type => 'GeneralCatalog',
    );

=cut

sub _ITSMLoadLayoutBackend {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    if ( !$Param{Type} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need Type!',
        );
        return;
    }

    my $GenericModule = "Kernel::Output::HTML::ITSMConfigItem::Layout$Param{Type}";

    # load the backend module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($GenericModule) ) {
        $LogObject->Log(
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
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't create a new instance of backend module $Param{Type}!",
        );
        return;
    }

    return $BackendObject;
}

=head2 ITSMConfigItemListShow()

Returns a list of configuration items with sort and pagination capabilities.

This function is similar to L<Kernel::Output::HTML::LayoutTicket::TicketListShow()>
in F<Kernel/Output/HTML/LayoutTicket.pm>.

    my $Output = $LayoutObject->ITSMConfigItemListShow(
        ConfigItemIDs => $ConfigItemIDsRef,                  # total list of config item ids, that can be listed
        Total         => scalar @{ $ConfigItemIDsRef },      # total number of list items, config items in this case
        View          => $Self->{View},                      # optional, the default value is 'Small'
        Filter        => 'All',
        Filters       => \%NavBarFilter,
        FilterLink    => $LinkFilter,
        TitleName     => 'Overview: Config Item: Computer',
        TitleValue    => $Self->{Filter},
        Env           => $Self,
        LinkPage      => $LinkPage,
        LinkSort      => $LinkSort,
        Frontend      => 'Agent',                           # optional (Agent|Customer), default: Agent, indicates from which frontend this function was called
    );

=cut

sub ITSMConfigItemListShow {
    my ( $Self, %Param ) = @_;

    # take object ref to local, remove it from %Param (prevent memory leak)
    my $Env = delete $Param{Env};

    # lookup latest used view mode
    if ( !$Param{View} && $Self->{ 'UserITSMConfigItemOverview' . $Env->{Action} } ) {
        $Param{View} = $Self->{ 'UserITSMConfigItemOverview' . $Env->{Action} };
    }

    # set frontend
    my $Frontend = $Param{Frontend} || 'Agent';

    # set defaut view mode to 'small'
    my $View = $Param{View} || 'Small';

    # store latest view mode
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'UserITSMConfigItemOverview' . $Env->{Action},
        Value     => $View,
    );

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get backend from config
    my $Backends = $ConfigObject->Get('ITSMConfigItem::Frontend::Overview');
    if ( !$Backends ) {
        return $LayoutObject->FatalError(
            Message => 'Need config option ITSMConfigItem::Frontend::Overview',
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $LayoutObject->FatalError(
            Message => 'Config option ITSMConfigItem::Frontend::Overview needs to be a HASH ref!',
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $LayoutObject->FatalError(
            Message => "No config option found for the view '$View'!",
        );
    }

    # nav bar
    my $StartHit = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => 'StartHit',
    ) || 1;

    # get personal page shown count
    my $PageShownPreferencesKey = 'UserConfigItemOverview' . $View . 'PageShown';
    my $PageShown               = $Self->{$PageShownPreferencesKey} || 10;
    my $Group                   = 'ConfigItemOverview' . $View . 'PageShown';

    # check start option, if higher then elements available, set
    # it to the last overview page (Thanks to Stefan Schmidt!)
    if ( $StartHit > $Param{Total} ) {
        my $Pages = int( ( $Param{Total} / $PageShown ) + 0.99999 );
        $StartHit = ( ( $Pages - 1 ) * $PageShown ) + 1;
    }

    # get data selection
    my %Data;
    my $Config = $ConfigObject->Get('PreferencesGroups');
    if ( $Config && $Config->{$Group} && $Config->{$Group}->{Data} ) {
        %Data = %{ $Config->{$Group}->{Data} };
    }

    # set page limit and build page nav
    my $Limit   = $Param{Limit} || 20_000;
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $Env->{Action},
        Link      => $Param{LinkPage},
    );

    # build shown ticket a page
    $Param{RequestedURL}    = $Param{RequestedURL} || "Action=$Self->{Action};$Param{LinkPage}";
    $Param{Group}           = $Group;
    $Param{PreferencesKey}  = $PageShownPreferencesKey;
    $Param{PageShownString} = $Self->BuildSelection(
        Name        => $PageShownPreferencesKey,
        SelectedID  => $PageShown,
        Data        => \%Data,
        Translation => 0,
        Sort        => 'NumericValue',
        Class       => 'Modernize',
    );

    # build navbar content
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => \%Param,
    );

    # back link
    if ( $Param{LinkBack} ) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageBack',
            Data => \%Param,
        );

        $LayoutObject->AddJSData(
            Key   => 'ITSMConfigItemSearch',
            Value => {
                Profile => $Param{Profile},
                ClassID => $Param{ClassID},
            },
        );
    }

    # get filters
    if ( $Param{Filters} ) {

        # get given filters
        my @NavBarFilters;
        for my $Prio ( sort keys %{ $Param{Filters} } ) {
            push @NavBarFilters, $Param{Filters}->{$Prio};
        }

        # build filter content
        $LayoutObject->Block(
            Name => 'OverviewNavBarFilter',
            Data => {
                %Param,
            },
        );

        # loop over filters
        my $Count = 0;
        for my $Filter (@NavBarFilters) {

            # increment filter count and build filter item
            $Count++;
            $LayoutObject->Block(
                Name => 'OverviewNavBarFilterItem',
                Data => {
                    %Param,
                    %{$Filter},
                },
            );

            # filter is selected
            if ( $Filter->{Filter} eq $Param{Filter} ) {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelected',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
            else {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelectedNot',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
        }
    }

    # loop over configured backends
    for my $Backend ( sort keys %{$Backends} ) {

        # build navbar view mode
        $LayoutObject->Block(
            Name => 'OverviewNavBarViewMode',
            Data => {
                %Param,
                %{ $Backends->{$Backend} },
                Filter => $Param{Filter},
                View   => $Backend,
            },
        );

        # current view is configured in backend
        if ( $View eq $Backend ) {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeNotSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
    }

    # check if page nav is available
    if (%PageNav) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageNavBar',
            Data => \%PageNav,
        );

        # don't show context settings in AJAX case (e. g. in customer ticket history),
        #   because the submit with page reload will not work there
        if ( !$Param{AJAX} ) {
            $LayoutObject->Block(
                Name => 'ContextSettings',
                Data => {
                    %PageNav,
                    %Param,
                },
            );
        }
    }

    # check if bulk feature is enabled
    my $BulkFeature = 0;
    if ( $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeature') ) {
        my @Groups;
        if ( $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeatureGroup') ) {
            @Groups = @{ $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeatureGroup') };
        }
        if ( !@Groups ) {
            $BulkFeature = 1;
        }
        else {
            GROUP:
            for my $Group (@Groups) {
                next GROUP if !$Kernel::OM->Get('Kernel::System::Group')->PermissionCheck(
                    UserID    => $Self->{UserID},
                    GroupName => $Group,
                    Type      => 'rw',
                );

                $BulkFeature = 1;
                last GROUP;
            }
        }
    }

    # show the bulk action button if feature is enabled
    if ($BulkFeature) {
        $LayoutObject->Block(
            Name => 'BulkAction',
            Data => {
                %PageNav,
                %Param,
            },
        );
    }

    # build html content
    my $OutputNavBar = $LayoutObject->Output(
        TemplateFile => 'AgentITSMConfigItemOverviewNavBar',
        Data         => {%Param},
    );

    # create output
    my $OutputRaw = '';
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$OutputNavBar,
        );
    }
    else {
        $OutputRaw .= $OutputNavBar;
    }

    # load module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( $Backends->{$View}->{Module} ) ) {
        return $LayoutObject->FatalError();
    }

    # check for backend object
    my $Object = $Backends->{$View}->{Module}->new( %{$Env} );
    return if !$Object;

    # run module
    my $Output = $Object->Run(
        %Param,
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Frontend  => $Frontend,
    );

    # create output
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$Output,
        );
    }
    else {
        $OutputRaw .= $Output;
    }

    # create overview nav bar
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => {%Param},
    );

    # return content if available
    return $OutputRaw;
}

=head2 XMLData2Hash()

returns a hash reference with the requested attributes data for a config item

Return

    $Data = {
        'HardDisk::2' => {
            Value => 'HD2',
            Name  => 'Hard Disk',
         },
        'CPU::1' => {
            Value => '',
            Name  => 'CPU',
        },
        'HardDisk::2::Capacity::1' => {
            Value => '780 GB',
            Name  => 'Capacity',
        },
    };

    my $Data = $LayoutObject->XMLData2Hash(
        XMLDefinition => $Version->{XMLDefinition},
        XMLData       => $Version->{XMLData}->[1]->{Version}->[1],
        Attributes    => ['CPU::1', 'HardDrive::2::Capacity::1', ...],
        Data          => \%DataHashRef,                                 # optional
        Prefix        => 'HardDisk::1',                                 # optional
    );

=cut

sub XMLData2Hash {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLData};
    return if !$Param{XMLDefinition};
    return if !$Param{Attributes};
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{Attributes} ne 'ARRAY';

    # to store the return data
    my $Data = $Param{Data} || {};

    # create a lookup structure
    my %RelevantAttributes = map { $_ => 1 } @{ $Param{Attributes} };

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        my $CountMax = $Item->{CountMax} || 1;

        COUNTER:
        for my $Counter ( 1 .. $CountMax ) {

            # add prefix
            my $Prefix = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $Prefix = $Param{Prefix} . '::' . $Prefix;
            }

            # skip not needed elements and sub elements
            next COUNTER if !grep { $_ =~ m{\A$Prefix} } @{ $Param{Attributes} };

            # lookup value
            my $Value = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLValueLookup(
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content} // '',
            );

            # only if value is defined
            if ( defined $Value ) {

                # create output string
                $Value = $Self->ITSMConfigItemOutputStringCreate(
                    Value => $Value,
                    Item  => $Item,
                    Print => $Param{Print},
                );
            }

            if ( $RelevantAttributes{$Prefix} ) {

                # store the item in hash
                $Data->{$Prefix} = {
                    Name  => $Item->{Name},
                    Value => $Value // '',
                };
            }

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $Data = $Self->XMLData2Hash(
                    XMLDefinition => $Item->{Sub},
                    XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                    Prefix        => $Prefix,
                    Data          => $Data,
                    Attributes    => $Param{Attributes},
                );
            }
        }
    }

    return $Data;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
