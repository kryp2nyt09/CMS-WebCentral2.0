﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cmsversion.Master" AutoEventWireup="true" CodeFile="ManageRateMatrix.aspx.cs" Inherits="_ManageRepresentatives" %>


<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../styles/default.css" rel="stylesheet" />


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
                      <telerik:RadWindow RenderMode="Lightweight" Behaviors="Close" runat="server" ID="rwRUTEdit" Height="350px" Width="380px">
                          </telerik:RadWindow>
                          <telerik:RadWindow RenderMode="Lightweight" Behaviors="Close" runat="server" ID="rwRateMatrix" Height="350px" Width="50px">
    </telerik:RadWindow>
                          <telerik:RadWindow RenderMode="Lightweight" Behaviors="Close" runat="server" ID="rwRateMatrixedit" Height="350px" Width="50px">
    </telerik:RadWindow>
    <div id="wrapper">
   <div id="page-wrapper"  >

            <div class="container-fluid" >

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                            <h4>Rate Matrix</h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">Maintenance</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Rate Matrix
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
                                DataKeyNames="RateMatrixId" CommandItemDisplay="Top"
                                OnNeedDataSource="RadGrid2_NeedDataSource"> 
                                <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="RateMatrixId"
                                    AllowFilteringByColumn="false"
                                    DataKeyNames="RateMatrixId" CommandItemDisplay="Top" 
                                    InsertItemPageIndexAction="ShowItemOnFirstPage">
                                   <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true" 
            ShowExportToCsvButton="true" ShowExportToPdfButton="true"></CommandItemSettings>
                                    <Columns>


                                        <telerik:GridNumericColumn DataField="ApplicableRateName" HeaderText="ApplicableRate Name" SortExpression="ApplicableRateName"
                                            UniqueName="ApplicableRateName"  >
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        
                                        <telerik:GridNumericColumn DataField="CommodityTypeName" HeaderText="CommodityType Name" SortExpression="CommodityTypeName"
                                            UniqueName="CommodityTypeName" >
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="ServiceTypeName" HeaderText="Service Type Name" SortExpression="ServiceTypeName"
                                            UniqueName="ServiceTypeName"  ItemStyle-Width="10px">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="ServiceModeName" HeaderText="Service Mode Name" SortExpression="ServiceModeName"
                                            UniqueName="ServiceModeName"  ItemStyle-Width="10px">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                      

               

                                                                                     <telerik:GridTemplateColumn DataField="ApplyEvm" HeaderText="Apply Evm" SortExpression="ApplyEvm" UniqueName="ApplyEvm" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkApplyEvm" runat="server" Checked='<%# Eval("ApplyEvm")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn DataField="ApplyWeight" HeaderText="Apply Weight" SortExpression="ApplyWeight" UniqueName="ApplyWeight" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkApplyWeight" runat="server" Checked='<%# Eval("ApplyWeight")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                                                               
                                             <telerik:GridTemplateColumn DataField="HasAwbFee" HeaderText="Has Awb Fee" SortExpression="HasAwbFee" UniqueName="HasAwbFee" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chckHasAwbFee" runat="server" Checked='<%# Eval("HasAwbFee")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                      
                                        
                                             <telerik:GridTemplateColumn DataField="HasInsurance" HeaderText="Has Insurance" SortExpression="HasInsurance" UniqueName="HasInsurance" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chckHasInsurance" runat="server" Checked='<%# Eval("HasInsurance")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                      
                                        
                                              <telerik:GridTemplateColumn DataField="HasFuelCharge" HeaderText="Has Fuel Charge" SortExpression="HasFuelCharge" UniqueName="HasFuelCharge" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chckHasFuelCharge" runat="server" Checked='<%# Eval("HasFuelCharge")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                              

                                              <telerik:GridTemplateColumn DataField="IsVatable" HeaderText="Is Vatable" SortExpression="IsVatable" UniqueName="IsVatable" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chckIsVatable" runat="server" Checked='<%# Eval("IsVatable")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                      
                                        
                                              <telerik:GridTemplateColumn DataField="HasValuationCharge" HeaderText="Has Valuation Charge" SortExpression="HasValuationCharge" UniqueName="HasValuationCharge" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkHasValuationCharge" runat="server" Checked='<%# Eval("HasValuationCharge")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                             

                                              <telerik:GridTemplateColumn DataField="HasDeliveryFee" HeaderText="Has Delivery Fee" SortExpression="HasDeliveryFee" UniqueName="HasDeliveryFee" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkHasDeliveryFee" runat="server" Checked='<%# Eval("HasDeliveryFee")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                       
                                              <telerik:GridTemplateColumn DataField="HasPerishableFee" HeaderText="Has Perishable Fee" SortExpression="HasPerishableFee" UniqueName="HasPerishableFee" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkHasPerishableFee" runat="server" Checked='<%# Eval("HasPerishableFee")%>'  Enabled="false"/>
        
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>
                                        
                                          <telerik:GridTemplateColumn DataField="HasDangerousFee" HeaderText="Has Dangerous Fee" SortExpression="HasDangerousFee" UniqueName="HasDangerousFee" ItemStyle-Width="5px">
                                            <ItemTemplate> 
                                                 <asp:CheckBox ID="chkDangerousFee" runat="server" Visible="true" Checked='<%# Eval("HasDangerousFee")%>'  Enabled="false"/>
         <telerik:RadCheckBox runat="server" ID="rchb1" BorderColor="White" ForeColor="White"></telerik:RadCheckBox>
                                            </ItemTemplate>  
                                        </telerik:GridTemplateColumn>

                                  
                                    
                                        <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false" HeaderText="Weight Break" HeaderStyle-Width="5px">
                                            <ItemTemplate>
                                                <asp:HyperLink  ID="WeightBreakLink" runat="server" Text="Manage"  ></asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:HyperLink  ID="EditLink" runat="server" Text="Edit"  ></asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    <%--    <telerik:GridButtonColumn  CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>--%>
                                         <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this record?" ButtonType="LinkButton"
                                            ConfirmDialogType="RadWindow" ConfirmDialogHeight="150px" ConfirmTitle="Deactivate User" 
                                             CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>


                                    </Columns>

                                    <CommandItemTemplate>

                                      
                                       

                            |
                                            <a href="#"  onclick="return ShowExportForm();">
                                            <img src="../images/emblem.png" alt="CreateCombination" width="20px">
                                           Create Combination
                                            </a>

                            
                                             
                                        |
                                        <a href="#"  onclick="return ShowExportForm();">
                                            <img src="../images/emblem.png" alt="Print Preview" width="20px">
                                           Print Preview
                                            </a>
       |
                   
                                 
                                        <a href="#"  onclick="location.reload();">
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
                                    <telerik:RadWindow RenderMode="Mobile" ID="UserListDialog" runat="server" Title="Editing record" Height="620px"
                                        Width="1300px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                                        Modal="true" Behaviors="Close,Move">
                                    </telerik:RadWindow>

                                     <telerik:RadWindow RenderMode="Mobile" ID="EditRate" runat="server" Title="Adding record" Height="600px"
                                        Width="300px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar ="false" AutoSize="false"
                                        Modal="true" Behaviors="Close,Move"  >
                                    </telerik:RadWindow>

                                    
                                     <telerik:RadWindow RenderMode="Mobile" ID="AddRate" runat="server" Title="Export Report Preview" Height="590px"
                                        Width="300px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar ="false" AutoSize="false"
                                        Modal="true" Behaviors="Close,Move"  >
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

                                    window.radopen("ManageRateMatrixImport.aspx?ID=" + id, "UserListDialog");
                                    return false;
                                }
                                function ShowEditRateForm(id, rowIndex) {
                                    var grid = $find("<%= RadGrid2.ClientID %>");

                                     var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                                     grid.get_masterTableView().selectItem(rowControl, true);

                                     window.radopen("UserModal/RateMatrix/EditRateMatrix.aspx?RateMatrixId=" + id, "EditRate");
                                     return false;
                                 }
                                 function ShowInsertForm() {
                                     //window.radopen("AddNewUser.aspx", "AddUser");
                                     return false;
                                 }

                                 function ShowExportForm() {
                                     window.radopen("UserModal/RateMatrix/AddRateMatrix.aspx", "AddRate");
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
                                    window.radopen("UserModal/RateMatrix/EditRateMatrix.aspx?RateMatrixId=" + eventArgs.getDataKeyValue("RateMatrixId"), "EditRate");
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
