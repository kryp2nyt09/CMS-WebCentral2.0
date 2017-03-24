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
        if (!IsPostBack)
        {
            SackNumber.DataSource = getUnbundle();
            SackNumber.DataTextField = "SACKNO";
            SackNumber.DataValueField = "SACKNO";
            SackNumber.DataBind();

            Origin.DataSource = getCity();
            Origin.DataTextField = "CityName";
            Origin.DataValueField = "CityName";
            Origin.DataBind();
        }
    }

    public DataTable getCity()
    {
        DataSet data = BLL.City.GetCity(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getUnbundle()
    {
        string DateStr = "";
        string SackNoStr = "All";
        string OriginStr = "All";
        try
        {
            DateStr = Date.SelectedDate.Value.ToString("dd MMM yyyy");
            SackNoStr = SackNumber.SelectedItem.Text.ToString();
            OriginStr = Origin.SelectedItem.Text.ToString();
        }
        catch (Exception)
        {
            DateStr = "";
        }
        DataSet data = BLL.Report.UnbundleReport.GetBundle(getConstr.ConStrCMS, DateStr , SackNoStr , OriginStr);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_Unbundle_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Unbundle.DataSource = getUnbundle();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        grid_Unbundle.DataSource = getUnbundle();
        grid_Unbundle.Rebind();
    }
}