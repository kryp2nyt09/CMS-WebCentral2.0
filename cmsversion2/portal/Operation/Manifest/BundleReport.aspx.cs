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
    public static int bcoFlag = 0;
    public static int checkerGrid = 0;
    public static int checkerFilter = 0;

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (checkerGrid == 0)
        {
            checkerGrid = 1;
            grid_Bundle.DataSource = getBundle();
            dateTime_Bundle_Date.SelectedDate = DateTime.Today;
        }
        
    }

    public DataTable getBundle()
    {
       
        DataSet data = BLL.Report.BundeReport.GetBundle(getConstr.ConStrCMS );
        DataTable dt = new DataTable();
        dt = data.Tables[0];

        if (checkerFilter == 0)
        {
            checkerFilter = 1;

            DataView view = new DataView(dt);
            //SACK NO
            DataTable table = view.ToTable(true, "SackNo");
            dropDown_Bundle_SackNo.Items.Clear();
            dropDown_Bundle_SackNo.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["SackNo"].ToString() != null)
                {
                    dropDown_Bundle_SackNo.Items.Add(x["SackNo"].ToString());
                }
            }
            dropDown_Bundle_SackNo.SelectedIndex = 0;

            //DESTINATION
            table = view.ToTable(true, "Destination");
            dropDown_Bundle_Destination.Items.Clear();
            dropDown_Bundle_Destination.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["Destination"].ToString() != null)
                {
                    dropDown_Bundle_Destination.Items.Add(x["Destination"].ToString());
                }
            }
            dropDown_Bundle_Destination.SelectedIndex = 0;

            //BCO
            table = view.ToTable(true, "BCO");
            dropDown_Bundle_BCO_BSO.Items.Clear();
            dropDown_Bundle_BCO_BSO.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["BCO"].ToString() != null)
                {
                    dropDown_Bundle_BCO_BSO.Items.Add(x["BCO"].ToString());
                }
            }
            dropDown_Bundle_BCO_BSO.SelectedIndex = 0;
        }

        return dt;
    }

    public DataTable getBranchCorpOffice()
    {
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getBranchSatelliteOffice()
    {
        DataSet data = BLL.Branch.GetBranch(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void btn_Bundle_Search_Click(object sender, EventArgs e)
    {
        string strDate = dateTime_Bundle_Date.SelectedDate.Value.ToString("MM/dd/yyyy");
        string strBSOBCO = dropDown_Bundle_BCO_BSO.SelectedText.ToString();
        string strSackNo = dropDown_Bundle_SackNo.SelectedText.ToString();
        string strDestination = dropDown_Bundle_Destination.SelectedText.ToString();

        if (strBSOBCO != "All")
        {
            grid_Bundle.DataSource = getBundle();
            grid_Bundle.EnableLinqExpressions = false;
            if (bcoFlag == 1)
            {
                grid_Bundle.MasterTableView.FilterExpression = String.Format("CreatedDate = '{0}' AND BCO = '{1}'", strDate, strBSOBCO);
            }
            else
            {
                grid_Bundle.MasterTableView.FilterExpression = String.Format("CreatedDate = '{0}' AND BSO = '{1}'", strDate, strBSOBCO);
            }
        }
        else if (strSackNo != "All")
        {
            grid_Bundle.MasterTableView.FilterExpression = String.Format("CreatedDate = '{0}' AND SackNo = '{1}'", strDate, strSackNo);
        }
    }

    protected void dropDown_Bundle_Branch_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
    {
        dropDown_Bundle_BCO_BSO.Enabled = true;
        DataSet data = BLL.Report.BundeReport.GetBundle(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        DataView view = new DataView(dt);

        if (dropDown_Bundle_Branch.SelectedText == "Branch Corporate Office")
        {
            bcoFlag = 1;
            //BCO
            RadLabel4.Text = "BCO";
            DataTable table = view.ToTable(true, "BCO");
            dropDown_Bundle_BCO_BSO.Items.Clear();
            dropDown_Bundle_BCO_BSO.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["BCO"].ToString() != null)
                {
                    dropDown_Bundle_BCO_BSO.Items.Add(x["BCO"].ToString());
                }
            }
            dropDown_Bundle_BCO_BSO.SelectedIndex = 0;
        }
        else
        {
            bcoFlag = 0;
            //BSO
            RadLabel4.Text = "BSO";
            DataTable table = view.ToTable(true, "BSO");
            dropDown_Bundle_BCO_BSO.Items.Clear();
            dropDown_Bundle_BCO_BSO.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["BSO"].ToString() != null)
                {
                    dropDown_Bundle_BCO_BSO.Items.Add(x["BSO"].ToString());
                }
            }
            dropDown_Bundle_BCO_BSO.SelectedIndex = 0;
        }
    }

    protected void grid_Bundle_PreRender(object sender, EventArgs e)
    {
        grid_Bundle.MasterTableView.GetColumn("CreatedDate").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("SackNo").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("Origin").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("Destination").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("BCO").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("BSO").Visible = false;
        grid_Bundle.Rebind();
    }
}