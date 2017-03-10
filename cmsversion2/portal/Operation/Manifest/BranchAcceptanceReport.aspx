<%@ Page Title="Branch Acceptance" Language="C#" AutoEventWireup="true" MasterPageFile="~/cmsversion.master" CodeFile="BranchAcceptanceReport.aspx.cs" Inherits="portal_Operation_Manifest_BranchAcceptanceReport" %>
<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../../styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BranchAcceptance" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>BRANCH ACCEPTANCE</h3>
                <ol class="breadcrumb">
                    <li>Operation</li>
                    <li>Manifest</li>
                    <li>Branch Acceptance</li>
                </ol>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <telerik:RadGrid ID="grid_BranchAcceptance" runat="server"  Skin="Glow"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="True"
                    AutoGenerateColumns="false"
                    AllowSorting="true" OnNeedDataSource="grid_BranchAcceptance_NeedDataSource">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true"></ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                        <Columns>

                            <telerik:GridDateTimeColumn
                                 DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" AllowFiltering="true" FilterListOptions="VaryByDataType"
                                 PickerType="DatePicker"  DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" UniqueName="CreatedDate"  FilterControlWidth="100px" 
                                 ></telerik:GridDateTimeColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="BCO" HeaderText="BCO"></telerik:GridBoundColumn>
                            
                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Area" HeaderText="BSO"></telerik:GridBoundColumn>

                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" FilterControlWidth="70px" 
                                  DataField="AirwayBillNo" HeaderText="Airway Bill No"></telerik:GridBoundColumn>

                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Driver" HeaderText="Driver"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Checker" HeaderText="Checker"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="PlateNo" HeaderText="Plate #"></telerik:GridBoundColumn>

                             <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" FilterControlWidth="60px" 
                                  DataField="BatchName" HeaderText="Batch"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Recieved Qty" HeaderText="Recieved Qty"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false" HeaderStyle-Width="40px"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Decripency Qty" HeaderText="Discrepency Qty"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="Total Qty" HeaderText="Total Qty"></telerik:GridBoundColumn>
                            
                             

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
        </div>
    </div>
</div>
</asp:Content>