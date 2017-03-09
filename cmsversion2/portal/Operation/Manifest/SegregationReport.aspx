<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SegregationReport.aspx.cs" Inherits="portal_Operation_Manifest_SegregationReport" %>

<!DOCTYPE html>

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
        <div class="container-fluid">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>SEGREGATION</h3>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <telerik:RadGrid ID="grid_Segregation" runat="server" Skin="Glow" 
                    AllowPaging="True" 
                    AllowFilteringByColumn="True"
                    AutoGenerateColumns="false"
                    AllowSorting="true" Width="100%" 
                    PageSize="10" 
                    OnNeedDataSource="grid_Segregation_NeedDataSource">
                <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true"></ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" Width="100%">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                        <Columns>
                             <telerik:GridDateTimeColumn
                                 DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" AllowFiltering="true" FilterListOptions="VaryByDataType"
                                 PickerType="DatePicker"  DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" UniqueName="CreatedDate" 
                                 ></telerik:GridDateTimeColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                DataField="BCO" HeaderText="BCO">
                            </telerik:GridBoundColumn>

                            
                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AirwayBillNo" HeaderText="Airway Bill No"></telerik:GridBoundColumn>

                              <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Driver" HeaderText="Driver"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Checker" HeaderText="Checker"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="PlateNo" HeaderText="Plate #"></telerik:GridBoundColumn>

                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="BatchName" HeaderText="Batch"></telerik:GridBoundColumn>

                            
                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Qty" HeaderText="Qty"></telerik:GridBoundColumn>

                              <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false"  AllowFiltering="false"
                                  DataField="Area" HeaderText="Area"></telerik:GridBoundColumn>

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
