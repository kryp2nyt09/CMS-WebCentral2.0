<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCompany.aspx.cs" EnableEventValidation="false"  Inherits="_AddCompany" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
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
             shadows and rounded borders 
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



        /*STyles*/
#example .demo-container {
    width: 800px;
    padding: 125px 120px 0 20px;
    height: 500px;
}
 
.demo-container .outerMultiPage {
    height: 400px;
    width: 800px;
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
        
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
        <%--<asp:Button runat="server" Text="Close" ID="CloseButton"     OnClick="CloseButton_Click1"/>--%>
        <div class="demo-container no-bg">
            <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
            <Tabs>
                <telerik:RadTab Text="Company Information"></telerik:RadTab>
                <telerik:RadTab Text="Contact Information"></telerik:RadTab>
                <telerik:RadTab Text="Account Information 1"></telerik:RadTab>
                <telerik:RadTab Text="Account Information 2"></telerik:RadTab>
                <telerik:RadTab Text="Billing Information"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1" ContentUrl="CompanyInformation.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView2" ContentUrl="ContactInformation.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView3" ContentUrl="AccountInformation.aspx"></telerik:RadPageView>
             <telerik:RadPageView runat="server" ID="RadPageView4" ContentUrl="AccountInformation2.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView5" ContentUrl="BillingInformation.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>

            <div style="float:right">
            <telerik:RadButton ID="btnSave" runat="server" Text="Save"></telerik:RadButton>
                <telerik:RadButton ID="RadButton1" runat="server" Text="Cancel"></telerik:RadButton>
       </div>

        </div>
        
        <script type="text/javascript" src="../../../js/bootstrap.js"></script>

        <br />
    </form>
</body>
</html>
