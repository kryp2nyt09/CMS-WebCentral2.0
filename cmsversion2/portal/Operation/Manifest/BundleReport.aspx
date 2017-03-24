<%@ Page Title="Bundle" MasterPageFile="~/cmsversion.master" Language="C#" AutoEventWireup="true" CodeFile="BundleReport.aspx.cs" Inherits="portal_Operation_Manifest_BundleReport" %>
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
                <h3>BUNDLE</h3>
                <ol class="breadcrumb">
                    <li>Operation</li>
                    <li>Manifest</li>
                    <li>Bundle</li>
                </ol>
            </div>
            <!--- PAGE BODY--->
            <div class="row">
                <telerik:RadLabel runat="server" Text="Date:"></telerik:RadLabel>
                <telerik:RadDatePicker ID="Date" runat="server" Skin="Glow"></telerik:RadDatePicker>
                &nbsp;&nbsp;

                <telerik:RadLabel runat="server" Text="Sack #:"></telerik:RadLabel>
                <telerik:RadComboBox ID="BundleNumber" runat="server" MarkFirstMatch="true" AllowCustomText="true"
                    Skin="Glow" AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                &nbsp;&nbsp;

                <telerik:RadLabel runat="server" Text="Destination:"></telerik:RadLabel>
                 <telerik:RadComboBox ID="Destination" runat="server" MarkFirstMatch="true" AllowCustomText="true"
                     Skin="Glow" AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                &nbsp;&nbsp;

                <telerik:RadButton ID="Search" runat="server" Text="Search" Skin="Glow" AutoPostBack="true" OnClick="Search_Click"> </telerik:RadButton>
            </div>
            <br />
            <div class="row">
                <telerik:RadGrid ID="grid_Bundle" runat="server" Skin="Glow"
                    OnNeedDataSource="grid_Bundle_NeedDataSource"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="false" ShowFooter="true"
                    AutoGenerateColumns="false" OnPreRender="grid_Bundle_PreRender"
                    AllowSorting="true">

                    <ExportSettings FileName="Bundle" HideStructureColumns="true" ExportOnlyData="true" 
                        IgnorePaging="true" UseItemStyles="true">
                        <Pdf ForceTextWrap="false" PageWidth="397mm" PageHeight="210mm" BorderColor="Black" 
                            DefaultFontFamily="Calibri"
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="130px" PageTitle="Bundle Report">
                            <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center"/>
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>
                    <MasterTableView CommandItemDisplay="Top" Width="100%" Font-Size="Smaller">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="AWB #" HeaderText="AWB #" FooterText="TOTAL: "></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SHIPPER" HeaderText="SHIPPER"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CONSIGNEE" HeaderText="CONSIGNEE"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CONSIGNEE ADDRESS" HeaderText="CONSIGNEE ADDRESS"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="COMMODITY" HeaderText="COMMODITY"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="COMMODITY TYPE" HeaderText="COMMODITY TYPE"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QTY" HeaderText="QTY" Aggregate="Sum" FooterText=" "></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AGW" HeaderText="AGW" Aggregate="Sum" FooterText=" "></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SERVICE MODE" HeaderText="SERVICE MODE"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PAY MODE" HeaderText="PAY MODE"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SCANNEDBY" HeaderText="SCANNED BY"></telerik:GridBoundColumn>
                        </Columns>
                        <HeaderStyle Font-Size="Smaller" Font-Bold="true" />
                        <FooterStyle Font-Bold="true" />
                       
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
        </div>
    </div>
</div>    
</asp:Content>