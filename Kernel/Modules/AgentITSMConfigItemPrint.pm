# --
# Kernel/Modules/AgentITSMConfigItemPrint.pm - print layout for itsm config item agent interface
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentITSMConfigItemPrint.pm,v 1.4 2009-10-07 14:25:22 reb Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemPrint;

use strict;
use warnings;

use Kernel::System::ITSMConfigItem;
use Kernel::System::LinkObject;
use Kernel::System::PDF;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.4 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (qw(ParamObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$Object} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Object!" );
        }
    }
    $Self->{ConfigItemObject} = Kernel::System::ITSMConfigItem->new(%Param);
    $Self->{LinkObject}       = Kernel::System::LinkObject->new(%Param);
    $Self->{PDFObject}        = Kernel::System::PDF->new(%Param);

    # get config of frontend module
    $Self->{Config} = $Self->{ConfigObject}->Get("ConfigItem::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get params
    my $ConfigItemID = $Self->{ParamObject}->GetParam( Param => 'ConfigItemID' );
    my $VersionID    = $Self->{ParamObject}->GetParam( Param => 'VersionID' );

    # check needed stuff
    if ( !$ConfigItemID || !$VersionID ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No ConfigItemID or VersionID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # check for access rights
    my $HasAccess = $Self->{ConfigItemObject}->Permission(
        Scope  => 'Item',
        ItemID => $ConfigItemID,
        UserID => $Self->{UserID},
        Type   => $Self->{Config}->{Permission},
    );

    if ( !$HasAccess ) {

        # error page
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'Can\'t show config item, no access rights given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get config item
    my $ConfigItem = $Self->{ConfigItemObject}->ConfigItemGet(
        ConfigItemID => $ConfigItemID,
    );
    if ( !$ConfigItem->{ConfigItemID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "ConfigItemID $ConfigItemID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # get version
    my $Version = $Self->{ConfigItemObject}->VersionGet(
        VersionID => $VersionID,
    );
    if ( !$Version->{VersionID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => "VersionID $VersionID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # get last version
    my $LastVersion = $Self->{ConfigItemObject}->VersionGet(
        ConfigItemID => $ConfigItemID,
    );
    $ConfigItem->{CurrentName} = $LastVersion->{Name};

    # get version list
    my $VersionList = $Self->{ConfigItemObject}->VersionList(
        ConfigItemID => $ConfigItemID,
    );

    my $VersionNumber = 1;
    LISTVERSIONID:
    for my $ListVersionID ( @{$VersionList} ) {

        last LISTVERSIONID if $VersionID eq $ListVersionID;
        $VersionNumber++;
    }

    # get user data of config item (create by)
    my %ConfigItemCreateBy = $Self->{UserObject}->GetUserData(
        UserID => $ConfigItem->{CreateBy},
        Cached => 1,
    );

    # get user data of config item (change by)
    my %ConfigItemChangeBy = $Self->{UserObject}->GetUserData(
        UserID => $ConfigItem->{ChangeBy},
        Cached => 1,
    );

    # get user data of version (create by)
    my %VersionCreateBy = $Self->{UserObject}->GetUserData(
        UserID => $Version->{CreateBy},
        Cached => 1,
    );

    # get linked objects
    my $LinkListWithData = $Self->{LinkObject}->LinkListWithData(
        Object => 'ITSMConfigItem',
        Key    => $ConfigItemID,
        State  => 'Valid',
        UserID => $Self->{UserID},
    );

    # get link type list
    my %LinkTypeList = $Self->{LinkObject}->TypeList(
        UserID => $Self->{UserID},
    );

    # get the link data
    my %LinkData;
    if ( $LinkListWithData && ref $LinkListWithData eq 'HASH' && %{$LinkListWithData} ) {
        %LinkData = $Self->{LayoutObject}->LinkObjectTableCreate(
            LinkListWithData => $LinkListWithData,
            ViewMode         => 'SimpleRaw',
        );
    }

    # generate pdf output
    if ( $Self->{PDFObject} ) {

        my %Page;
        my $Url = ' ';

        if ( $ENV{REQUEST_URI} ) {
            $Url = $Self->{ConfigObject}->Get('HttpType') . '://'
                . $Self->{ConfigObject}->Get('FQDN')
                . $ENV{REQUEST_URI};
        }

        # get maximum number of pages
        $Page{MaxPages} = $Self->{ConfigObject}->Get('PDF::MaxPages');
        if ( !$Page{MaxPages} || $Page{MaxPages} < 1 || $Page{MaxPages} > 1000 ) {
            $Page{MaxPages} = 100;
        }

        $Page{MarginTop}    = 30;
        $Page{MarginRight}  = 40;
        $Page{MarginBottom} = 40;
        $Page{MarginLeft}   = 40;
        $Page{HeaderRight}  = $Self->{LayoutObject}->{LanguageObject}->Get('ConfigItem') . '#'
            . $ConfigItem->{Number};
        $Page{HeadlineLeft}  = $Version->{Name};
        $Page{HeadlineRight} = $Self->{LayoutObject}->{LanguageObject}->Get('printed by') . ' '
            . $Self->{UserFirstname} . ' '
            . $Self->{UserLastname} . ' ('
            . $Self->{UserEmail} . ') '
            . $Self->{LayoutObject}->Output( Template => '$Env{"Time"}' );
        $Page{FooterLeft} = $Url;
        $Page{PageText}   = $Self->{LayoutObject}->{LanguageObject}->Get('Page');
        $Page{PageCount}  = 1;

        # create new pdf document
        $Self->{PDFObject}->DocumentNew(
            Title  => $Self->{ConfigObject}->Get('Product') . ':' . $Version->{Name},
            Encode => $Self->{LayoutObject}->{UserCharset},
        );

        # create first pdf page
        $Self->{PDFObject}->PageNew(
            %Page,
            FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
        );
        $Page{PageCount}++;

        # output general infos
        $Self->_PDFOutputGeneralInfos(
            Page       => \%Page,
            ConfigItem => $ConfigItem,
            CreateBy   => \%ConfigItemCreateBy,
            ChangeBy   => \%ConfigItemChangeBy,
        );

        # output linked objects
        if (%LinkData) {
            $Self->_PDFOutputLinkedObjects(
                PageData     => \%Page,
                LinkData     => \%LinkData,
                LinkTypeList => \%LinkTypeList,
            );
        }

        # output version infos
        $Self->_PDFOutputVersionInfos(
            Page          => \%Page,
            Version       => $Version,
            VersionNumber => $VersionNumber,
            CreateBy      => \%VersionCreateBy,
        );

        # create file name
        my $Filename = $Self->{MainObject}->FilenameCleanUp(
            Filename => $ConfigItem->{Number},
            Type     => 'Attachment',
        );
        my ( $s, $m, $h, $D, $M, $Y ) = $Self->{TimeObject}->SystemTime2Date(
            SystemTime => $Self->{TimeObject}->SystemTime(),
        );
        $M = sprintf( "%02d", $M );
        $D = sprintf( "%02d", $D );
        $h = sprintf( "%02d", $h );
        $m = sprintf( "%02d", $m );

        return $Self->{LayoutObject}->Attachment(
            Filename    => 'configitem_' . $Filename . "_$Y-$M-$D\_$h-$m.pdf",
            ContentType => 'application/pdf',
            Content     => $Self->{PDFObject}->DocumentOutput(),
            Type        => 'attachment',
        );
    }

    # generate html output
    else {

        # output header
        my $Output = $Self->{LayoutObject}->PrintHeader( Value => $Version->{Name} );

        if (%LinkData) {

            # output link data
            $Self->{LayoutObject}->Block(
                Name => 'Link',
            );

            for my $LinkTypeLinkDirection ( sort { lc $a cmp lc $b } keys %LinkData ) {

                # investigate link type name
                my @LinkData = split q{::}, $LinkTypeLinkDirection;

                # output link type data
                $Self->{LayoutObject}->Block(
                    Name => 'LinkType',
                    Data => {
                        LinkTypeName => $LinkTypeList{ $LinkData[0] }->{ $LinkData[1] . 'Name' },
                    },
                );

                # extract object list
                my $ObjectList = $LinkData{$LinkTypeLinkDirection};

                for my $Object ( sort { lc $a cmp lc $b } keys %{$ObjectList} ) {

                    for my $Item ( @{ $ObjectList->{$Object} } ) {

                        # output link type data
                        $Self->{LayoutObject}->Block(
                            Name => 'LinkTypeRow',
                            Data => {
                                LinkStrg => $Item->{Title},
                            },
                        );
                    }
                }
            }
        }

        # output version block
        $Self->{LayoutObject}->Block(
            Name => "Version",
            Data => {
                %{$Version},
                VersionNumber         => $VersionNumber,
                CreateByUserLogin     => $VersionCreateBy{UserLogin},
                CreateByUserFirstname => $VersionCreateBy{UserFirstname},
                CreateByUserLastname  => $VersionCreateBy{UserLastname},
            },
        );

        # output xml structure
        if (
            $Version
            && ref $Version eq 'HASH'
            && $Version->{XMLDefinition}
            && $Version->{XMLData}
            && ref $Version->{XMLDefinition} eq 'ARRAY'
            && ref $Version->{XMLData}       eq 'ARRAY'
            && $Version->{XMLData}->[1]
            && ref $Version->{XMLData}->[1] eq 'HASH'
            && $Version->{XMLData}->[1]->{Version}
            && ref $Version->{XMLData}->[1]->{Version} eq 'ARRAY'
            )
        {
            $Self->_HTMLOutputXMLStructure(
                XMLDefinition => $Version->{XMLDefinition},
                XMLData       => $Version->{XMLData}->[1]->{Version}->[1],
            );
        }

        # generate output
        $Output .= $Self->{LayoutObject}->Output(
            TemplateFile => 'AgentITSMConfigItemPrint',
            Data         => {
                %{$ConfigItem},
                CreateByUserLogin     => $ConfigItemCreateBy{UserLogin},
                CreateByUserFirstname => $ConfigItemCreateBy{UserFirstname},
                CreateByUserLastname  => $ConfigItemCreateBy{UserLastname},
                ChangeByUserLogin     => $ConfigItemChangeBy{UserLogin},
                ChangeByUserFirstname => $ConfigItemChangeBy{UserFirstname},
                ChangeByUserLastname  => $ConfigItemChangeBy{UserLastname},
            },
        );

        # add footer
        $Output .= $Self->{LayoutObject}->PrintFooter();

        # return output
        return $Output;
    }
}

sub _PDFOutputGeneralInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page ConfigItem CreateBy ChangeBy)) {
        if ( !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create left table
    my $TableLeft = [
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Class') . ':',
            Value => $Param{ConfigItem}->{Class},
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('ConfigItem') . ':',
            Value => $Param{ConfigItem}->{CurrentName},
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Current Deployment State') . ':',
            Value => $Self->{LayoutObject}->{LanguageObject}->Get(
                $Param{ConfigItem}->{CurDeplState},
            ),
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Current Incident State') . ':',
            Value => $Self->{LayoutObject}->{LanguageObject}->Get(
                $Param{ConfigItem}->{CurInciState},
            ),
        },
    ];

    # create right table
    my $TableRight = [
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Created') . ':',
            Value => $Self->{LayoutObject}->Output(
                Template => '$TimeLong{"$Data{"CreateTime"}"}',
                Data     => \%{ $Param{ConfigItem} },
            ),
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Created by') . ':',
            Value => $Param{CreateBy}->{UserLogin} . ' ('
                . $Param{CreateBy}->{UserFirstname} . ' '
                . $Param{CreateBy}->{UserLastname} . ')',
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Last changed') . ':',
            Value => $Self->{LayoutObject}->Output(
                Template => '$TimeLong{"$Data{"ChangeTime"}"}',
                Data     => \%{ $Param{ConfigItem} },
            ),
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Last changed by') . ':',
            Value => $Param{ChangeBy}->{UserLogin} . ' ('
                . $Param{ChangeBy}->{UserFirstname} . ' '
                . $Param{ChangeBy}->{UserLastname} . ')',
        },
    ];

    my $Rows = @{$TableLeft};
    if ( @{$TableRight} > $Rows ) {
        $Rows = @{$TableRight};
    }

    my %TableParam;
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content}         = $TableLeft->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content}         = $TableLeft->[$Row]->{Value};
        $TableParam{CellData}[$Row][2]{Content}         = ' ';
        $TableParam{CellData}[$Row][2]{BackgroundColor} = '#FFFFFF';
        $TableParam{CellData}[$Row][3]{Content}         = $TableRight->[$Row]->{Key};
        $TableParam{CellData}[$Row][3]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][4]{Content}         = $TableRight->[$Row]->{Value};
    }

    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 170.5;
    $TableParam{ColumnData}[2]{Width} = 4;
    $TableParam{ColumnData}[3]{Width} = 80;
    $TableParam{ColumnData}[4]{Width} = 170.5;
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColorEven}  = '#AAAAAA';
    $TableParam{BackgroundColorOdd}   = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $Self->{PDFObject}->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $Self->{PDFObject}->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount},
        );
        $Param{Page}->{PageCount}++;
    }

    return 1;
}

