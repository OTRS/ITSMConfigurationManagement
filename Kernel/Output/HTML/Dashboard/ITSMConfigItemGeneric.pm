# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::Dashboard::ITSMConfigItemGeneric;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {%Param};
    bless( $Self, $Type );

    # Get needed parameters.
    for my $Needed (qw(Config Name UserID)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    # Get param object.
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Get current filter.
    my $Name           = $ParamObject->GetParam( Param => 'Name' ) || '';
    my $PreferencesKey = 'DashboardITSMConfigItemGeneric' . $Self->{Name};
    if ( $Self->{Name} eq $Name ) {
        $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || '';
    }

    # Get config object.
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # Remember filter.
    if ( $Self->{Filter} ) {

        # Update session.
        $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => $PreferencesKey,
            Value     => $Self->{Filter},
        );

        # Update preferences.
        if ( !$ConfigObject->Get('DemoSystem') ) {
            $Kernel::OM->Get('Kernel::System::User')->SetPreferences(
                UserID => $Self->{UserID},
                Key    => $PreferencesKey,
                Value  => $Self->{Filter},
            );
        }
    }

    # Set default filter if not set yet.
    if ( !$Self->{Filter} ) {
        $Self->{Filter} = $Self->{$PreferencesKey} || $Self->{Config}->{Filter} || 'All';
    }

    # Setup the prefrences keys.
    $Self->{PrefKeyShown}   = 'DashboardITSMConfigItemGeneric' . $Self->{Name} . '-Shown';
    $Self->{PrefKeyRefresh} = 'DashboardITSMConfigItemGeneric' . $Self->{Name} . '-Refresh';

    $Self->{PageShown} = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{ $Self->{PrefKeyShown} }
        || $Self->{Config}->{Limit} || 10;

    $Self->{PageRefresh} = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{ $Self->{PrefKeyRefresh} }
        || 1;

    $Self->{StartHit} = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );

    return $Self;
}

sub Preferences {
    my ( $Self, %Param ) = @_;

    my @Params = (
        {
            Desc  => Translatable('Shown config items'),
            Name  => $Self->{PrefKeyShown},
            Block => 'Option',
            Data  => {
                5  => ' 5',
                10 => '10',
                15 => '15',
                20 => '20',
                25 => '25',
                30 => '30',
            },
            SelectedID  => $Self->{PageShown},
            Translation => 0,
        },
    );

    return @Params;
}

sub Config {
    my ( $Self, %Param ) = @_;

    return (
        %{ $Self->{Config} },

        # Remember, do not allow to use page cache
        # (it's not working because of internal filter)
        CacheKey => undef,
        CacheTTL => undef,
    );
}

