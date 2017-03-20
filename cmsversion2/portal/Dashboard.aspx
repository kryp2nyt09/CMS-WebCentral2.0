<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/cmsversion.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="_Dashboard" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../styles/default.css" rel="stylesheet" />
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <div id="wrapper">
       <div id="page-wrapper">
           <div class="container">
               <!-- Page Heading -->
               <div class="row">
                   <div class="col-lg-12">
                       <h3>Dashboard</h3>
                      <%-- <ol class="breadcrumb">
                           <li>Dashboard</li>
                            <li class="active">Dashboard</li>
                       </ol><!--breadcrumb-->--%>
                       <hr />
                   </div>
               </div><!--row-->
               <div class="row">
                   <div class="col-md-12">
                       <telerik:RadLabel ID="lblAwbNo" runat="server" Text="Airway Bill:"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtAwbNo" runat="server" Width="230px" RenderMode="Mobile" Enabled="true"></telerik:RadTextBox>
                        <telerik:RadButton ID="btnSearchAwbNo" runat="server" Skin="Glow" Text="SEARCH" OnClick="btnSearch_Click"></telerik:RadButton>
                    </div>
               </div>
               <br />

               <div class="row">
                   <div class="col-md-12">
                   <div class="col-md-4">
                        <telerik:RadLabel ID="lblAwb" runat="server" Text="Airway Bill:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtAwb" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br />
                        <br />

                        <telerik:RadLabel ID="lblDate" runat="server" Text="Date:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtDate" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br />
                        <br />

                        <telerik:RadLabel ID="lblOrigin" runat="server" Text="Origin:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtOrigin" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblDestination" runat="server" Text="Destination:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtDestination" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblShipper" runat="server" Text="Shipper:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtShipper" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblConsignee" runat="server" Text="Consignee:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtConsignee" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                       
                    </div>
                   <div class="col-md-4">
                      <telerik:RadLabel ID="lblCommodity" runat="server" Text="Commodity:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtCommodity" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblDesc" runat="server" Text="Description:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtDesc" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblServiceType" runat="server" Text="Service Type:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtServiceType" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblShipMode" runat="server" Text="ShipMode:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtShipMode" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblAddress1" runat="server" Text="Address:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtAddress1" runat="server" Width="230px" TextMode="MultiLine" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblAddress2" runat="server" Text="Address:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtAddress2" runat="server" Width="230px" TextMode="MultiLine" Enabled="false"></telerik:RadTextBox>
                       
                    </div>

                   <div class="col-md-4">
                      <telerik:RadLabel ID="lblQuantity" runat="server" Text="Quantity:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtQuantity" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblWeight" runat="server" Text="Weight:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtWeight" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                        <br /><br />

                        <telerik:RadLabel ID="lblDimension" runat="server" Text="Dimension:" Width="30%"></telerik:RadLabel>
                        <telerik:RadTextBox ID="txtDimension" runat="server" Width="230px" Enabled="false"></telerik:RadTextBox>
                    </div>
                 </div>
               </div>
               <br />
               


               <div class="row">

                   <telerik:RadGrid runat="server" Skin="Glow" 
                    ID="radGridAwbNo"
                    AllowPaging="True" 
                    PageSize="10"  
                    AllowFilteringByColumn="True" 
                    AutoGenerateColumns="false"
                    AllowSorting="true"
                   OnNeedDataSource="radGridAwbNo_NeedDataSource">
                        <GroupingSettings CaseSensitive="false"></GroupingSettings>
                       <ExportSettings HideStructureColumns="true" ExportOnlyData="true" IgnorePaging="true" UseItemStyles="false" FileName="AWBSeriesMonitoring" Pdf-PageLeftMargin="20px" Pdf-PageRightMargin="20px"> 
                        <Pdf ForceTextWrap="true" PageWidth="397mm" PageHeight="210mm" BorderColor="Black" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="100px">
                          <PageHeader>
                              <MiddleCell  Text="<img src='../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                        <Excel  Format="Xlsx"/>
                    </ExportSettings>      

                        <MasterTableView CommandItemDisplay="Top" Font-Size="Smaller">
                            <CommandItemSettings ShowExportToExcelButton="false" ShowExportToPdfButton="false" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false"/>
                            
                            <Columns>
                                
                                <telerik:GridDateTimeColumn
                                 DataField="Date" HeaderText="Date and Time" SortExpression="Date" AllowFiltering="true" FilterListOptions="VaryByDataType" Exportable="false"
                                 PickerType="DatePicker"  DataFormatString="{0:MM/dd/yyyy HH:mm}" DataType="System.DateTime" UniqueName="Date" FilterControlWidth="100px">
                             </telerik:GridDateTimeColumn>

                                <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="BookingStatusName" HeaderText="Status"></telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="RevenueUnitName" HeaderText="Location"></telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="ArrivedPcs" HeaderText="Arrived Pcs"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="Cargo" HeaderText="Cargo"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="ReceivedBy" HeaderText="Received By"></telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn FilterDelay="2000" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false"
                                  DataField="Remarks" HeaderText="Remarks"></telerik:GridBoundColumn>

                            </Columns>
                           
                        </MasterTableView>
                    </telerik:RadGrid><!--RadGrid - radGridAwbIssuance-->
                   <br />
               </div><!--row-->
           </div><!--container-->
       </div><!--page-wrapper-->
   </div><!--wrapper-->         
                 
</asp:Content>
