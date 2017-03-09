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
        Console.WriteLine("ROW COUNT == > " + dt.Rows.Count);
        return dt;
    }
    

    protected void gridPickupCargo_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        gridPickupCargo.DataSource = getPickUpCargoData();
    }

    protected void gridPickupCargo_InfrastructureExporting(object sender, GridInfrastructureExportingEventArgs e)
    {
        //ExportStructure exportStructure = e.ExportStructure;

        //Telerik.Web.UI.ExportInfrastructure.Table table = exportStructure.Tables[0]; // new Telerik.Web.UI.ExportInfrastructure.Table("Table1");
        //table.InsertImage(new Range("A1", "B2"), "~/images/logo1.png");

        //table.ShiftRowsDown(1, 5);
    }
}