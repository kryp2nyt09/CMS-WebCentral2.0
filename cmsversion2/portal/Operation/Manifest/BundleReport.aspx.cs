using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_BundleReport : System.Web.UI.Page
{

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BundleNumber.DataSource = getBundle();
            BundleNumber.DataTextField = "SackNo";
            BundleNumber.DataValueField = "SackNo";
            BundleNumber.DataBind();

            Destination.DataSource = getBundle();
            Destination.DataTextField = "Destination";
            Destination.DataValueField = "Destination";
            Destination.DataBind();
        }
    }

    public DataTable getBundle()
    {
        //DateTime date =
        string bundlenumber = "All";
        string destination = "All";

        DataSet data = BLL.Report.BundleReport.GetBundle(getConstr.ConStrCMS, DateTime.Now, bundlenumber , destination);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_Bundle_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Bundle.DataSource = getBundle();
    }
}