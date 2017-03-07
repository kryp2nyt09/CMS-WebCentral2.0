<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BundleReport.aspx.cs" Inherits="portal_Operation_Manifest_BundleReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bundle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Website CSS style -->
    <link href="~/styles/default.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
    <link href="~/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->
    <link href="~/css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'/>
</head>
<body>
<form id="form1" runat="server">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>BUNDLE</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <div class="row form-group" style="font-size:13px;">
                    <telerik:RadLabel ID="RadLabel1" runat="server">Date:</telerik:RadLabel>
                    <telerik:RadDatePicker ID="dateTime_Bundle_Date" runat="server" ></telerik:RadDatePicker>

                    <telerik:RadLabel ID="RadLabel2" runat="server">Branch:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Bundle_Branch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDown_Bundle_Branch_SelectedIndexChanged">
                        <Items>
                            <telerik:DropDownListItem  Value="Branch Corporate Office" Text="Branch Corporate Office" Selected="true"/>
                            <telerik:DropDownListItem Value="Branch Satellire Office" Text="Branch Satellire Office"/>
                        </Items>
                    </telerik:RadDropDownList>
                    
                    <telerik:RadLabel ID="RadLabel4" runat="server" >BCO/BSO:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Bundle_BCO_BSO" runat="server" DropDownHeight="200"></telerik:RadDropDownList>
                        
                    <telerik:RadLabel ID="RadLabel3" runat="server" >Sack No:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Bundle_SackNo" runat="server"></telerik:RadDropDownList>

                    <telerik:RadLabel ID="RadLabel5" runat="server">Destination:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Bundle_Destination" runat="server"></telerik:RadDropDownList>

                    <telerik:RadButton ID="btn_Bundle_Search" runat="server" Text="Search" CssClass="btn-primary" AutoPostBack="true" OnClick="btn_Bundle_Search_Click"></telerik:RadButton>
                </div>
            </div>
            <div class="row">
                <telerik:RadGrid ID="grid_Bundle" runat="server" OnNeedDataSource="grid_Bundle_NeedDataSource" Skin="Office2010Black" 
                    AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right" AllowSorting="true" Width="100%" PageSize="10" OnPreRender="grid_Bundle_PreRender">
                <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true"></ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" Width="100%">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
