<%@ Page Language="C#" Title="BCO Sales Summary" AutoEventWireup="true" MasterPageFile="~/cmsversion.master" CodeFile="BCOSalesSummary.aspx.cs" Inherits="portal_Operation_Sales_BCOSalesSummary" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../../styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MasterSales" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>BCO SALES SUMMARY</h3>
                <ol class="breadcrumb">
                    <li>Operation</li>
                    <li>Sales</li>
                    <li>BCO Sales Summary Report</li>
                </ol>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
               <%--  <telerik:RadLabel ID="RadLabel1" runat="server" Text="Date:"></telerik:RadLabel>
                 <telerik:RadDatePicker ID="date" runat="server" Skin="Glow"></telerik:RadDatePicker>
                <telerik:RadLabel ID="sada" runat="server" Text="-"></telerik:RadLabel>
                 <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Glow"></telerik:RadDatePicker>
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;--%>
                 <telerik:RadLabel ID="bcolabel" runat="server" Text="BCO:"></telerik:RadLabel>
                 <telerik:RadComboBox ID="bco" runat="server" Skin="Glow" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="bco_SelectedIndexChanged">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                 &nbsp;&nbsp;
                <%--<telerik:RadButton ID="asjdhaskj" Text="Search" runat="server" Skin="Glow"></telerik:RadButton>--%>
            </div>

            <div class="row">
               
                <br />
                 <telerik:RadGrid ID="grid_BCOSalesSummary" runat="server"  Skin="Glow"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="false"
                    AutoGenerateColumns="false"
                    AllowSorting="true"  OnNeedDataSource="grid_BCOSalesSummary_NeedDataSource"
                    >
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" Pdf-DefaultFontFamily="Calibri Light"
                        IgnorePaging="true" UseItemStyles="true" Pdf-BorderColor="Black" Pdf-FontType="Subset">
                         <Pdf ForceTextWrap="false"   BorderColor="Black" DefaultFontFamily="Calibri Light" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="100px">
                          <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>          
                    <MasterTableView ShowGroupFooter="true"  CommandItemDisplay="Top" FilterItemStyle-VerticalAlign="Top">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToPdfText="PDF" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />                       
                        <Columns>
                            
                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="BCO" HeaderText="BCO"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="PP" HeaderText="PP"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CAS" HeaderText="CAS"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="FC" HeaderText="FC"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CAC" HeaderText="CAC"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="Sub Total" HeaderText="Sub Total"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
        </div>
    </div>
</div> 
</asp:Content>