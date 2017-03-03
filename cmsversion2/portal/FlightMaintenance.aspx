<%@ Page Title="" Language="C#" MasterPageFile="~/cmsversion.Master" AutoEventWireup="true" CodeFile="FlightMaintenance.aspx.cs" Inherits="_FlightMaintenance" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../styles/default.css" rel="stylesheet" />


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="wrapper">
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">

                        <h4>Flight Details</h4>

                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i><a href="#"> Flight Information</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i>Flight Information
                            </li>
                        </ol>
                        <hr />

                    </div>
                </div>
                <!-- /.row -->
                <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">

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

                        <telerik:RadGrid ID="RadGrid2" OnItemCreated="RadGrid2_ItemCreated"
                            runat="server" AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right"
                            PageSize="10" Skin="Glow" AllowSorting="true" OnItemCommand="RadGrid2_ItemCommand1"
                            RenderMode="Mobile"
                            DataKeyNames="FlightInfoId" CommandItemDisplay="Top"
                            OnNeedDataSource="RadGrid2_NeedDataSource">
                            <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="FlightInfoId"
                                AllowFilteringByColumn="false"
                                DataKeyNames="FlightInfoId" CommandItemDisplay="Top"
                                InsertItemPageIndexAction="ShowItemOnFirstPage">
                                <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true"
                                    ShowExportToCsvButton="true" ShowExportToPdfButton="true"></CommandItemSettings>
                                <Columns>

                                    <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No" SortExpression="FlightNo"
                                        UniqueName="FlightNo">
                                        <HeaderStyle />
                                    </telerik:GridBoundColumn>

                                    
                                    <telerik:GridDateTimeColumn DataField="ETD" HeaderText="ETD" SortExpression="ETD"
                                        UniqueName="ETD" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                                        <HeaderStyle />
                                    </telerik:GridDateTimeColumn>

                                    <telerik:GridDateTimeColumn DataField="ETA" HeaderText="ETA" SortExpression="ETA"
                                        UniqueName="ETA" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                                        <HeaderStyle />
                                    </telerik:GridDateTimeColumn>

                                    <telerik:GridNumericColumn DataField="BCOName" HeaderText="BCOName" SortExpression="BCOName"
                                        UniqueName="BCOName">
                                        <HeaderStyle />
                                    </telerik:GridNumericColumn>

                                    
                                    <telerik:GridNumericColumn DataField="GateWayName" HeaderText="GateWay Name" SortExpression="GateWayName"
                                        UniqueName="GateWayName">
                                        <HeaderStyle />
                                    </telerik:GridNumericColumn>

                                    <telerik:GridNumericColumn DataField="OriginCityName" HeaderText="Origin City" SortExpression="OriginCityName"
                                        UniqueName="OriginCityName">
                                        <HeaderStyle />
                                    </telerik:GridNumericColumn>

                                    
                                    <telerik:GridNumericColumn DataField="DestinationCityName" HeaderText="DestinationCityName" SortExpression="DestinationCityName"
                                        UniqueName="DestinationCityName">
                                        <HeaderStyle />

                                    </telerik:GridNumericColumn>

