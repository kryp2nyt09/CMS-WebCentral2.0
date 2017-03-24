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
                <telerik:RadLabel runat="server" Text="Date:"></telerik:RadLabel>
                <telerik:RadDatePicker ID="Date" runat="server" Skin="Glow">
                </telerik:RadDatePicker>

                &nbsp;&nbsp;
                <telerik:RadLabel runat="server" Text="BCO:"></telerik:RadLabel>
                <telerik:RadComboBox ID="BCO" runat="server" Skin="Glow" AllowCustomText="true" MarkFirstMatch="true" 
                    AppendDataBoundItems="true" Width="300px">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                &nbsp;&nbsp;

                <telerik:RadLabel runat="server" Text="Area:"></telerik:RadLabel>
                <telerik:RadComboBox ID="Area" runat="server" Skin="Glow" AllowCustomText="true" MarkFirstMatch="true"
                    AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="0" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                &nbsp;&nbsp;

                <telerik:RadLabel runat="server" Text="Batch:"></telerik:RadLabel>
                <telerik:RadComboBox ID="Batch" runat="server" Skin="Glow" AllowCustomText="true" MarkFirstMatch="true" 
                    AppendDataBoundItems="true">
                    <Items>
                        <telerik:RadComboBoxItem Text="All" Value="All" Selected="true" />
                    </Items>
                </telerik:RadComboBox>
                &nbsp;&nbsp;

                <telerik:RadButton ID="Search" runat="server" Text="Search" 
                    Skin="Glow" AutoPostBack="true" OnClick="Search_Click"> </telerik:RadButton>
            </div>
            <br />
            <div class="row">
                
                <telerik:RadGrid ID="grid_BranchAcceptance" runat="server"  Skin="Glow"
                    AllowPaging="True" ShowFooter="true"
                    PageSize="10"  
                    AllowFilteringByColumn="false" 
                    AutoGenerateColumns="false"
                    AllowSorting="true" OnNeedDataSource="grid_BranchAcceptance_NeedDataSource">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" FileName="Branch_Acceptance" 
                        Pdf-DefaultFontFamily="Calibri" Pdf-PageLeftMargin="20px" Pdf-PageRightMargin="20px"
                        IgnorePaging="true" UseItemStyles="true" Pdf-BorderColor="Black">
                        <Pdf Title="Branch Acceptance" PageHeaderMargin="10px" 
                             PageTopMargin="120px" PageTitle="Branch Acceptance Report" 
                            BorderType="AllBorders" BorderStyle="Thin">
                            <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>"/>
                          </PageHeader>
                        </Pdf>

                    </ExportSettings>          
                    <MasterTableView CommandItemDisplay="Top" FilterItemStyle-VerticalAlign="Top" Font-Size="Smaller">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToPdfText="PDF" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                        <FilterItemStyle VerticalAlign="Top" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="No" HeaderText="#" HeaderStyle-Width="20px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AWB #" HeaderText="AWB #" FooterText="TOTAL: "></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RECIEVED QTY" HeaderText="RECIEVED QTY"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DISCREPENCY QTY" HeaderText="DISCREPENCY QTY"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TOTAL QTY" HeaderText="TOTAL QTY" FooterText=" " Aggregate="Sum"></telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="DRIVER" HeaderText="DRIVER"></telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="CHECKER" HeaderText="CHECKER"></telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="BATCH" HeaderText="BATCH"></telerik:GridBoundColumn>
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