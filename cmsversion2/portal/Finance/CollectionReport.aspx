<%@ Page Title="Collections"  Language="C#" MasterPageFile="~/cmsversion.master" AutoEventWireup="true" CodeFile="CollectionReport.aspx.cs" Inherits="portal_Finance_CollectionReport" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div id="wrapper" style="height:1000px;">
    <div id="page-wrapper"> 
         <div class="container">
             <!--- PAGE HEADER --->
             <div class="row col-lg-12">
                <h3>COLLECTION</h3>
                <ol class="breadcrumb">
                    <li>Finance</li>
                    <li>Collection</li>
                </ol>
             </div>
            <!--- PAGE BODY --->
             <div class="row col-lg-12" >
                <telerik:RadGrid ID="grid_Collection" runat="server"  Skin="Glow"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="true"
                    AutoGenerateColumns="true"
                    AllowSorting="true" OnNeedDataSource="grid_Collection_NeedDataSource">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true">
                        <Pdf Title="Branch Acceptance" PageHeaderMargin="10px" PageTopMargin="100px" BorderType="AllBorders" BorderStyle="Thin">
                            <PageHeader>
                              <MiddleCell  Text="<img src='../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>"/>
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" Font-Size="Small">
                        <CommandItemSettings ShowExportToExcelButton="true" 
                             ShowExportToPdfButton="true" ShowExportToWordButton="true"
                             ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  
                             ShowRefreshButton="false" />
                    
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
         </div>
    </div>
</div>
 </asp:Content>
