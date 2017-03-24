using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_SegregationReport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Driver.DataSource = getSegregationData();
            Driver.DataTextField = "Driver";
            Driver.DataValueField = "Driver";
            Driver.DataBind();

            Checker.DataSource = getSegregationData();
            Checker.DataTextField = "Checker";
            Checker.DataValueField = "Checker";
            Checker.DataBind();

            PlateNo.DataSource = getSegregationData();
            PlateNo.DataTextField = "PlateNo";
            PlateNo.DataValueField = "PlateNo";
            PlateNo.DataBind();

            BCO.DataSource = getBranchCorpOffice();
            BCO.DataTextField = "BranchCorpOfficeName";
            BCO.DataValueField = "BranchCorpOfficeName";
            BCO.DataBind();

        }
    }

    public DataTable getBranchCorpOffice() {

        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getSegregationData()
    {
        string DateStr = "";
        string DriverStr = "All";
        string CheckerStr = "All";
        string PlateNoStr = "All";
        string BCOStr = "All";
        try
        {
            DriverStr = Driver.SelectedItem.Text.ToString();
            CheckerStr = Checker.SelectedItem.Text.ToString();
            PlateNoStr = PlateNo.SelectedItem.Text.ToString();
            BCOStr = BCO.SelectedItem.Text.ToString();
            DateStr = Date.SelectedDate.Value.ToString("dd MMM yyyy");
        }
        catch (Exception)
        {
            DateStr = "";
        }
        DataSet data = BLL.Report.SegregationReport.GetSegregation(getConstr.ConStrCMS , DateStr , DriverStr, CheckerStr, PlateNoStr, BCOStr);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_Segregation_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Segregation.DataSource = getSegregationData();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        grid_Segregation.DataSource = getSegregationData();
        grid_Segregation.Rebind();
    }
}