sub _PDFOutputLinkedObjects {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(PageData LinkData LinkTypeList)) {
        if ( !defined( $Param{$_} ) ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }

    my %Page     = %{ $Param{PageData} };
    my %TypeList = %{ $Param{LinkTypeList} };
    my %TableParam;
    my $Row = 0;

    for my $LinkTypeLinkDirection ( sort { lc $a cmp lc $b } keys %{ $Param{LinkData} } ) {

        # investigate link type name
        my @LinkData = split q{::}, $LinkTypeLinkDirection;
        my $LinkTypeName = $TypeList{ $LinkData[0] }->{ $LinkData[1] . 'Name' };
        $LinkTypeName = $Self->{LayoutObject}->{LanguageObject}->Get($LinkTypeName);

        # define headline
        $TableParam{CellData}[$Row][0]{Content} = $LinkTypeName . ':';
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = '';

        # extract object list
        my $ObjectList = $Param{LinkData}->{$LinkTypeLinkDirection};

        for my $Object ( sort { lc $a cmp lc $b } keys %{$ObjectList} ) {

            for my $Item ( @{ $ObjectList->{$Object} } ) {

                $TableParam{CellData}[$Row][0]{Content} ||= '';
                $TableParam{CellData}[$Row][1]{Content} = $Item->{Title} || '';
            }
            continue {
                $Row++;
            }
        }
    }

    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 431;

    # set new position
    $Self->{PDFObject}->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline
    $Self->{PDFObject}->Text(
        Text     => $Self->{LayoutObject}->{LanguageObject}->Get('Linked Objects'),
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # set new position
    $Self->{PDFObject}->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # table params
    $TableParam{Type}            = 'Cut';
    $TableParam{Border}          = 0;
    $TableParam{FontSize}        = 6;
    $TableParam{BackgroundColor} = '#DDDDDD';
    $TableParam{Padding}         = 1;
    $TableParam{PaddingTop}      = 3;
    $TableParam{PaddingBottom}   = 3;

    # output table
    for ( $Page{PageCount} .. $Page{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $Self->{PDFObject}->Table( %TableParam, );

        # stop output or output next page
        if ( $TableParam{State} ) {
            last;
        }
        else {
            $Self->{PDFObject}->PageNew(
                %Page, FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
            );
            $Page{PageCount}++;
        }
    }

    return 1;
}

sub _PDFOutputVersionInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page Version VersionNumber)) {
        if ( !defined $Param{$Argument} ) {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # set new position
    $Self->{PDFObject}->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline
    $Self->{PDFObject}->Text(
        Text => $Self->{LayoutObject}->{LanguageObject}->Get('Version') . ' '
            . $Param{VersionNumber},
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # set new position
    $Self->{PDFObject}->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # create table
    my $Table = [
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Created') . ':',
            Value => $Self->{LayoutObject}->Output(
                Template => '$TimeLong{"$Data{"CreateTime"}"}',
                Data     => \%{ $Param{Version} },
            ),
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Created by') . ':',
            Value => $Param{CreateBy}->{UserLogin} . ' ('
                . $Param{CreateBy}->{UserFirstname} . ' '
                . $Param{CreateBy}->{UserLastname} . ')',
        },
        {
            Key   => ' ',
            Value => ' ',
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Name') . ':',
            Value => $Param{Version}->{Name},
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Deployment State') . ':',
            Value => $Self->{LayoutObject}->{LanguageObject}->Get( $Param{Version}->{DeplState} ),
        },
        {
            Key   => $Self->{LayoutObject}->{LanguageObject}->Get('Incident State') . ':',
            Value => $Self->{LayoutObject}->{LanguageObject}->Get( $Param{Version}->{InciState} ),
        },
    ];

    # add xml data to table
    if (
        ref $Param{Version} eq 'HASH'
        && $Param{Version}->{XMLDefinition}
        && $Param{Version}->{XMLData}
        && ref $Param{Version}->{XMLDefinition} eq 'ARRAY'
        && ref $Param{Version}->{XMLData}       eq 'ARRAY'
        && $Param{Version}->{XMLData}->[1]
        && ref $Param{Version}->{XMLData}->[1] eq 'HASH'
        && $Param{Version}->{XMLData}->[1]->{Version}
        && ref $Param{Version}->{XMLData}->[1]->{Version} eq 'ARRAY'
        )
    {
        $Self->_PDFOutputXMLOutput(
            XMLDefinition => $Param{Version}->{XMLDefinition},
            XMLData       => $Param{Version}->{XMLData}->[1]->{Version}->[1],
            TableData     => $Table,
        );
    }

    my %TableParam;
    my $Rows = @{$Table};

    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content} = $Table->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = $Table->[$Row]->{Value};
    }

    $TableParam{ColumnData}[0]{Width} = 100;
    $TableParam{ColumnData}[1]{Width} = 411;
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColor}      = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $Self->{PDFObject}->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $Self->{PDFObject}->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount},
        );
        $Param{Page}->{PageCount}++;
    }

    return 1;
}

