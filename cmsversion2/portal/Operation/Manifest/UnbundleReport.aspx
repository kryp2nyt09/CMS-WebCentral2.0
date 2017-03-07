<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UnbundleReport.aspx.cs" Inherits="portal_Operation_Manifest_UnbundleReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unbundle</title>
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
                <h3>UNBUNDLE</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <div class="row form-group">
                    <telerik:RadLabel ID="RadLabel1" runat="server">Date:</telerik:RadLabel>
                    <telerik:RadDatePicker ID="dateTime_Unbundle_Date" runat="server"></telerik:RadDatePicker>
                    
                    <telerik:RadLabel ID="RadLabel4" runat="server">BCO:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Unbundle_BCO_BSO" runat="server" DropDownHeight="200"></telerik:RadDropDownList>
                        
                    <telerik:RadLabel ID="RadLabel3" runat="server" >Sack No:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Unbundle_SackNo" runat="server" ></telerik:RadDropDownList>

                    <telerik:RadButton ID="btn_Bundle_Search" runat="server" Text="Search" CssClass="btn-primary" AutoPostBack="true"></telerik:RadButton>
                </div>
            </div>
            <div class="row">
                <telerik:RadGrid ID="grid_Unbundle" runat="server" OnNeedDataSource="grid_Unbundle_NeedDataSource" Skin="Office2010Black" 
                    AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right" AllowSorting="true" Width="100%" PageSize="10">
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
