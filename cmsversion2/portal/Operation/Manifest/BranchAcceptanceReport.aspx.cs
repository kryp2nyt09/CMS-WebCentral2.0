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
        if (!IsPostBack)
        {

            Batch.DataSource = getBatch();
            Batch.DataTextField = "BatchName";
            Batch.DataValueField = "BatchName";
            Batch.DataBind();

            BCO.DataSource = getBranchCorpOffice();
            BCO.DataTextField = "BranchCorpOfficeName";
            BCO.DataValueField = "BranchCorpOfficeName";
            BCO.DataBind();

            Area.DataSource = getArea();
            Area.DataTextField = "RevenueUnitName";
            Area.DataValueField = "RevenueUnitName";
            Area.DataBind();
        }
    }

    public DataTable getBranchCorpOffice()
    {
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getArea()
    {
        DataSet data = BLL.Area.GetArea(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getBatch()
    {
        DataSet data = BLL.Batch.GetBatchByBatchCode(getConstr.ConStrCMS , "branchacceptance");
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getBranchAcceptance()
    {
        string DateStr = "";
        string AreaStr = "All";
        string BatchStr = "All";
        string BCOStr = "All";
        try
        {
            BCOStr = BCO.SelectedItem.Text.ToString();
            AreaStr = Area.SelectedItem.Text.ToString();
            BatchStr = Batch.SelectedItem.Text.ToString();
            DateStr = Date.SelectedDate.Value.ToString("dd MMM yyyy");
        }
        catch (Exception)
        {
            DateStr = "";
        }
        DataSet data = BLL.Report.BranchAcceptanceReport.GetBranchAcceptance(getConstr.ConStrCMS, DateStr ,AreaStr , BatchStr , BCOStr );
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_BranchAcceptance_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_BranchAcceptance.DataSource = getBranchAcceptance();
    }


    protected void Search_Click(object sender, EventArgs e)
    {
        grid_BranchAcceptance.DataSource = getBranchAcceptance();
        grid_BranchAcceptance.Rebind();
    }
}