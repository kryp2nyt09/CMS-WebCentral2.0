<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RepresentativesExportReport.aspx.cs" Inherits="RepresentativesExportReport" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script type="text/javascript">
                function CloseAndRebind(args) {
                    GetRadWindow().BrowserWindow.refreshGrid(args);
                    GetRadWindow().close();
                }

                function GetRadWindow() {
                    var oWindow = null;
                    if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

                    return oWindow;
                }

                function CancelEdit() {
                    GetRadWindow().close();
                }
            </script>
            <asp:ScriptManager ID="ScriptManager2" runat="server" />
            <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Vista" DecoratedControls="All" />
         
           <telerik:RadGrid RenderMode="Lightweight" ID="rdPreview" OnNeedDataSource="rdPreview_NeedDataSource" AllowSorting="True" Skin="Simple" MasterTableView-AllowSorting="false"
            AutoGenerateColumns="false" AllowPaging="True" PageSize="10" runat="server" OnItemCommand="rdPreview_ItemCommand">
            <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="true">
            </ExportSettings>
            <MasterTableView Width="100%" CommandItemDisplay="Top" >
                <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />
                    <Columns>

                        <telerik:GridNumericColumn DataField="Name" HeaderText="Client Name" SortExpression="Name"
                                            UniqueName="Name">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        
                                        <telerik:GridNumericColumn DataField="AccountNo" HeaderText="AccountNo" SortExpression="AccountNo"
                                            UniqueName="AccountNo">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName"
                                            UniqueName="CompanyName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="CityName" HeaderText="City Name" SortExpression="CityName"
                                            UniqueName="CityName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                        
                                        <telerik:GridNumericColumn DataField="BranchCorpOfficeName" HeaderText="BranchCorpOffice" SortExpression="BranchCorpOfficeName"
                                            UniqueName="BranchCorpOfficeName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                       <telerik:GridDateTimeColumn DataField="ModifiedDate" HeaderText="Date Modified" SortExpression="ModifiedDate"
                                            UniqueName="ModifiedDate" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle />

                                        </telerik:GridDateTimeColumn>
                    </Columns>
                   <ItemStyle BackColor="#DFDFDF" />
                <HeaderStyle BackColor="#FFFFFF" ForeColor="#767676" />
                <AlternatingItemStyle BackColor="#FFFFFF" />

                </MasterTableView>
             
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