sub _PDFOutputXMLOutput {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{TableData};
    return if !$Param{XMLData};
    return if !$Param{XMLDefinition};
    return if ref $Param{TableData} ne 'ARRAY';
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level} ||= 0;

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # stop loop, if no content was given
            last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};

            # lookup value
            my $Value = $Self->{ConfigItemObject}->XMLValueLookup(
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
            );

            # create output string
            $Value = $Self->{LayoutObject}->ITSMConfigItemOutputStringCreate(
                Value => $Value,
                Item  => $Item,
            );

            # new row
            my $NewRow = {
                Key   => $Self->{LayoutObject}->{LanguageObject}->Get( $Item->{Name} ) . ':',
                Value => $Value,
            };

            # output space, if level was given
            if ( $Param{Level} ) {
                for ( 1 .. $Param{Level} ) {
                    $NewRow->{Key}   = '    ' . $NewRow->{Key};
                    $NewRow->{Value} = '    ' . $NewRow->{Value};
                }
            }

            # add row data
            push @{ $Param{TableData} }, $NewRow;

            next COUNTER if !$Item->{Sub};

            # start recursion, if "Sub" was found
            $Self->_PDFOutputXMLOutput(
                XMLDefinition => $Item->{Sub},
                XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                TableData     => $Param{TableData},
                Level         => $Param{Level} + 1,
            );
        }
    }

    return 1;
}

sub _HTMLOutputXMLStructure {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLData};
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level} ||= 0;

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # stop loop, if no content was given
            last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};

            # lookup value
            my $Value = $Self->{ConfigItemObject}->XMLValueLookup(
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
            );

            # create output string
            $Value = $Self->{LayoutObject}->ITSMConfigItemOutputStringCreate(
                Value => $Value,
                Item  => $Item,
            );

            # output data block
            $Self->{LayoutObject}->Block(
                Name => 'VersionRow',
                Data => {
                    Name        => $Item->{Name},
                    Description => $Item->{Description} || $Item->{Name},
                    Value       => $Value,
                },
            );

            # output space, if level was given
            if ( $Param{Level} ) {
                for ( 1 .. $Param{Level} ) {
                    $Self->{LayoutObject}->Block( Name => 'VersionRowNamePre' );
                    $Self->{LayoutObject}->Block( Name => 'VersionRowValuePre' );
                }
            }

            next COUNTER if !$Item->{Sub};

            # start recursion, if "Sub" was found
            $Self->_HTMLOutputXMLStructure(
                XMLDefinition => $Item->{Sub},
                XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                Level         => $Param{Level} + 1,
            );
        }
    }

    return 1;
}

1;
