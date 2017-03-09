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
        <div class="container-fluid">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>PICK UP CARGO</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <telerik:RadGrid ID="gridPickupCargo" runat="server"  Skin="Glow"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="True"
                    AutoGenerateColumns="false"
                    AllowSorting="true" 
                    OnNeedDataSource="gridPickupCargo_NeedDataSource">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true"></ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" Font-Size="Smaller">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                        <Columns>
                             <telerik:GridDateTimeColumn
                                 DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" AllowFiltering="true" FilterListOptions="VaryByDataType"
                                 PickerType="DatePicker"  DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" UniqueName="CreatedDate" 
                                 ></telerik:GridDateTimeColumn>

                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AirwayBillNo" HeaderText="Airway Bill No"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Area" HeaderText="Area" >     
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Shipper" HeaderText="Shipper"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Shipper Address" HeaderText="Shipper Address"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Consignee" HeaderText="Consignee"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Consignee Address" HeaderText="Consignee Address"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="CommodityName" HeaderText="CommodityName"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Qty" HeaderText="Qty"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="AGW" HeaderText="AGW"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="ServiceModeName" HeaderText="Service Mode"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="PaymentModeName" HeaderText="Payment Mode"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="AMOUNT" HeaderText="Amount"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
