<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PickupCargoManifestReport.aspx.cs" Inherits="portal_Operation_Manifest_PickupCargoManifestReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pickup Cargo</title>
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
<form runat="server">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>PICK UP CARGO</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <div class="form-group">
                    <telerik:RadLabel ID="RadLabel1" runat="server">Date:</telerik:RadLabel>
                    <telerik:RadDatePicker ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>

                    <telerik:RadLabel ID="RadLabel2" runat="server">BCO:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="RadDropDownList1" runat="server"></telerik:RadDropDownList>

                    <telerik:RadLabel ID="RadLabel3" runat="server">Area:</telerik:RadLabel>
                    <telerik:RadDropDownList ID="RadDropDownList2" runat="server"></telerik:RadDropDownList>

                    <telerik:RadButton ID="RadButton1" runat="server" Text="Search" CssClass="btn-primary"></telerik:RadButton>
                </div>
            </div>
            <div class="row">
                <telerik:RadGrid ID="RadGrid1" runat="server" OnNeedDataSource="RadGrid1_NeedDataSource" Skin="Office2010Black" 
                    AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right" AllowSorting="true" Width="100%" PageSize="10">
                               
                </telerik:RadGrid>
            </div>
        </div>s
    </div>
</div>
</form>
</body>
</html>
