<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewUser.aspx.cs" EnableEventValidation="false" Inherits="_AddNewUser" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>

    <link href="../../font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Website Font style -->
    <link href="../../css/bootstrap.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css' />

    <style type="text/css">
        /*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
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
            height: 150px;
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 330px;
            padding: 20px;
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
        right:10px;
        bottom: 10px;
   
    }

        .page{
            margin-top: 30px;
            margin-right: 15px;
            margin-left: 15px;
        }

        .errorMessage
        {
            position: fixed;
            top:auto;
            right:50px;
            bottom: 50px;
            left:130px;
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
    <form id="form1" runat="server" >
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
            <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
            <div class="">
            <form class="form-horizontal" method="post" action="#">
               <div class="page">
                    <div class="col-xs-8">
                        <div class="col-xs-4">
                            <asp:Label ID="Label3" runat="server" Text="Employee Name"></asp:Label>
                            <br />
                            <br />
                              <asp:Label ID="Label4" runat="server" Text="Username"></asp:Label>
                            <br />
                            <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                            <br />
                             <br />
                             <br />
                             <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
                        </div>

                        <div class="col-xs-4">
                             <asp:DropDownList Width="230px" Height="200px" ID="ddLEmployee" runat="server" Style="font-size: 12px;">
                                    <asp:ListItem>--Select Employee--</asp:ListItem>

                                </asp:DropDownList>
                            <br />
                            <br />
                            <telerik:RadTextBox  Width="230px" RenderMode="Mobile" ID="txtUsername" runat="server"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtUsername"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator><br />
                            <br />
                           <telerik:RadTextBox  Width="230px" TextMode="Password" RenderMode="Mobile" ID="txtPassword" runat="server"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtPassword"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>  <br />
                            <br />
                              <telerik:RadTextBox  Width="230px" RenderMode="Mobile" TextMode="Password" ID="txtConfirmPassword" runat="server"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtConfirmPassword"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator> <br />
                            <br />
                         
                         </div>
                       

                    </div>
                    </div>
                <div id="footer">
                     <div class="errorMessage"> 
                         <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ControlToValidate="txtPassword"
                                    ControlToCompare="txtConfirmPassword"
                                    ErrorMessage="Password does not match!"
                                    ForeColor="Red">                                    
                                </asp:CompareValidator>

                     </div>
                    
                  <telerik:RadButton ID="RadButton1" runat="server" Text="Save" OnClick="Save_Click"></telerik:RadButton>
                  <telerik:RadButton ID="RadButton2" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click" OnClientClicked="redirect"></telerik:RadButton>
                </div>
               
            </form>


        </div>



            <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
            <br />
        </div>
    </form>
</body>
</html>
