using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class RepresentativesExportReport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public DataTable Sellers
    {
        get
        {
            DataTable data = Session["RepresentativeData"] as DataTable;

            if (data == null)
            {
                data = GetRepresentativeData();
                Session["RepresentativeData"] = data;
            }

            return data;
        }
    }

    public DataTable GetRepresentativeData()
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.Representatives.GetRepresentatives(getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }

    protected override void OnInit(EventArgs e)
    {

        
        base.OnInit(e);

        if (Request.QueryString["employeeid"] == null)
        {
            //DetailsView1.DefaultMode = DetailsViewMode.Insert;
        }
        else
        {
            //DetailsView1.DefaultMode = DetailsViewMode.Edit;
        }
        this.Page.Title = "Print Preview";
    }

    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "Insert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //logic to truncate long string to prevent SQL error
        for (int i = 1; i < 4; i++)
        {
            string val = e.NewValues[i - 1].ToString();
            int maxLength = i * 10;
            if (val.Length > maxLength) e.NewValues[i - 1] = val.Substring(0, maxLength);
        }
    }

    protected void rdPreview_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        rdPreview.DataSource = this.GetRepresentativeData();
    }

    protected void rdPreview_ItemCommand(object sender, GridCommandEventArgs e)
    {

    }
}