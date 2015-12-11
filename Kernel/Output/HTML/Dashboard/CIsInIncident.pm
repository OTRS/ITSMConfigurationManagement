# --
# Kernel/Output/HTML/Dashboard/CIsInIncident.pm
# Copyright (C) TTO
# --

package Kernel::Output::HTML::Dashboard::CIsInIncident;

use strict;
use warnings;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Config',
    'Kernel::System::Web::Request',
    'Kernel::Output::HTML::Layout',
);


sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get current filter
    my $Name = $ParamObject->GetParam( Param => 'Name' ) || '';
    my $PreferencesKey = 'UserDashboardCIsInIncidentFilter' . $Self->{Name};
    
    if ( $Self->{Name} eq $Name ) {
        $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || '';
    }

    # remember filter
    if ( $Self->{Filter} ) {

        # update session
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => $PreferencesKey,
            Value     => $Self->{Filter},
        );

        # update preferences
        if ( !$ConfigObject->Get('DemoSystem') ) {
            $UserObject->SetPreferences(
                UserID => $Self->{UserID},
                Key    => $PreferencesKey,
                Value  => $Self->{Filter},
            );
        }
    }

    if ( !$Self->{Filter} ) {
        $Self->{Filter} = $Self->{$PreferencesKey} || 'All';
    }

    $Self->{PrefKey} = 'UserDashboardPref' . $Self->{Name} . '-Shown';

    $Self->{PageShown} = $Self->{LayoutObject}->{ $Self->{PrefKey} } || $Self->{Config}->{Limit};

    $Self->{StartHit} = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );

    $Self->{CacheKey} = $Self->{Name} . '::' . $Self->{Filter};

    return $Self;
}

