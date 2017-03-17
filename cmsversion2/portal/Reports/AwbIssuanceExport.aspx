<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AwbIssuanceExport.aspx.cs" Inherits="AwbIssuanceExport" %>

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
         
          <telerik:RadGrid ID="RadGrid2"  Skin="Glow"
                             runat="server" 
                             OnNeedDataSource="RadGrid2_NeedDataSource"
                             AllowPaging="True" 
                             AutoGenerateColumns="false"
                             AllowSorting="true"
                             ExportSettings-Excel-DefaultCellAlignment="Right"
                             PageSize="10"
                             DataKeyNames="AwbIssuanceId" CommandItemDisplay="Top">
                            <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                            
              <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="false" FileName="AWBIssuance" Pdf-PageLeftMargin="20px" Pdf-PageRightMargin="20px"> 
                        <Pdf ForceTextWrap="true" PageWidth="397mm" PageHeight="210mm" BorderColor="Black" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="100px">
                          <PageHeader>
                               <MiddleCell  Text="<img src='../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                       
                    </ExportSettings>          


                            <MasterTableView AutoGenerateColumns="False" 
                                ClientDataKeyNames="AwbIssuanceId"
                                DataKeyNames="AwbIssuanceId" 
                                CommandItemDisplay="Top"
                                InsertItemPageIndexAction="ShowItemOnFirstPage">
                                 <CommandItemSettings ShowExportToExcelButton="false" ShowExportToPdfButton="true" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false"/>
                                <Columns>

                                 <telerik:GridDateTimeColumn
                                 HeaderText="Date Assigned" AllowFiltering="true" DataField="IssueDate" SortExpression="IssueDate" FilterListOptions="VaryByDataType"
                                 PickerType="DatePicker"  DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" UniqueName="IssueDate" FilterControlWidth="100px" ></telerik:GridDateTimeColumn>

                                <telerik:GridBoundColumn DataField="BranchCorpOfficeName" HeaderText="BCO"></telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="RevenueUnitName" HeaderText="Area"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="SeriesStart" HeaderText="Start Series"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="SeriesEnd" HeaderText="End Series"></telerik:GridBoundColumn>

                                </Columns>

                            </MasterTableView>
                        </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
