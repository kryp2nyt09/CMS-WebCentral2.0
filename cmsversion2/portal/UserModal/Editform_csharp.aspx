<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" EnableEventValidation="false" Inherits="portal_Editform_csharp" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->

    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

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
    </style>

    <script type="text/javascript">
        function GetRadWindow()
        {
        var oWindow = null;
        if(window.radWindow) oWindow = window.radWindow;
        else if(window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
        }
        function CloseOnReload()
        {
        var oWnd =  GetRadWindow();
        oWnd.close();
        top.location.href = top.location.href;
        }

        function RefreshParentPage()
        {
        var oWnd =  GetRadWindow();
        oWnd.close();
        top.location.href = top.location.href;
        }

 function Close() {
                    var oWindow = GetRadWindow();
                    oWindow.argument = null;
                    oWindow.close();
                    oWindow.BrowserWindow.location = "newPage.aspx";
                    top.location.reload();
                    alert('triggered');
                    return false;
                }
    </script>


</head>
<body>
    <form id="form1" runat="server">
       
            <asp:ScriptManager ID="ScriptManager2" runat="server" />
            <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />

            <div class="main-login main-center">
                <form class="form-horizontal" method="post" action="#">

                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Employee Name</label>
                        <div class="cols-sm-10" style="font-size: 12px;">
                            <div class="input-group">
                         
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtEmployeeName" Enabled="false" runat="server"></telerik:RadTextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Username</label>
                        <div class="cols-sm-10">
                            <div class="input-group" style="font-size: 12px">

                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <%--<input type="text" class="form-control" name="name" id="name" placeholder="Enter your Name" style="width: 175px" required />--%>

                                <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtUsername" runat="server"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtUsername"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Old Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group" style="font-size: 12px">

                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <%--<input type="text" class="form-control" name="name" id="name" placeholder="Enter your Name" style="width: 175px" required />--%>

                                <telerik:RadTextBox Width="190px" RenderMode="Mobile" textmode="Password" ID="txtOldPassword" runat="server"></telerik:RadTextBox>
                               
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtOldPassword"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                
                            </div>
                        </div>
                    </div>
                     <telerik:RadTextBox Width="190px"  RenderMode="Mobile" ID="txtDbPassword" runat ="server" Skin="Default"></telerik:RadTextBox>
                               
                    



                    <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group" style="font-size: 12px">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                <telerik:RadTextBox Width="190px" TextMode="Password" RenderMode="Mobile" ID="txtNewPassword" runat="server" Skin="Default"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtNewPassword"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                                                           
                    <div class="form-group">
                        <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group" style="font-size: 12px">

                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <telerik:RadTextBox Width="190px" RenderMode="Mobile" TextMode="Password" ID="txtConfirmPassword" runat="server"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtConfirmPassword"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                

                            </div>
                        </div>
                        
                    </div>
                    <asp:CompareValidator ID="CompareValidator" runat="server"
                                    ControlToValidate="txtNewPassword"
                                    ControlToCompare="txtConfirmPassword"
                                    ErrorMessage="Password does not match!"
                                    ForeColor="Red">                                    
                                </asp:CompareValidator>
                    <br />
                     <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ControlToValidate="txtDbPassword"
                                    Operator="Equal"
                                    type="String"
                                    ControlToCompare="txtOldPassword"
                                    ErrorMessage="Old password not match to username!"
                                    ForeColor="Red">                                    
                                </asp:CompareValidator>
                            

                    

                     <br />
                    <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="Save_Click"></telerik:RadButton>
                    <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click" OnClientClicked="redirect"></telerik:RadButton>

                    

                    <%--<div class="form-group">
                     
                        <div class="cols-sm-10">

                            <div class="form-group">
                                <label for="name" class="cols-sm-2 control-label">Assigned To:</label>
                                <div class="cols-sm-10" style="font-size: 12px;">
                                    <div class="input-group">
                                        <asp:DropDownList Width="230px" Height="200px" ID="ddlAssigned" runat="server" Style="font-size: 12px;" OnTextChanged="ddlAssigned_TextChanged" SelectMethod="" AutoPostBack="true"  OnSelectedIndexChanged="ddlAssigned_SelectedIndexChanged">
                                     
                                        </asp:DropDownList>
                                 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlAssigned"
                                            ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="cols-sm-2 control-label">Select location</label>
                                <div class="cols-sm-10" style="font-size: 12px;">
                                    <div class="input-group">
                                        <asp:DropDownList Width="230px" Height="200px" ID="ddlLocation" runat="server" Style="font-size: 12px;">
                                         
                                        </asp:DropDownList>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlLocation"
                                            ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group " style="padding-bottom: 10px">
                                <br />
                                <asp:Button ID="btnSubmit" class="btn btn-primary btn-lg btn-block login-button" Style="width: 50%; height: 35px; font-size: 12px" runat="server" Text="Submit" />



                            </div>
                          

                        </div>
                    </div>--%>




                </form>

            </div>
            <%--<script src="../js/bootstrap.js"></script>--%>
            <script type="text/javascript" src="../../js/bootstrap.js"></script>
            <br />
    </form>
</body>
</html>