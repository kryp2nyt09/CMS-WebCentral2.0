using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;


public partial class _AddCompany : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        string urlWithSessionID = Response.ApplyAppPathModifier(Request.Url.PathAndQuery);
        RadTab tab = RadTabStrip1.FindTabByUrl(urlWithSessionID);
        if (tab != null)
        {
            tab.SelectParents();
            tab.PageView.Selected = true;
        }


        if (!IsPostBack)
        {
            
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Add Company";
    }

    


}