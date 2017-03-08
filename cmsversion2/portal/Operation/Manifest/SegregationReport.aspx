<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SegregationReport.aspx.cs" Inherits="portal_Operation_Manifest_SegregationReport" %>

<!DOCTYPE html>
<script runat="server">

    protected void btn_Segregation_Search_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Segregation</title>
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
                <h3>SEGREGATION</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <div class="row form-group">
                    <telerik:RadLabel ID="RadLabel1" runat="server">Date:</telerik:RadLabel>
                    <telerik:RadDatePicker ID="dateTime_Segregation_Date" runat="server" ></telerik:RadDatePicker>
                    
                    <telerik:RadLabel ID="RadLabel4" runat="server" >BCO:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Segregation_BCO" runat="server"></telerik:RadDropDownList>
                        
                    <telerik:RadLabel ID="RadLabel3" runat="server" >Driver:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Segregation_Driver" runat="server"></telerik:RadDropDownList>

                    <telerik:RadLabel ID="RadLabel2" runat="server" >Plate #:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Segregation_PlateNo" runat="server"></telerik:RadDropDownList>

                    <telerik:RadLabel ID="RadLabel5" runat="server" >Bacth:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="dropDown_Segregation_Batch" runat="server"></telerik:RadDropDownList>

                    <telerik:RadButton ID="btn_Segregation_Search" runat="server" Text="Search" CssClass="btn-primary" OnClick="btn_Segregation_Search_Click"></telerik:RadButton>
                </div>
            </div>
            <div class="row">
                <telerik:RadGrid ID="grid_Segregation" runat="server" Skin="Office2010Black" 
                    AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right" AllowSorting="true" Width="100%" PageSize="10" OnNeedDataSource="grid_Segregation_NeedDataSource" OnPreRender="grid_Segregation_PreRender">
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
