using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_UnbundleReport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public DataTable getUnbundle()
    {
        DataSet data = BLL.Report.UnbundleReport.GetBundle(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        
        //dropDown_Bundle_SackNo.DataSource = dt;
        //dropDown_Bundle_SackNo.DataTextField = "SackNo";
        //dropDown_Bundle_SackNo.DataValueField = "SackNo";
        //dropDown_Bundle_SackNo.DataBind();

        //dropDown_Bundle_Destination.DataSource = dt;
        //dropDown_Bundle_Destination.DataTextField = "BranchCorpOfficeName";
        //dropDown_Bundle_Destination.DataValueField = "BranchCorpOfficeName";
        //dropDown_Bundle_Destination.DataBind();

        return dt;
    }

    protected void grid_Unbundle_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Unbundle.DataSource = getUnbundle();
    }
}