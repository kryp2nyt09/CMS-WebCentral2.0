<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/cmsversion.master" Title="Sales Per User Level" CodeFile="SalesPerUserLevel.aspx.cs" Inherits="portal_Operation_Sales_SalesPerUserLevel" %>
<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../../styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="SalesPerClient" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>SALES PER SUER LEVEL</h3>
                <ol class="breadcrumb">
                    <li>Operation</li>
                    <li>Sales</li>
                    <li>Sales Per User Level Report</li>
                </ol>
            </div>
            <!--- PAGE BODY--->
       
            <div class="row">
                 <telerik:RadGrid ID="grid_SalesPerUserLevel" runat="server"  Skin="Glow"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="false"
                    AutoGenerateColumns="true"
                    AllowSorting="true" OnNeedDataSource="grid_SalesPerUserLevel_NeedDataSource">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" Pdf-DefaultFontFamily="Segoe UI 10"
                        IgnorePaging="true" UseItemStyles="true" Pdf-BorderColor="Black" Pdf-FontType="Subset">
                         <Pdf ForceTextWrap="false"  PageWidth="397mm" PageHeight="210mm" BorderColor="Black" DefaultFontFamily="Calibri Light" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="100px">
                          <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>          
                    <MasterTableView Font-Size="Smaller" ShowGroupFooter="true"  CommandItemDisplay="Top" FilterItemStyle-VerticalAlign="Top">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToPdfText="PDF" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />                       
                        
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
        </div>
    </div>
</div> 
</asp:Content>