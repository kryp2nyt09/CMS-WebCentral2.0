using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;
using System.IO;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;


public partial class index : System.Web.UI.Page
{

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        DataSet ds = new DataSet();
        ds = BLL.Users_Info.VerifyUser(login_username.Text, login_password.Text, getConstr.ConStrCMS);

        if (ds.Tables[0].Rows.Count > 0)
        {
            byte[] EncryptedUsername = Tools.Encryption.EncryptPassword(login_username.Text);

            Response.Redirect("~/Portal/ManageUsers.aspx?PortalID=" + Encoding.Unicode.GetString(EncryptedUsername));
            Session["UserNameSession"] = EncryptedUsername;

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid username or password!')", true);
        }

    }

}