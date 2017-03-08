using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class portal_Operation_Manifest_DailyTripReport : System.Web.UI.Page
{
    public static int checker = 0;
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public DataTable getDailyTripData()
    {
        DataSet data = BLL.Report.DailyTripReport.GetDailyTrip(getConstr.ConStrCMS);
        DataTable dt = new DataTable();
        dt = data.Tables[0];

        if(checker == 0)
        {
            DataView view = new DataView(dt);
            //BCO
            DataTable table = view.ToTable(true, "BranchCorpOfficeName");
            dropDown_DailyTrip_BCO.Items.Clear();
            dropDown_DailyTrip_BCO.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["BranchCorpOfficeName"].ToString() != null)
                {
                    dropDown_DailyTrip_BCO.Items.Add(x["BranchCorpOfficeName"].ToString());
                }
            }
            dropDown_DailyTrip_BCO.SelectedIndex = 0;
            checker = 1;

            //AREA
            table = view.ToTable(true, "Area");
            dropDown_DailyTrip_Area.Items.Clear();
            dropDown_DailyTrip_Area.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["Area"].ToString() != null)
                {
                    dropDown_DailyTrip_Area.Items.Add(x["Area"].ToString());
                }
            }
            dropDown_DailyTrip_Area.SelectedIndex = 0;

            //PAYMENT MODE
            table = view.ToTable(true, "PaymentModeName");
            dropDown_DailyTrip_PaymentMode.Items.Clear();
            dropDown_DailyTrip_PaymentMode.Items.Add("All");
            foreach (DataRow x in table.Rows)
            {
                if (x["PaymentModeName"].ToString() != null)
                {
                    dropDown_DailyTrip_PaymentMode.Items.Add(x["PaymentModeName"].ToString());
                }
            }
            dropDown_DailyTrip_PaymentMode.SelectedIndex = 0;
        }

        return dt;
    }


    protected void grid_DailyTripReport_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        grid_DailyTripReport.DataSource = getDailyTripData();
    }
}