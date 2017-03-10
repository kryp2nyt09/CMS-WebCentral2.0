<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" EnableEventValidation="false"  Inherits="_AddCrating" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css"/>--%>
    <link href="../../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->

    <link href="../../../css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'/>

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

        hr {
            width: 10%;
            color: #fff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            margin-bottom: 15px;
        }

        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #fff;
             /*shadows and rounded borders*/ 
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
        right:10px;
        bottom: 10px;
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

      <%--  <telerik:RadDateTimePicker ID="RadDateTimePicker1" Runat="server">
        </telerik:RadDateTimePicker>--%>

        <%--<asp:ScriptManager ID="ScriptManager2" runat="server" />--%>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
        <%--<asp:Button runat="server" Text="Close" ID="CloseButton"     OnClick="CloseButton_Click1"/>--%>
         <div class="">
            <form class="form-horizontal" method="post" action="#">
               
                 <div class="page">
                    <div class="col-xs-6">
                        <div class="col-xs-3">
                           
                             <asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label>
                            <br />
                            <br />
                            <br />
                              <asp:Label ID="Label4" runat="server" Text="Middle Name"></asp:Label>
                             <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" Text="Last Name"></asp:Label>
                             <br />
                             <br />
                            <br />
                             <asp:Label ID="Label8" runat="server" Text="Birthday"></asp:Label>
                             <br />
                             <br />
                            <asp:Label ID="Label6" runat="server" Text="Tel Number"></asp:Label>
                            <br />
                             <br />
                             <asp:Label ID="Label46" runat="server" Text="Mobile Number"></asp:Label>
                              <br />
                             <br />
                            <br />

                            <asp:Label ID="Label13" runat="server" Text="Email"></asp:Label>
                        </div>

                        <div class="col-xs-3">
                              <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtFirstname" Enabled="True" runat="server"></telerik:RadTextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                          <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtMiddlename" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                             <br />
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtLastname" Enabled="True" runat="server"></telerik:RadTextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                             <br />
                            <br />
                            <telerik:RadDatePicker ID="dpBirthDate" MinDate="1950/1/1" ZIndex="11000"  runat="server" Width="230px"></telerik:RadDatePicker>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtTel" Enabled="True" runat="server"></telerik:RadTextBox>
                          <br />
                            <br />
                              <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtMobile" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtEmail" Enabled="True" runat="server"></telerik:RadTextBox>
                         </div>
                    </div>

                    <div class="col-xs-6">
                        <div class="col-xs-3">
                            <asp:Label ID="Label7" runat="server" Text="BCO"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label17" runat="server" Text="Assigned To"></asp:Label>
                            <br />
                            <br />
                            <br />
                             <br />
                             <asp:Label ID="Label18" runat="server" Text="Location"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Department"></asp:Label>
                            <br />
                            <br />
                            <br />
                              <asp:Label ID="Label9" runat="server" Text="Position"></asp:Label>
                             <br />
                            <br />
                             <asp:Label ID="Label10" runat="server" Text="Driver License Number"></asp:Label>
                             <br />
                             <br />
                            <asp:Label ID="Label11" runat="server" Text="Driver License Expiration"></asp:Label>
                           
                        </div>

                        <div class="col-xs-3">
                              <telerik:RadComboBox ID="rcbBranchCorpOffice" runat="server" Width="230px" Height="200px" AutoPostBack="true" OnSelectedIndexChanged="rcbBranchCorpOffice_SelectedIndexChanged"></telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rcbBranchCorpOffice"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                             <br />
                            <br />
                               <telerik:RadComboBox ID="rcbRevenueUnitType" runat="server" Width="230px" Height="200px" AutoPostBack="true" OnTextChanged="rcbRevenueUnitType_TextChanged" OnSelectedIndexChanged="rcbRevenueUnitType_SelectedIndexChanged"></telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rcbRevenueUnitType"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                             <br />
                            <br />
                            <telerik:RadComboBox ID="rcbRevenueUnitName" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rcbRevenueUnitName"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                           
                            <br />
                            <br />
                            <telerik:RadComboBox ID="rcbDepartment" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <br />
                            <br />
                            <telerik:RadComboBox ID="rcbPosition" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <br />
                            <br />
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtLicense" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br />
                            <br />
                           <telerik:RadDatePicker ID="dpLicense" Width="230px" MinDate="2017/1/1"  ZIndex="1100000" AutoPostBack ="false" runat="server"></telerik:RadDatePicker>
                         </div>

                </div>
                    </div>

              
                       
                <div id="footer">
                    <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClicked=""></telerik:RadButton>
                    <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click"></telerik:RadButton>
                </div>
            </form>


        </div>
        
       <%-- <script type="text/javascript" src="../../../js/bootstrap.js"></script>--%>

        <br />
    </form>
</body>
</html>