<%--                                    <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" HeaderText="Representatives" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="ViewRepsLink" runat="server" Text="View"></asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>

                                   <%-- <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" HeaderText="Approving Authority" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="ViewApprovingLink" runat="server" Text="View"></asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn--%>

                                    <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="EditLink" runat="server" Text="Edit"></asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>


                                    <%--    <telerik:GridButtonColumn  CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>--%>
                                    <telerik:GridButtonColumn ConfirmText="Are you sure you want to deactivate this user?" ButtonType="LinkButton"
                                        ConfirmDialogType="RadWindow" ConfirmDialogHeight="150px" ConfirmTitle="Deactivate User"
                                        CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                        <HeaderStyle />
                                    </telerik:GridButtonColumn>
                                </Columns>

                                <CommandItemTemplate>
                                    |

                                         <a href="#" onclick="return ShowInsertForm();">
                                             <img src="../images/emblem.png" alt="Add Company" width="20px">
                                             Add FlightInfo
                                         </a>
                                    |    
                                        
                                        <a href="#" onclick="return ShowExportForm();">
                                            <img src="../images/emblem.png" alt="Print Preview" width="20px">
                                            Print Preview
                                        </a>
                                    |
                   
                                 
                                        <a href="#" onclick="location.reload();">
                                            <img src="../images/emblem.png" alt="Export to Excel" width="20px">
                                            Refresh Data
                                        </a>

                                    |
                                       
                                </CommandItemTemplate>

                            </MasterTableView>
                            <ClientSettings>
                                <Selecting AllowRowSelect="true"></Selecting>
                                <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
                            </ClientSettings>
                        </telerik:RadGrid>
                        <br />
                        <br />
                        <telerik:RadWindowManager RenderMode="Mobile" ID="RadWindowManager1" runat="server" EnableShadow="true">
                            <Windows>
                                <telerik:RadWindow RenderMode="Mobile" ID="UserListDialog" runat="server" Title="Editing record" Height="700px"
                                    Width="380px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                                    Modal="true" Behaviors="Close,Move">
                                </telerik:RadWindow>

                                <telerik:RadWindow RenderMode="Mobile" ID="AddUser" runat="server" Title="Adding record" Height="700px"
                                    Width="380px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar="false" AutoSize="false"
                                    Modal="true" Behaviors="Close,Move">
                                </telerik:RadWindow>

                                <telerik:RadWindow RenderMode="Mobile" ID="ViewRepresentative" runat="server" Title="Representatives" Height="590px"
                                    Width="1000px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar="false" AutoSize="false"
                                    Modal="true" Behaviors="Close,Move">
                                </telerik:RadWindow>
                                <telerik:RadWindow RenderMode="Mobile" ID="ShowExport" runat="server" Title="Export Report Preview" Height="590px"
                                    Width="900px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar="false" AutoSize="false"
                                    Modal="true" Behaviors="Close,Move">
                                </telerik:RadWindow>
                            </Windows>
                        </telerik:RadWindowManager>
                    </telerik:RadAjaxPanel>
                    <telerik:RadCodeBlock runat="server">
                        <script type="text/javascript">
                            function onRequestStart(sender, args) {
                                if (args.get_eventTarget().indexOf("Button") >= 0) {
                                    args.set_enableAjax(false);
                                }
                            }
                        </script>


                        <script type="text/javascript">
                            function ShowEditForm(id, rowIndex) {
                                var grid = $find("<%= RadGrid2.ClientID %>");

                                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                                grid.get_masterTableView().selectItem(rowControl, true);

                                window.radopen("UserModal/Flight/EditFlight.aspx?Id=" + id, "UserListDialog");
                                return false;
                            }

                            function ViewRep(id, rowIndex) {
                                var grid = $find("<%= RadGrid2.ClientID %>");

                                    var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                                    grid.get_masterTableView().selectItem(rowControl, true);

                                    window.radopen("UserModal/ViewRepresentative.aspx?CompanyId=" + id, "ViewRepresentative");
                                    return false;
                                }

                                function ViewApprovingAuthority(id, rowIndex) {
                                    var grid = $find("<%= RadGrid2.ClientID %>");

                                   var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                                   grid.get_masterTableView().selectItem(rowControl, true);

                                   window.radopen("UserModal/ViewApprovingAuthority.aspx?CompanyId=" + id, "ViewRepresentative");
                                   return false;
                               }

                               function ShowInsertForm() {
                                   window.radopen("UserModal/Flight/AddFlight.aspx", "AddUser");
                                   return false;
                               }

                               function ShowExportForm() {
                                   window.radopen("Reports/CompanyExportPreview.aspx", "ShowExport");
                                   return false;
                               }


                               function refreshGrid(arg) {
                                   if (!arg) {
                                       $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                                      }
                                      else {
                                          $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                                      }
                                  }
                                  function RowDblClick(sender, eventArgs) {

                                    <%--<%--    //changed code here 
                                    var grid = $find("<%= RadGrid2.ClientID %>");
                                    var MasterTable = grid.get_masterTableView();
                                    var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                                    var key = MasterTable.getCellByColumnUniqueName(row, "UserId");  // get the value by uniquecolumnname
                                    var ID = key.innerHTML;        
                                    MasterTable.fireCommand("MyClick2",ID);        
                                --%>
                                    //ShowEditForm();
                                      window.radopen("UserModal/Flight/EditFlight.aspx?Id=" + eventArgs.getDataKeyValue("FlightInfoId"), "UserListDialog");
                                }
                        </script>


                    </telerik:RadCodeBlock>

                </telerik:LayoutColumn>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->


    </div>
</asp:Content>
