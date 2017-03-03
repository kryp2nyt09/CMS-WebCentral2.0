using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class portal_Operation_Manifest_PickupCargoManifestReport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        RadDatePicker1.SelectedDate = DateTime.Today;
        RadDropDownList1.DataSource = getBranchCorpOffice();
        RadDropDownList1.DataValueField = "BranchCorpOfficeName";
        RadDropDownList1.DataTextField = "BranchCorpOfficeId";
        RadDropDownList1.DataBind();

        RadDropDownList2.DataSource = getArea();
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

    public DataTable getPickUpCargoData()
    {
        DataSet data = BLL.Report.Shipment.GetShipment(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = getPickUpCargoData();
    }
}