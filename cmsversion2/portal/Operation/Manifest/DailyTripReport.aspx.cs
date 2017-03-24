using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_DailyTripReport : System.Web.UI.Page
{
    public static int checker = 0;
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Area.DataSource = getCity();
            Area.DataTextField = "CityName";
            Area.DataValueField = "CityName";
            Area.DataBind();
        }
    }

    public DataTable getCity()
    {
        DataSet data = BLL.City.GetCity(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getDailyTripData()
    {
        string DateStr = "";
        string AreaStr = "All";
        try
        {
            AreaStr = Area.SelectedItem.Text.ToString();
            DateStr = Date.SelectedDate.Value.ToString("dd MMM yyyy");
        }
        catch(Exception) {
            DateStr = "";
        }
        DataSet data = BLL.Report.DailyTripReport.GetDailyTrip(getConstr.ConStrCMS , DateStr , AreaStr );
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }


    protected void grid_DailyTripReport_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_DailyTripReport.DataSource = getDailyTripData();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        grid_DailyTripReport.DataSource = getDailyTripData();
        grid_DailyTripReport.Rebind();
    }
}