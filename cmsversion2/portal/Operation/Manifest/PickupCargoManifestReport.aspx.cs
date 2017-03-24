using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.Data;
using Telerik.Web.UI;
using Telerik.Web.UI.ExportInfrastructure;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class portal_Operation_Manifest_PickupCargoManifestReport : System.Web.UI.Page
{

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Area.DataSource = getArea();
            Area.DataTextField = "RevenueUnitName";
            Area.DataValueField = "RevenueUnitName";
            Area.DataBind();

            setAWB();

            //Date.SelectedDate = DateTime.Now;
        }
    }

    public void setAWB()
    {
        AWB.DataSource = getPickUpCargoData();
        AWB.DataTextField = "AWB #";
        AWB.DataValueField = "AWB #";
        AWB.DataBind();
    }

    public DataTable getArea()
    {
        DataSet data = BLL.Area.GetArea(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getPickUpCargoData()
    {
        string AreaStr = "All";
        string AWBStr = "";
        string DateStr = "";
        try
        {
            AreaStr = Area.SelectedItem.Text.ToString();
            AWBStr = AWB.Text.ToString();
            DateStr = Date.SelectedDate.Value.ToString("dd MMM yyyy");
        }
        catch (Exception) {
            DateStr = "";           
        }
        DataSet data = BLL.Report.PickupCargoManifestReport.GetPickupCargoManifest(getConstr.ConStrCMS , AreaStr, AWBStr , DateStr);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }
    

    protected void gridPickupCargo_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        gridPickupCargo.DataSource = getPickUpCargoData();

    }

    protected void Search_Click(object sender, EventArgs e)
    {
        //Console.WriteLine("DATE === > " + Date.SelectedDate);
        gridPickupCargo.DataSource = getPickUpCargoData();
        gridPickupCargo.Rebind();
        setAWB();
    }

    protected void gridPickupCargo_PreRender(object sender, EventArgs e)
    {
        gridPickupCargo.MasterTableView.GetColumn("CREATEDDATE").Visible = false;
        gridPickupCargo.Rebind();
    }

    protected void AWB_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
    {
        //e.Item.Text = string.Concat(e.Item.Text.ToLower().Split(' ')[0]);
    }

    protected void Area_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
    {
       // e.Item.Text = string.Concat(e.Item.Text.ToString()[0]);
    }
}