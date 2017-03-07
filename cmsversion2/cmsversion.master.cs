using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tools = utilities;
public partial class cmsversion : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserName = Request.QueryString["PortalID"];
        if (UserName != null)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(UserName);
            lblUserName.Text = Tools.Encryption.DecryptPassword(bytes);
            Session["UsernameSession"] = lblUserName.Text;
        }
    }
    public  string GetUsername
    {
        get
        {
            return lblUserName.Text;
        }
        set
        {
            string UserName = Request.QueryString["PortalID"];
            if (UserName != null)
            {
               lblUserName.Text = Tools.Encryption.DecryptPass(UserName);
                //lblUserName.Text = "Guest";
            }
            else
            {
                lblUserName.Text = "Guest";
            }
    
        }
    }





}
