using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class AwbIssuanceExport : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    public DataTable GetAWBIssuance()
    {
        //DataTable data = new DataTable();
        DataSet dt = BLL.AwbIssuance.GetAwbIssuance(getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = dt.Tables[0];
        return convertdata;
    }



    protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        RadGrid2.DataSource = GetAWBIssuance();
    }
}