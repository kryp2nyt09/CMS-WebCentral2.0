<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCargo.aspx.cs" Inherits="_ViewCargo" %>
<%--<%@ Reference VirtualPath="~/portal/Dashboard.aspx" %>--%>
<%--<%@ Reference VirtualPath="../../../AwbDetailsModel.cs" %>--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>

    <link href="../../font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Website Font style -->
    <link href="../../css/bootstrap.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'/>

    
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="page-wrapper">

                <div class="container-fluid">

                    <asp:ScriptManager ID="ScriptManager2" runat="server" />
                   <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">
                       <br />
                       
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" ClientEvents-OnRequestStart="onRequestStart" runat="server" CssClass="gridwrapper">


                            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
                                <AjaxSettings>
                                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                                        <UpdatedControls>
                                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                                        </UpdatedControls>
                                    </telerik:AjaxSetting>
                                    <telerik:AjaxSetting AjaxControlID="radgrid2">
                                        <UpdatedControls>
                                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                                        </UpdatedControls>
                                    </telerik:AjaxSetting>
                                </AjaxSettings>
                            </telerik:RadAjaxManager>
                            <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
                           

                             <asp:HiddenField ID="lblAwbNumber" runat="server" Visible="true"></asp:HiddenField>

                            <telerik:RadGrid ID="rdViewCargo" 
                                runat="server" AllowPaging="True" 
                                ExportSettings-Excel-DefaultCellAlignment="Right"
                                PageSize="10" 
                                Skin="Glow" 
                                AllowSorting="true"
                                RenderMode="Mobile"
                                CommandItemDisplay="Top"
                                OnNeedDataSource="rdViewCargo_NeedDataSource"> 
                                <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                                
                                <MasterTableView AutoGenerateColumns="False"
                                    AllowFilteringByColumn="false"
                                    CommandItemDisplay="Top" 
                                    InsertItemPageIndexAction="ShowItemOnFirstPage">
                                   
                                    <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false" 
                                    ShowExportToCsvButton="false" ShowExportToPdfButton="false">

                                    </CommandItemSettings>
                                    <Columns>

                                      <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                             CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                             DataField="cargo" HeaderText="Cargo">

                                      </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                               
                            </telerik:RadGrid>
                            <br />
                            <br />
                        </telerik:RadAjaxPanel>
                    </telerik:LayoutColumn>
                </div>
            </div>
        </div>
   
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
    </form>
</body>
</html>
