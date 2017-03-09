<%@ Page Title="" Language="C#" MasterPageFile="~/cmsversion.master" AutoEventWireup="true" CodeFile="~/portal/Operation/Manifest/Manifest.aspx.cs" Inherits="portal_Operation_Manifest_Manifest" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../../styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div id="wrapper">
    <div id="page-wrapper"> 
         <div class="container-fluid">
             <!--- PAGE HEADER --->
             <div class="row col-lg-12">
                <h3>MANIFEST</h3>
             </div>
            <!--- PAGE BODY --->
             <div class="row col-lg-12" >
                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Office2010Black" Font-Size="Small">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="Pickup Cargo" PerTabScrolling="true" ScrollChildren="true" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Branch Acceptance" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Bundle" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Unbundle" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Gateway Transmital" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Gateway Outbound" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Gateway Inbound" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Cargo Transfer" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Segregation" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Daily Trip Report" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Hold Cargo" PerTabScrolling="True" ScrollChildren="True" Selected="True"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Height="500px">
                    <telerik:RadPageView ID="PickupCargo" runat="server" ContentUrl="PickupCargoManifestReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="BranchAcceptance" runat="server" ContentUrl="BranchAcceptanceReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="Bundle" runat="server" ContentUrl="BundleReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="Unbundle" runat="server" ContentUrl="UnbundleReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="GatewayTransmital" runat="server" ContentUrl="~/blank-page.html"></telerik:RadPageView>
                    <telerik:RadPageView ID="GatewayOutbound" runat="server" ContentUrl="~/blank-page.html"></telerik:RadPageView>
                    <telerik:RadPageView ID="GatewayInbound" runat="server" ContentUrl="~/blank-page.html"></telerik:RadPageView>
                    <telerik:RadPageView ID="CargoTransfer" runat="server" ContentUrl="~/blank-page.html"></telerik:RadPageView>
                    <telerik:RadPageView ID="Segregation" runat="server" ContentUrl="SegregationReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="DailyTrip" runat="server" ContentUrl="DailyTripReport.aspx"></telerik:RadPageView>
                    <telerik:RadPageView ID="HoldCargo" runat="server" ContentUrl="~/blank-page.html"></telerik:RadPageView>
                </telerik:RadMultiPage>
            </div>
         </div>
    </div>
</div>
</asp:Content>