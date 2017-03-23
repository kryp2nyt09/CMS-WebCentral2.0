using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Sales_BCOSalesSummary : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bco.DataSource = getBCO();
            bco.DataTextField = "BranchCorpOfficeCode";
            bco.DataValueField = "BranchCorpOfficeId";
            bco.DataBind();
        }

    }

    public DataTable getBCO()
    {
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    public DataTable getBCOSalesSummary()
    {
        string bcostr = "";
        try
        {
            bcostr = bco.SelectedItem.Text.ToString();
        }
        catch (Exception)
        {
            bcostr = "All";
        }
        DataSet data = BLL.Report.BCOSalesSummaryReport.GetBCOSalesSummary(getConstr.ConStrCMS , bcostr);
        DataTable dt = new DataTable();
        dt = data.Tables[0];
        return dt;
    }

    protected void grid_BCOSalesSummary_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_BCOSalesSummary.DataSource = getBCOSalesSummary();
    }

    protected void bco_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        grid_BCOSalesSummary.DataSource  = getBCOSalesSummary();
        grid_BCOSalesSummary.Rebind();
    }
}
