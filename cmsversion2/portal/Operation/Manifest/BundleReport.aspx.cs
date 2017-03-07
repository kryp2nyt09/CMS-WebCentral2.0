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
    public int bcoFlag;

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        dateTime_Bundle_Date.SelectedDate = DateTime.Today;

        dropDown_Bundle_BCO_BSO.DataSource = getBranchCorpOffice();
        dropDown_Bundle_BCO_BSO.DataTextField = "BranchCorpOfficeName";
        dropDown_Bundle_BCO_BSO.DataValueField = "BranchCorpOfficeId";
        dropDown_Bundle_BCO_BSO.DataBind();
        this.bcoFlag = 1;
    }

    public DataTable getBundle()
    {
        Guid ID = Guid.Parse(dropDown_Bundle_BCO_BSO.SelectedValue);    
        string strSackNo = dropDown_Bundle_SackNo.SelectedText.ToString();
        string strDestination = dropDown_Bundle_Destination.SelectedText.ToString();

        DataSet data = BLL.Report.BundeReport.GetBundle(getConstr.ConStrCMS , ID , strSackNo , strDestination ,this.bcoFlag);
        DataTable dt = new DataTable();
        dt = data.Tables[0];

        DataView view = new DataView(dt);
        //AREA
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

    protected void grid_Bundle_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_Bundle.DataSource = getBundle();
       
    }

    protected void btn_Bundle_Search_Click(object sender, EventArgs e)
    {

    }

    protected void dropDown_Bundle_Branch_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
    {
        if (dropDown_Bundle_Branch.SelectedText == "Branch Corporate Office")
        {
            dropDown_Bundle_BCO_BSO.DataSource = getBranchCorpOffice();
            dropDown_Bundle_BCO_BSO.DataTextField = "BranchCorpOfficeName";
            dropDown_Bundle_BCO_BSO.DataValueField = "BranchCorpOfficeId";
            dropDown_Bundle_BCO_BSO.DataBind();
            this.bcoFlag = 1;
        }
        else
        {
            dropDown_Bundle_BCO_BSO.DataSource = getBranchSatelliteOffice();
            dropDown_Bundle_BCO_BSO.DataTextField = "RevenueUnitName";
            dropDown_Bundle_BCO_BSO.DataValueField = "CityId";
            dropDown_Bundle_BCO_BSO.DataBind();
            this.bcoFlag = 0;
        }
    }

    protected void grid_Bundle_PreRender(object sender, EventArgs e)
    {
        grid_Bundle.MasterTableView.GetColumn("SackNo").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("Origin").Visible = false;
        grid_Bundle.MasterTableView.GetColumn("Destination").Visible = false;
        grid_Bundle.Rebind();
    }
}