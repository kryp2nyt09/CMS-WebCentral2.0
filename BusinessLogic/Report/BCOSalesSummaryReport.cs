using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;
namespace BusinessLogic.Report
{
    public class BCOSalesSummaryReport
    {
        public static DataSet GetBCOSalesSummary(string conSTR , string bco)
        {
            return DAL.Reports.BCOSalesSummary.GetBCOSalesSummary(conSTR , bco);
        }
    }
}
