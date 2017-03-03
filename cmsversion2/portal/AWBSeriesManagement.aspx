<%@ Page Title="" Language="C#" MasterPageFile="~/cmsversion.Master" AutoEventWireup="true" CodeFile="AWBSeriesManagement.aspx.cs" Inherits="_AWBSeriesManagement" %>

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

            <div class="container-fluid" ">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                            <h4>Rate Matrix</h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">Reports</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> AWB Series Monitoring
                            </li>
                        </ol>
                        <hr />

                    </div>
                </div>
                <!-- /.row -->
                     BRANCH CORPORATE OFFICE :     <telerik:RadComboBox ID="rcbGroup" runat="server"></telerik:RadComboBox> <br /> <br />
                ASSIGNED TO BRANCH/AREA:  
                
                <telerik:RadDropDownList ID="RadDropDownList5" runat="server" AutoPostBack="true" DataValueField="category" >
                               <Items>
                                   <telerik:DropDownListItem Text="Area1" Value='India' />
                                   <telerik:DropDownListItem Text="Area2" Value='International' />  
                               </Items>
                           </telerik:RadDropDownList>
                           <telerik:RadDropDownList ID="RadDropDownList6" runat="server">
                                                              <Items>
                                   <telerik:DropDownListItem Text="1453 mall" Value='India' />
                                   <telerik:DropDownListItem Text="w43 mall" Value='International' />
                               </Items>
                           </telerik:RadDropDownList>
                <%--07012016_334253636_334253700--%>
 <br /> <br />
                AWB Series:  

                                           <telerik:RadDropDownList ID="RadDropDownList1" runat="server">
                                                              <Items>
                                   <telerik:DropDownListItem Text="07012016_334253636_334253700" Value='07012016_334253636_334253700' />
                                   <telerik:DropDownListItem Text="w43 mall" Value='07012016_334253636_334253700' />
                               </Items>
                           </telerik:RadDropDownList>
                
                <asp:Button  runat="Server" ID="btn" Text="Search" />
                <br />


<br />

                <br />
                <br />
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

                 
           </div>
</asp:Content>