sub Run {
    my ( $Self, %Param ) = @_;

    # Get param object.
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Get layout object.
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # Get sorting parameters.
    $Param{SortBy} = $ParamObject->GetParam( Param => 'SortBy' ) || 'Number';

    # Get ordering parameters.
    $Param{OrderBy} = $ParamObject->GetParam( Param => 'OrderBy' ) || 'Up';

    # Set Sort and Order by as Arrays.
    my @SortByArray  = ( $Param{SortBy} );
    my @OrderByArray = ( $Param{OrderBy} );

    # Get general catalog object.
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # Get class list.
    my $ClassList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # To store the color for the deployment states.
    my %DeplSignals;

    # Get list of deployment states.
    my $DeploymentStatesList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # Set deployment style colors.
    my $StyleClasses = '';

    # To store depl state ids.
    my $DeplStateIDs;

    ITEMID:
    for my $ItemID ( sort keys %{$DeploymentStatesList} ) {

        # Get deployment state preferences.
        my %Preferences = $GeneralCatalogObject->GeneralCatalogPreferencesGet(
            ItemID => $ItemID,
        );

        # Check if a color is defined in preferences.
        next ITEMID if !$Preferences{Color};

        # Get deployment state.
        my $DeplState = $DeploymentStatesList->{$ItemID};

        # Remove any non ascii word characters.
        $DeplState =~ s{ [^a-zA-Z0-9] }{_}msxg;

        # Store the original deployment state as key
        # and the ss safe coverted deployment state as value.
        $DeplSignals{ $DeploymentStatesList->{$ItemID} } = $DeplState;

        # Convert to lower case.
        my $DeplStateColor = lc $Preferences{Color};

        # Add to style classes string.
        $StyleClasses .= "
            .Flag span.$DeplState {
                background-color: #$DeplStateColor;
            }
        ";

        # Set depl state ids.
        push @{$DeplStateIDs}, $ItemID;
    }

    # Wrap into style tags.
    if ($StyleClasses) {
        $StyleClasses = "<style>$StyleClasses</style>";
    }

    # To store the default class.
    my $ClassIDAuto = '';

    # To store the NavBar filters.
    my %Filters;

    # Define position of the filter in the frontend.
    my $PrioCounter = 1000;

    # To store the total number of config items in all classes that the user has access.
    my $TotalCount;

    # To store all the clases that the user has access, used in search for filter 'All'.
    my $AccessClassList;

    # Get config item object.
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # Define incident signals, needed for services.
    my %InciSignals = (
        Translatable('operational') => 'greenled',
        Translatable('warning')     => 'yellowled',
        Translatable('incident')    => 'redled',
    );

    CLASSID:
    for my $ClassID ( sort { ${$ClassList}{$a} cmp ${$ClassList}{$b} } keys %{$ClassList} ) {

        # Check permission.
        my $HasAccess = $ConfigItemObject->Permission(
            Scope   => 'Class',
            ClassID => $ClassID,
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        next CLASSID if !$HasAccess;

        # Insert this class to be passed as search parameter for filter 'All'.
        push @{$AccessClassList}, $ClassID;

        # Increase the PrioCounter.
        $PrioCounter++;

        # Add filter with params for the search method.
        $Filters{$ClassID} = {
            Name   => $ClassList->{$ClassID},
            Prio   => $PrioCounter,
            Search => {
                ClassIDs         => [$ClassID],
                DeplStateIDs     => $DeplStateIDs,
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => $Self->{SearchLimit},
            },
        };

        # Remember the first class id to show this in the overview
        # if no class id was given.
        if ( !$ClassIDAuto ) {
            $ClassIDAuto = $ClassID;
        }
    }

    # If only one filter exists.
    if ( scalar keys %Filters == 1 ) {

        # Get the name of the only filter.
        my ($FilterKey) = keys %Filters;

        # Activate this filter.
        $Self->{Filter} = $Filters{$FilterKey}->{Name};
    }
    else {

        # Add default filter, which shows all items.
        $Filters{All} = {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                ClassIDs         => $AccessClassList,
                DeplStateIDs     => $DeplStateIDs,
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => $Self->{SearchLimit},
            },
        };

        # If no filter was selected activate the filter for the default class.
        if ( !$Self->{Filter} ) {
            $Self->{Filter} = $ClassIDAuto;
        }
    }

    # Get given filters.
    my @NavBarFilters;
    for my $Prio ( sort keys %Filters ) {
        push @NavBarFilters, $Filters{$Prio};
    }

    # Sort according to prio.
    @NavBarFilters = sort { $a->{Prio} <=> $b->{Prio} } @NavBarFilters;

    # Find out which columns should be shown.
    my @ShowColumns;
    my @XMLShowColumns;
    if ( $Self->{Config}->{DefaultColumns} ) {

        # Get all possible columns from config.
        my %PossibleColumn = %{ $Self->{Config}->{DefaultColumns} };

        # Show column "Class" if filter 'All' is selected.
        if ( $Self->{Filter} eq 'All' ) {
            $PossibleColumn{Class} = '1';
        }

        # Get the column names that should be shown.
        COLUMNNAME:
        for my $Name ( sort keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }
    }

    # Get frontend config.
    my ($Module) = $Self->{Action} =~ m{^Agent(.*)}xms;
    my $ShowColumnsByClassConfig
        = $Kernel::OM->Get('Kernel::Config')->Get( 'Frontend::Agent::' . $Module . '::ITSMConfigItem' );

    my $ShowColumnsByClass = $ShowColumnsByClassConfig->{ShowColumnsByClass} // '';

    # Get the configured columns and reorganize them by class name.
    if (
        IsArrayRefWithData($ShowColumnsByClass)
        && $Self->{Filter}
        && $Self->{Filter} ne 'All'
        )
    {

        my %ColumnByClass;
        NAME:
        for my $Name ( @{$ShowColumnsByClass} ) {
            my ( $Class, $Column ) = split /::/, $Name, 2;

            next NAME if !$Column;

            push @{ $ColumnByClass{$Class} }, $Column;
        }

        # Check if there is a specific column config for the selected class.
        if ( $ColumnByClass{ $Self->{Filter} } ) {
            @ShowColumns = @{ $ColumnByClass{ $Self->{Filter} } };
        }
    }

    if (@ShowColumns) {

        for my $Column (@ShowColumns) {

            # Create needed veriables.
            my $CSS = 'OverviewHeader';
            my $OrderBy;

            # Remove ID if necesary.
            if ( $Param{SortBy} ) {
                $Param{SortBy} = ( $Param{SortBy} eq 'InciStateID' )
                    ? 'CurInciState'
                    : ( $Param{SortBy} eq 'DeplStateID' ) ? 'CurDeplState'
                    : ( $Param{SortBy} eq 'ClassID' )     ? 'Class'
                    : ( $Param{SortBy} eq 'ChangeTime' )  ? 'LastChanged'
                    :                                       $Param{SortBy};
            }

            # Set the correct Set CSS class and order by link.
            if ( $Param{SortBy} && ( $Param{SortBy} eq $Column ) ) {
                if ( $Param{OrderBy} && ( $Param{OrderBy} eq 'Up' ) ) {
                    $OrderBy = 'Down';
                    $CSS .= ' SortDescendingLarge';
                }
                else {
                    $OrderBy = 'Up';
                    $CSS .= ' SortAscendingLarge';
                }
            }
            else {
                $OrderBy = 'Up';
            }

            # Set column.
            $Param{Column} = $Column;

            # Create header block.
            $LayoutObject->Block(
                Name => 'Record' . $Column . 'Header',
                Data => {
                    %Param,
                    CSS     => $CSS,
                    OrderBy => $OrderBy,
                },
            );
        }
    }

    # Get assigned config items (to customer or customer user).
    my $AssignedCIs = $Self->_AssignedCIsGet(
        Filter => $Self->{Filter},
    );
    my @AssignedConfigItemIDs = @{ $AssignedCIs->{ConfigItemIDs} };

    # Get all assigned config items for count.
    my $CountCIs = $Self->_AssignedCIsGet(
        Filter => 'All',
        Count  => 1,
    );

    # Create search with sorting parameters.
    my $AssignedConfigItemIDs;
    if ( IsArrayRefWithData( \@AssignedConfigItemIDs ) ) {
        $AssignedConfigItemIDs = $ConfigItemObject->ConfigItemSearch(
            ConfigItemIDs    => \@AssignedConfigItemIDs,
            OrderBy          => \@SortByArray,
            OrderByDirection => \@OrderByArray,
        );
    }

    # Clear old array and push new data.
    if ( IsArrayRefWithData($AssignedConfigItemIDs) ) {

        @AssignedConfigItemIDs = ();
        push @AssignedConfigItemIDs, @{$AssignedConfigItemIDs};
    }

    if (@ShowColumns) {

        # Get the XML column headers only if the filter is not set to 'all'
        # and if there are CIs to show.
        if ( $Self->{Filter} && $Self->{Filter} ne 'All' && @AssignedConfigItemIDs ) {

            # Get the version data of the first config item, including all the XML data
            # to get the column header names.
            my $ConfigItem = $ConfigItemObject->VersionGet(
                ConfigItemID => $AssignedConfigItemIDs[0],
                XMLDataGet   => 1,
            );

            # Convert the XML data into a hash.
            my $ExtendedVersionData = $LayoutObject->XMLData2Hash(
                XMLDefinition => $ConfigItem->{XMLDefinition},
                XMLData       => $ConfigItem->{XMLData}->[1]->{Version}->[1],
                Attributes    => \@ShowColumns,
            );

            # Get the xml columns (they contain ::).
            @XMLShowColumns = grep {/::/} @ShowColumns;

            COLUMN:
            for my $Column (@XMLShowColumns) {

                # Check if column exists in CI-Data.
                next COLUMN if !$ExtendedVersionData->{$Column}->{Name};

                # Show the xml attribute header.
                $LayoutObject->Block(
                    Name => 'RecordXMLAttributeHeader',
                    Data => {
                        %Param,
                        XMLAttributeHeader => $ExtendedVersionData->{$Column}->{Name},
                    },
                );
            }
        }
    }

    # Build filter content.
    $LayoutObject->Block(
        Name => 'OverviewNavBarFilter',
        Data => {
            %Filters,
        },
    );

    # Set summary for page nav.
    my %Summary;

    # Loop over filters.
    my $Count = 0;
    FILTER:
    for my $Filter (@NavBarFilters) {

        # Get count by assigned config item ids.
        $Filter->{Count} = $CountCIs->{ $Filter->{Name} } // '0';

        $Count++;
        if ( $Count == scalar @NavBarFilters ) {
            $Filter->{CSS} = 'Last';
        }
        $LayoutObject->Block(
            Name => 'OverviewNavBarFilterItem',
            Data => {
                %Param,
                %{$Filter},
            },
        );
        if ( $Filter->{Name} eq $Self->{Filter} ) {
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

        # Add filter to new hash.
        $Summary{ $Filter->{Name} } = \%{$Filter};
    }

    # Add page nav bar.
    my $Total = $Summary{ $Self->{Filter} }->{Count} || 0;

    my $LinkPage =
        'Subaction=Element;Name=' . $Self->{Name}
        . ';Filter=' . $Self->{Filter}
        . ';SortBy=' .  ( $Param{SortBy}  || '' )
        . ';OrderBy=' . ( $Param{OrderBy} || '' )
        . ';';

    if ( $Param{CustomerID} ) {
        $LinkPage .= 'CustomerID=' . $LayoutObject->LinkEncode( $Param{CustomerID} ) . ';';
    }
    if ( $Param{CustomerUserID} ) {
        $LinkPage .= 'CustomerUserID=' . $LayoutObject->LinkEncode( $Param{CustomerUserID} ) . ';';
    }

    my %PageNav = $LayoutObject->PageNavBar(
        StartHit    => $Self->{StartHit},
        PageShown   => $Self->{PageShown},
        AllHits     => $Total || 1,
        Action      => 'Action=' . $LayoutObject->{Action},
        Link        => $LinkPage,
        AJAXReplace => 'Dashboard' . $Self->{Name},
        IDPrefix    => 'Dashboard' . $Self->{Name},
        AJAX        => $Param{AJAX},
    );

    $LayoutObject->Block(
        Name => 'ContentLargeITSMConfigItemGenericFilterNavBar',
        Data => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
            %PageNav,
        },
    );

    # Show config items if there are some.
    my $Counter = 0;
    if (@AssignedConfigItemIDs) {

        # To store all data.
        my %Data;

        CONFIGITEMID:
        for my $ConfigItemID (@AssignedConfigItemIDs) {
            $Counter++;
            if (
                $Counter >= $Self->{StartHit}
                && $Counter < ( $Self->{PageShown} + $Self->{StartHit} )
                )
            {

                # Get config item data.
                my $ConfigItem = $ConfigItemObject->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 1,
                );

                next CONFIGITEMID if !$ConfigItem;

                # Convert the XML data into a hash.
                my $ExtendedVersionData = $LayoutObject->XMLData2Hash(
                    XMLDefinition => $ConfigItem->{XMLDefinition},
                    XMLData       => $ConfigItem->{XMLData}->[1]->{Version}->[1],
                    Attributes    => \@ShowColumns,
                );

                # Store config item data.
                %Data = %{$ConfigItem};

                # Build record block.
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %Param,
                        %Data,
                    },
                );

                # Build column record blocks.
                if (@ShowColumns) {

                    COLUMN:
                    for my $Column (@ShowColumns) {
                        $LayoutObject->Block(
                            Name => 'Record' . $Column,
                            Data => {
                                %Param,
                                %Data,
                                CurInciSignal => $InciSignals{ $Data{CurInciStateType} },
                                CurDeplSignal => $DeplSignals{ $Data{CurDeplState} },
                            },
                        );

                        # Show links if available.
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkStart',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkEnd',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                    }

                    COLUMN:
                    for my $Column (@XMLShowColumns) {

                        # Check if column exists in CI-Data.
                        next COLUMN if !$ExtendedVersionData->{$Column}->{Name};

                        # Convert to ascii text in case the value contains html.
                        my $Value = $Kernel::OM->Get('Kernel::System::HTMLUtils')
                            ->ToAscii( String => $ExtendedVersionData->{$Column}->{Value} // '' )
                            // '';

                        # Convert all whitespace and newlines to single spaces.
                        $Value =~ s{ \s+ }{ }gxms;

                        # Show the xml attribute data.
                        $LayoutObject->Block(
                            Name => 'RecordXMLAttribute',
                            Data => {
                                %Param,
                                XMLAttributeData => $Value,
                            },
                        );
                    }
                }
            }
        }
    }

    # If there are no config items to show, a no data found message is displayed in the table.
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {
                TotalColumns => scalar @ShowColumns,
            },
        );
    }

    my $NameHTML = $Self->{Name};
    $NameHTML =~ s{-}{_}xmsg;

    # Send data to JS.
    $LayoutObject->AddJSData(
        Key   => 'ITSMConfigItemGeneric',
        Value => {
            Name     => $Self->{Name},
            NameHTML => $NameHTML,
        },
    );

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardITSMConfigItemGeneric',
        Data         => {
            %{ $Self->{Config} },
            Name         => $Self->{Name},
            StyleClasses => $StyleClasses,
        },
        AJAX => $Param{AJAX},
    );

    return $Content;
}

