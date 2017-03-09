using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_BranchAcceptanceReport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public DataTable getBranchAcceptance()
    {
        DataSet data = BLL.Report.BranchAcceptanceReport.GetBranchAcceptance(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_BranchAcceptance_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_BranchAcceptance.DataSource = getBranchAcceptance();
    }
}