sub Preferences {
    my ( $Self, %Param ) = @_;

    my @Params = (
        {
            Desc  => 'Shown',
            Name  => $Self->{PrefKey},
            Block => 'Option',
            Data  => {
                5  => ' 5',
                10 => '10',
                15 => '15',
                20 => '20',
                25 => '25',
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

        # remember, do not allow to use page cache
        # (it's not working because of internal filter)
        CacheKey => undef,
        CacheTTL => undef,
    );
}

sub _XML_Lookup {
    my ($XMLData, $Needle) = @_;

    if ($Needle !~ "::") {
        return $XMLData->{$Needle}->[1]->{Content};
    } else {
        my @Remainder = split /::/, $Needle, 2;
        my $Result = _XML_Lookup ($XMLData->{$Remainder[0]}->[1], $Remainder[1]);
	return $Result;
    }
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # Create Data Object:
    my $Incidents = {};
    my $InciLookup = {
        1 => 'greenled', # Should never be visible
        2 => "yellowled",
        3 => "redled",
    };

    # We want to get a list per filter.
    # First we get the IDs of all configured filter
    # Then we get a list per configured filter
    # Then we get a list of all class ids and remove those we already worked on
    # Create a list of the "rest"

    my $ClassList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );
    # $ClassList will be later reduced to hold all CIs that are not explicitly
    # configured. We want to have a lookup for ID <-> Name, thus here is a copy
    my $ClassLookup = { %$ClassList };

    my $Config = $ConfigObject->Get('DashboardBackend');
    my $Filter = $Config->{'1550-CIsInIncident'}->{Filter};

    foreach my $CurrFilter ( sort keys $Filter ) {
        foreach my $CurrClassID (keys $ClassList) {
            if ($ClassList->{$CurrClassID} eq $CurrFilter) {
                $Incidents->{$CurrFilter} = {
		    ClassIDs => [$CurrClassID],
		    Count => 0,
		    Data => [],
		};
 		delete $ClassList->{$CurrClassID};
		last;
            }
        }
    }

    $Incidents->{"All"} = {
        ClassIDs => [sort keys %$ClassList ],
        Count => 0,
        Data => [],
    };

    # Get the InciStateID of State "Incident" and "Warning"
    my $CMDBIncidentStateList = $GeneralCatalogObject->ItemList(
        Class   => 'ITSM::Core::IncidentState',
    );

    my @IncidentIDs;
    foreach my $ClassItemID (keys $CMDBIncidentStateList) {
        if ($CMDBIncidentStateList->{$ClassItemID} ne 'Operational'){
            push @IncidentIDs, $ClassItemID;
        }
    }

    # Get the Deployment state IDs of all states that are neither:
    # inactive, retired
    my $CMDBDeploymentStateList = $GeneralCatalogObject->ItemList(
        Class   => 'ITSM::CONFIGITEM::DEPLOYMENTSTATE',
    );
    my @DeploymentIDs;
    foreach my $ClassItemID (keys $CMDBDeploymentStateList) {
        if ($CMDBDeploymentStateList->{$ClassItemID} ne 'Inactive' 
         && $CMDBDeploymentStateList->{$ClassItemID} ne 'Retired' ){
            push @DeploymentIDs, $ClassItemID;
        }
    }

    # Get all CI-IDs in Incident:
    foreach my $CurrentFilter (keys $Incidents) {
        my $CIIDs = $ConfigItemObject->ConfigItemSearch(
            ClassIDs     => $Incidents->{$CurrentFilter}->{ClassIDs},
            InciStateIDs => \@IncidentIDs,
            DeplStateIDs => \@DeploymentIDs,
        );


        # Create one entry per found CI
        CONFIGITEM:
        foreach my $ConfigItemID ( @{ $CIIDs }) {
            # get CI data
            my $Data = $ConfigItemObject->ConfigItemGet(
                ConfigItemID => "$ConfigItemID",
            );
            # get extended data for the CI Name:
            my $Version = $ConfigItemObject->VersionGet(
                VersionID  => $Data->{LastVersionID},
                XMLDataGet => 1,
            );
            
            # Get color for the LED
            $Data->{InciLED} = $InciLookup->{ $Version->{CurInciStateID} };
    
            # Add Name to Data
            $Data->{CIName} = $Version->{Name};

            # ClassID is always given, but not so the class. Make sure it is set:
            $Data->{Class} = $ClassLookup->{ $Data->{ClassID} };
    
            # Add Link to Data
            $Data->{Link} = "index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=" . $ConfigItemID;

            # Try to find the configured attribute in this hash
            my $Attribute = $Filter->{$CurrentFilter};
           
            if ($Attribute) {
                # Apend custom attribute to name if configured
                my $VersionData = $Version->{XMLData}->[1]->{Version}->[1];
		my $Result = _XML_Lookup($VersionData, $Attribute);
		$Data->{CIName} .= " - " . $Result;
            }

            #remember data and count
            push $Incidents->{$CurrentFilter}->{Data}, $Data;
            $Incidents->{$CurrentFilter}->{Count}++;
        }
    }

    # filter bar

    # add page nav bar
    my $Total    = $Incidents->{ $Self->{Filter} }->{Count} || 0;
    my $LinkPage = 'Subaction=Element;Name=' . $Self->{Name} . ';Filter=' . $Self->{Filter} . ';';
    my %PageNav  = $LayoutObject->PageNavBar(
        StartHit       => $Self->{StartHit},
        PageShown      => $Self->{PageShown},
        AllHits        => $Total || 1,
        Action         => 'Action=' . $LayoutObject->{Action},
        Link           => $LinkPage,
        WindowSize     => 5,
        AJAXReplace    => 'Dashboard' . $Self->{Name},
        IDPrefix       => 'Dashboard' . $Self->{Name},
        KeepScriptTags => $Param{AJAX},
    );

    $LayoutObject->Block(
        Name => 'ContentSmallTicketGenericFilterNavBar',
        Data => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
            %PageNav,
        },
    );

    $LayoutObject->Block(
        Name => 'ContentSmallCIsInIncidentFilterRow',
        Data => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
        },
    );

    # One filter per entry in Incidents
    foreach my $CurrentFilter (sort keys $Incidents) {
        my $CSSClass = "";
        if ( $Self->{Filter} eq $CurrentFilter) {
	    $CSSClass = "Selected";
        }
        $LayoutObject->Block(
            Name => 'ContentSmallCIsInIncidentFilterEntry',
            Data => {
                Name => $Self->{Name}, # needed for AJAX
                CIName => $CurrentFilter,
                Count => $Incidents->{$CurrentFilter}->{Count},
                CSSClass => $CSSClass,
            },
        );
        $LayoutObject->Block(
            Name => 'ContentSmallCIsInIncidentFilterEntryJS',
            Data => {
                Name => $Self->{Name}, # needed for AJAX
                CIName => $CurrentFilter,
            },
        );
    }

    # Then one block per CI
    if (scalar @{ $Incidents->{ $Self->{Filter} }->{Data} } > 0) {
        foreach my $CurrData (@{ $Incidents->{ $Self->{Filter} }->{Data} } ) {
            $LayoutObject->Block(
                Name => 'ContentSmallCIInIncidentRow',
                Data => $CurrData,
            );
        }
    }
    else {
        $LayoutObject->Block(
            Name => 'ContentSmallCIsInIncidentNone',
        );
    }

    # check for refresh time
    my $Refresh = '';
    if ( $Self->{UserRefreshTime} ) {
        $Refresh = 60 * $Self->{UserRefreshTime};
        my $NameHTML = $Self->{Name};
        $NameHTML =~ s{-}{_}xmsg;
        $LayoutObject->Block(
            Name => 'ContentSmallCIsInIncidentRefresh',
            Data => {
                %{ $Self->{Config} },
                Name        => $Self->{Name},
                NameHTML    => $NameHTML,
                RefreshTime => $Refresh,
            },
        );
    }

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardCIsInIncident',
        Data         => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
        },
        KeepScriptTags => $Param{AJAX},
    );

    return $Content;
}

1;
