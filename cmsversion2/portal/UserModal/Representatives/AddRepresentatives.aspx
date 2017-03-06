<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddRepresentatives.aspx.cs" EnableEventValidation="false" Inherits="_AddRepresentatives" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Representatives</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>
    <link href="../../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->

    <link href="../../../css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <style type="text/css">
        /*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
        http://localhost:54977/font-awesome/css/font-awesome.min.css
        /*
 * General styles
 */
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            background-color: #fff;
            font-family: 'Oxygen', sans-serif;
            overflow: hidden;
        }

        .main {
            margin-top: 70px;
        }

        h1.title {
            font-size: 50px;
            font-family: 'Passion One', cursive;
            font-weight: 400;
        }

        /*hr {
            width: 10%;
            color: #fff;
        }*/

        /*.form-group {
            margin-bottom: 15px;
        }*/

        /*label {
            margin-bottom: 15px;
        }*/

        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #fff;
            /* shadows and rounded borders */
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 330px;
            padding: 40px 40px;
        }

        .login-button {
            margin-top: 5px;
        }

        .login-register {
            font-size: 11px;
            text-align: center;
        }

        input:required:hover {
            opacity: 1;
        }

        #footer {
        position: fixed;
        right:0;
        bottom: 0;
   
    }

        .page{
            margin-top: 30px;
            margin-right: 15px;
            margin-left: 15px;
        }

    </style>
    <script type="text/javascript">

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;//Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz az well)
            return oWindow;
        }

        function CloseOnReload() {
            //GetRadWindow().Close();
            var oWnd = GetRadWindow();
            oWnd.close();
            top.location.href = top.location.href;
        }

        function RefreshParentPage() {
            var oWnd = GetRadWindow();
            oWnd.close();
            top.location.href = top.location.href;
        
        }
        </script>

</head>
<body>
    <form id="form1" runat="server">

        

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

       <%-- <asp:ScriptManager ID="ScriptManager2" runat="server" />--%>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
       <%-- <asp:Button runat="server" Text="Close" ID="CloseButton"     OnClick="CloseButton_Click1"/>--%>
        <div class="">
            <form class="form-horizontal" method="post" action="#">
               
                 <div class="page">
                    <div class="col-xs-6">
                        <div class="col-xs-3">
                           
                             <asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label>

                            <br />
                            <br />
                              <asp:Label ID="Label4" runat="server" Text="Last Name"></asp:Label>
                             
                            <br />
                            <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" Text="Address 1"></asp:Label>
                        
                            <br />
                             <br />
                             <asp:Label ID="Label8" runat="server" Text="Address 2"></asp:Label>
                            
                     
                             <br />
                             <br />
                            <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
                            <br />
                             <br />
                             <asp:Label ID="Label46" runat="server" Text="Zip Code"></asp:Label>
                              <br />
                             <br />

                            <asp:Label ID="Label13" runat="server" Text="Street"></asp:Label>
                            <br />
                             <br />
                              <br />
                             <asp:Label ID="Label14" runat="server" Text="Barangay"></asp:Label>
                            
                        </div>

                        <div class="col-xs-3">
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepFirstName" Enabled ="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepLastName" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepAdress1" TextMode="MultiLine" Enabled="True" runat="server"></telerik:RadTextBox>
                             <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepAdress2" TextMode="MultiLine" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadComboBox ID="rcbRepCity" Width="230px" Height="200px" AutoPostBack="true" runat="server"></telerik:RadComboBox>
                          <br />
                            <br />
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepzipCode" Enabled ="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepBarangay" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepStreet" Enabled="True" runat="server"></telerik:RadTextBox>
                         
                         </div>
                    </div>

                    <div class="col-xs-6">
                        <div class="col-xs-3">
                            <asp:Label ID="Label7" runat="server" Text="Company"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Area"></asp:Label>
                            <br />
                            <br />
                              <asp:Label ID="Label9" runat="server" Text="Contact No"></asp:Label>
                             <br />
                            <br />
                             <asp:Label ID="Label10" runat="server" Text="Mobile No"></asp:Label>
                             <br />
                             <br />
                            <asp:Label ID="Label11" runat="server" Text="Fax"></asp:Label>
                            <br />
                              <br />
                            <br />
                             <asp:Label ID="Label12" runat="server" Text="Email"></asp:Label>
                             <br />
                              <br />
                            <br />
                             <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                            
                              <br />
                            <br />
                             <asp:Label ID="Label15" runat="server" Text="Department"></asp:Label>
                             <br />
                              <br />
                            <br />
                             <asp:Label ID="Label16" runat="server" Text="Remarks"></asp:Label>
                        </div>

                        <div class="col-xs-3">
                             <telerik:RadComboBox ID="rcbRepCompany" Width="230px" Height="200px" AutoPostBack="true" runat="server"></telerik:RadComboBox>
                          <br />
                            <br />
                              <telerik:RadComboBox ID="rcbRepArea" Width="230px" Height="200px" AutoPostBack="true" runat="server"></telerik:RadComboBox>
                            <br />
                            <br />
                            <telerik:RadTextBox RenderMode="Mobile" ID="txtRepContactNo" Enabled="True" Width="230px" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepMobileNo" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                           <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepFax" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                               <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepEmail" Enabled="True" runat="server"></telerik:RadTextBox>
                              <br />
                            <br />
                           <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepTitle" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                               <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepDept" Enabled="True" runat="server"></telerik:RadTextBox>
                             <br />
                            <br />
                               <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtRepRemarks" TextMode="MultiLine" Enabled="True" runat="server"></telerik:RadTextBox>

                         </div>

                </div>
                    </div>

                
                       
                <div id="footer">
                 <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"></telerik:RadButton>
                 <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click"></telerik:RadButton>
                </div>
            </form>


        </div>
        
        <script type="text/javascript" src="../../../js/bootstrap.js"></script>

        <br />
    </form>
</body>
</html>
