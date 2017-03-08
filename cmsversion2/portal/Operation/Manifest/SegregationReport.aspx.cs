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
    public static int checker = 0;

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public DataTable getSegregationData()
    {
        DataSet data = BLL.Report.SegregationReport.GetSegregation(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];

        if (checker == 0)
        {
            #region DROPDOWN FILTER

            DataView view = new DataView(dt);
            //BCO
            DataTable table = view.ToTable(true, "BranchCorpOfficeName");
            dropDown_Segregation_BCO.Items.Clear();
            dropDown_Segregation_BCO.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["BranchCorpOfficeName"].ToString() != null)
                {
                    dropDown_Segregation_BCO.Items.Add(x["BranchCorpOfficeName"].ToString());
                }
            }
            dropDown_Segregation_BCO.SelectedIndex = 0;
            checker = 1;

            //DRIVER
            table = view.ToTable(true, "Driver");
            dropDown_Segregation_Driver.Items.Clear();
            dropDown_Segregation_Driver.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["Driver"].ToString() != null)
                {
                    dropDown_Segregation_Driver.Items.Add(x["Driver"].ToString());
                }
            }
            dropDown_Segregation_Driver.SelectedIndex = 0;

            //PLATE NO
            table = view.ToTable(true, "PlateNo");
            dropDown_Segregation_PlateNo.Items.Clear();
            dropDown_Segregation_PlateNo.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["PlateNo"].ToString() != null)
                {
                    dropDown_Segregation_PlateNo.Items.Add(x["PlateNo"].ToString());
                }
            }
            dropDown_Segregation_PlateNo.SelectedIndex = 0;


            //BATCH
            table = view.ToTable(true, "Batch");
            dropDown_Segregation_Batch.Items.Clear();
            dropDown_Segregation_Batch.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["Batch"].ToString() != null)
                {
                    dropDown_Segregation_Batch.Items.Add(x["Batch"].ToString());
                }
            }
            dropDown_Segregation_Batch.SelectedIndex = 0;
            #endregion
        }

        return dt;
    }

    protected void grid_Segregation_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Segregation.DataSource = getSegregationData();
    }

    protected void grid_Segregation_PreRender(object sender, EventArgs e)
    {
        grid_Segregation.MasterTableView.GetColumn("AirwayBillNo").Visible = false;
        grid_Segregation.MasterTableView.GetColumn("Qty").Visible = false;
        grid_Segregation.MasterTableView.GetColumn("Area").Visible = false;
        grid_Segregation.Rebind();
    }
}