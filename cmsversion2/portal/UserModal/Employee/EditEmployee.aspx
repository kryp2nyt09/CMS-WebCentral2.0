<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditEmployee.aspx.cs" EnableEventValidation="false" Inherits="_EditCrating" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
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

        <%--<asp:ScriptManager ID="ScriptManager2" runat="server" />--%>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
        <%--<asp:Button runat="server" Text="Close" ID="CloseButton"     OnClick="CloseButton_Click1"/>--%>
        <div class="main-login main-center">
            <form class="form-horizontal" method="post" action="#">
                 <asp:Label ID="lblEmployeeID" runat="server" Text="" Visible="false"></asp:Label>

                <div class="form-group">
                    <label class="cols-sm-2 control-label">Branch Corp Office</label>
                    <div class="input-group" style="font-size: 12px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                        <telerik:RadComboBox ID="rcbBranchCorpOffice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rcbBranchCorpOffice_SelectedIndexChanged"></telerik:RadComboBox>
                    </div>
                    <br />

                    <label  class="cols-sm-2 control-label">Assigned To</label>
                    <div class="input-group" style="font-size: 12px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                        <telerik:RadComboBox ID="rcbRevenueUnitType" runat="server" AutoPostBack="true" OnTextChanged="rcbRevenueUnitType_TextChanged" OnSelectedIndexChanged="rcbRevenueUnitType_SelectedIndexChanged"></telerik:RadComboBox>
                    </div>
                    <br />

                      <label class="cols-sm-2 control-label">Location</label>
                    <div class="input-group" style="font-size: 12px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                        <telerik:RadComboBox ID="rcbRevenueUnitName" runat="server"></telerik:RadComboBox>
                    </div>
                    <br />


                    <label class="cols-sm-2 control-label">Department</label>
                    <div class="input-group" style="font-size: 12px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                        <telerik:RadComboBox ID="rcbDepartment" runat="server"></telerik:RadComboBox>
                    </div>
                    <br />

                    <label for="email" class="cols-sm-2 control-label">Position</label>
                    <div class="input-group" style="font-size: 12px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                        <telerik:RadComboBox ID="rcbPosition" runat="server"></telerik:RadComboBox>
                    </div>
                    <br />

                    <label for="email" class="cols-sm-2 control-label">First Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">

                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>

                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtFirstname" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Last Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtLastname" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Middle Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtMiddlename" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Birth Date</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">

                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>

                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtBirthdate" Enabled="True" runat="server"></telerik:RadTextBox>

                        </div>
                        <br />

                    </div>

                    <label for="email" class="cols-sm-2 control-label">Tel. Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtTel" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Mobile Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtMobile" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Email</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtEmail" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Driver License Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtLicense" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <label for="email" class="cols-sm-2 control-label">Driver License Expiration</label>
                    <div class="cols-sm-10">
                        <div class="input-group" style="font-size: 12px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i></span>
                            <telerik:RadTextBox Width="190px" RenderMode="Mobile" ID="txtLicenseExpiration" Enabled="True" runat="server"></telerik:RadTextBox>
                        </div>
                        <br />
                    </div>

                    <br />
                    <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClicked=""></telerik:RadButton>
                    <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click" OnClientClicked="redirect"></telerik:RadButton>

                </div>

            </form>


        </div>
        <%--<script src="../js/bootstrap.js"></script>--%>
        <script type="text/javascript" src="../../../js/bootstrap.js"></script>

        <br />
    </form>
</body>
</html>
