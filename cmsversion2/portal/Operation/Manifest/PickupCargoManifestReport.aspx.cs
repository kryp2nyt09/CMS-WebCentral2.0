using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.Data;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class portal_Operation_Manifest_PickupCargoManifestReport : System.Web.UI.Page
{
    public static int checkerGrid = 0;
    public static int checkerFilter = 0;
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (checkerGrid == 0)
        {
            checkerGrid = 1;
            gridPickupCargo.DataSource = getPickUpCargoData();
            dateTimePickupCargo_Date.SelectedDate = DateTime.Today;
        }
        dropDownPickupCargo_BCO.DataSource = getBranchCorpOffice();
        dropDownPickupCargo_BCO.DataTextField = "BranchCorpOfficeName";
        dropDownPickupCargo_BCO.DataValueField = "BranchCorpOfficeId";
        dropDownPickupCargo_BCO.DataBind();

    }

    public DataTable getBranchCorpOffice()
    {
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getPickUpCargoData()
    {
        DataSet data = BLL.Report.PickupCargoManifestReport.GetPickupCargoManifest(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];

        if (checkerFilter == 0)
        {
            checkerFilter = 1;
            DataView view = new DataView(dt);
            //AREA
            DataTable table = view.ToTable(true, "Area");
            dropDownPickupCargo_Area.Items.Clear();
            dropDownPickupCargo_Area.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["Area"].ToString() != null)
                {
                    dropDownPickupCargo_Area.Items.Add(x["Area"].ToString());
                }
            }
            dropDownPickupCargo_Area.SelectedIndex = 0;
        }

        return dt;
    }
    protected void btnPickupCargo_Search_Click(object sender, EventArgs e)
    {
        string strArea = dropDownPickupCargo_Area.SelectedText.ToString();
        string strDate = dateTimePickupCargo_Date.SelectedDate.Value.ToString("MM/dd/yyyy");

        if (strArea != "All")
        {
            gridPickupCargo.DataSource = getPickUpCargoData();
            gridPickupCargo.EnableLinqExpressions = false;
            gridPickupCargo.MasterTableView.FilterExpression = String.Format("CreatedDate = '{0}' AND Area = '{1}'", strDate , strArea);

        }
        else
        {
            gridPickupCargo.DataSource = getPickUpCargoData();
            gridPickupCargo.EnableLinqExpressions = false;
            gridPickupCargo.MasterTableView.FilterExpression = String.Format("CreatedDate = '{0}'", strDate);
        }
    }
    
    protected void gridPickupCargo_PreRender(object sender, EventArgs e)
    {
        gridPickupCargo.MasterTableView.GetColumn("Area").Visible = false;
        gridPickupCargo.MasterTableView.GetColumn("CreatedDate").Visible = false;
        gridPickupCargo.Rebind();
    }
}