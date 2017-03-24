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

            Destination.DataSource = getCity();
            Destination.DataTextField = "CityName";
            Destination.DataValueField = "CityName";
            Destination.DataBind();
        }
    }
    public DataTable getCity()
    {
        DataSet data = BLL.City.GetCity(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getBundle()
    {
        //DateTime date =
        string bundlenumber = "All";
        string destination = "All";
        string date = "";

        try
        {
            bundlenumber = BundleNumber.SelectedItem.Text.ToString();
            destination = Destination.SelectedItem.Text.ToString();
            date =  Date.SelectedDate.Value.ToString("dd MMM yyyy");
        }
        catch (Exception)
        {
            date = "";
        }

        DataSet data = BLL.Report.BundleReport.GetBundle(getConstr.ConStrCMS,date , bundlenumber , destination);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_Bundle_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Bundle.DataSource = getBundle();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        grid_Bundle.DataSource = getBundle();
        grid_Bundle.Rebind();
    }

    protected void grid_Bundle_PreRender(object sender, EventArgs e)
    {
        //grid_Bundle.MasterTableView.GetColumn("SACKNO").Visible = false;
        //grid_Bundle.MasterTableView.GetColumn("CREATEDDATE").Visible = false;
        //grid_Bundle.Rebind();
    }
}