sub _AssignedCIsGet {
    my ( $Self, %Param ) = @_;

    # Define cache key.
    my $CacheKey;
    if ( $Self->{CustomerID} ) {
        $CacheKey = 'AssignedCIs-' . $Param{Filter} . '-' . $Self->{CustomerID};
    }
    elsif ( $Self->{CustomerUserID} ) {
        $CacheKey = 'AssignedCIs-' . $Param{Filter} . '-' . $Self->{CustomerUserID};
    }
    else {
        $CacheKey = 'AssignedCIs-' . $Param{Filter} . '-' . $Self->{UserID};
    }

    my $Content = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => 'DashboardITSMConfigItemGeneric',
        Key  => $CacheKey,
    );
    return $Content if defined $Content && $Param{Count};

    # Get the defined param.
    my @Params = split /;/, $Self->{Config}->{Attributes};

    # Define result.
    my @ConfigItemIDs;
    my %Result;

    # Get key for CI search.
    my $ConfigItemKey = $Self->{Config}->{ConfigItemKey} // '';

    return if !$ConfigItemKey;

    # Get config item object.
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    STRING:
    for my $String (@Params) {
        next STRING if !$String;
        my ( $Key, $Value ) = split /=/, $String;

        if ( $Key eq 'CustomerCompany' ) {

            CLASS:
            for my $Class ( sort keys %{$ConfigItemKey} ) {

                # Skip other classes if filter is set.
                next CLASS if $Param{Filter} && ( $Param{Filter} ne $Class && $Param{Filter} ne 'All' );

                my $ClassID = $Self->_ClassIDByNameGet(
                    Value => $Class,
                );

                # Skip if we have no class id.
                next CLASS if !$ClassID;

                my @SearchKey = (
                    {
                        "[1]{'Version'}[1]{'$ConfigItemKey->{$Class}'}[%]{'Content'}" => $Self->{CustomerID},
                    }
                );

                # Perform config item search (extended).
                my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearchExtended(
                    ClassIDs => [$ClassID],
                    What     => \@SearchKey,
                );

                next CLASS if !IsArrayRefWithData($ConfigItemIDs);

                push @ConfigItemIDs, @{$ConfigItemIDs};

                # Count config items per class.
                if ( $Param{Count} ) {
                    $Result{$Class} = scalar @{$ConfigItemIDs};
                }
            }
        }
        elsif ( $Key eq 'Customer' ) {

            CLASS:
            for my $Class ( sort keys %{$ConfigItemKey} ) {

                # Skip other classes if filter is set.
                next CLASS if $Param{Filter} && ( $Param{Filter} ne $Class && $Param{Filter} ne 'All' );

                my $ClassID = $Self->_ClassIDByNameGet(
                    Value => $Class,
                );

                # Skip if we have no class id.
                next CLASS if !$ClassID;

                my @SearchKey = (
                    {
                        "[1]{'Version'}[1]{'$ConfigItemKey->{$Class}'}[%]{'Content'}" => $Self->{CustomerUserID},
                    }
                );

                # Perform config item search (extended).
                my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearchExtended(
                    ClassIDs => [$ClassID],
                    What     => \@SearchKey,
                );

                next CLASS if !IsArrayRefWithData($ConfigItemIDs);

                push @ConfigItemIDs, @{$ConfigItemIDs};

                # Count config items per class.
                if ( $Param{Count} ) {
                    $Result{$Class} = scalar @{$ConfigItemIDs};
                }
            }
        }
        else {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Need CustomerCompany or Customer as attribute.',
            );
            return;
        }
    }

    # Remove duplicated config item ids.
    my %TempConfigItemIDs = map { $_ => 1 } @ConfigItemIDs;
    @ConfigItemIDs = sort keys %TempConfigItemIDs;

    $Result{ConfigItemIDs} = \@ConfigItemIDs;

    # Add count for all items.
    if ( $Param{Count} ) {
        $Result{All} = scalar @ConfigItemIDs;
    }

    if ( $Self->{Config}->{CacheTTLLocal} && $Param{Count} ) {
        $Kernel::OM->Get('Kernel::System::Cache')->Set(
            Type  => 'DashboardITSMConfigItemGeneric',
            Key   => $CacheKey,
            Value => \%Result,
            TTL   => 2 * 60,
        );
    }

    return \%Result;
}

sub _ClassIDByNameGet {
    my ( $Self, %Param ) = @_;

    # Check needed stuff.
    if ( !$Param{Value} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need class name!",
        );
        return;
    }

    # Get general catalog object.
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # Get class list.
    my $ClassList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # Reverse class list.
    my %ClassName2ID = reverse %{$ClassList};

    # Get class id.
    my $ClassID = $ClassName2ID{ $Param{Value} };

    return if !$ClassID;

    #Initiate permission check.
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    my $HasAccess = $ConfigItemObject->Permission(
        Scope   => 'Class',
        ClassID => $ClassID,
        UserID  => $Self->{UserID},
        Type    => $Self->{Config}->{Permission},
    );
    return if !$HasAccess;

    # Return class id.
    return $ClassID;
}

1;
