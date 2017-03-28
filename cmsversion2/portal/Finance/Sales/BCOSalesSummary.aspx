﻿<%@ Page Language="C#" Title="BCO Sales Summary" AutoEventWireup="true" MasterPageFile="~/cmsversion.master" CodeFile="BCOSalesSummary.aspx.cs" Inherits="portal_Operation_Sales_BCOSalesSummary" %>

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
                 <telerik:RadLabel ID="RadLabel1" runat="server" Text="Date:"></telerik:RadLabel>
                 <telerik:RadDatePicker ID="Date1" runat="server" Skin="Glow"></telerik:RadDatePicker>
                <telerik:RadLabel runat="server" Text="-"></telerik:RadLabel>
                <telerik:RadDatePicker ID="Date2" runat="server" Skin="Glow"></telerik:RadDatePicker>
                &nbsp;&nbsp;&nbsp;
                 <telerik:RadLabel ID="bcolabel" runat="server" Text="BCO CODE:"></telerik:RadLabel>
                 <telerik:RadComboBox ID="bco" runat="server" Skin="Glow" AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                 &nbsp;&nbsp;
                <telerik:RadButton ID="Search" Text="Search" runat="server" Skin="Glow" OnClick="Search_Click"></telerik:RadButton>
            </div>

            <div class="row">
               
                <br />
                 <telerik:RadGrid ID="grid_BCOSalesSummary" runat="server"  Skin="Glow"
                    AllowPaging="True" ShowFooter="true" 
                    PageSize="10"  
                    AllowFilteringByColumn="false"
                    AutoGenerateColumns="false"
                    AllowSorting="true"  OnNeedDataSource="grid_BCOSalesSummary_NeedDataSource"
                    >
                    
                    <ExportSettings HideStructureColumns="true" FileName="BCO Sales Summary" ExportOnlyData="true" 
                        Pdf-DefaultFontFamily="Calibri"
                        IgnorePaging="true" UseItemStyles="true" Pdf-BorderColor="Black" Pdf-FontType="Subset">
                         <Pdf ForceTextWrap="false" PageTitle="BCO Sales Summary Report"   BorderColor="Black" DefaultFontFamily="Calibri Light" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="130px">
                          <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" Font-Size="Smaller">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" 
                            ExportToPdfText="PDF" ShowExportToWordButton="false" ShowExportToCsvButton="false"
                             ShowAddNewRecordButton="false"  ShowRefreshButton="false" />                       
                        <Columns>
                            <telerik:GridBoundColumn DataField="BCO" HeaderText="BCO" FooterText="Total :"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PP" HeaderText="PP"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FC" HeaderText="FC"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CAS" HeaderText="CAS"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CAC" HeaderText="CAC"></telerik:GridBoundColumn>
                            
                            <telerik:GridCalculatedColumn HeaderText="SubTotal:" DataType="System.Double"
                             DataFields="PP, FC,CAS,CAC" Expression="{0}+{1}+{2}+{3}" FooterText=" "
                             Aggregate="Sum"></telerik:GridCalculatedColumn>

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