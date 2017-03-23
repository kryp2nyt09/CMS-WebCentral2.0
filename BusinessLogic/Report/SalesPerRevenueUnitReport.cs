using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;
namespace BusinessLogic.Report
{
    public class SalesPerRevenueUnitReport
    {
        public static DataSet GetSalesPerRevenueUnit(string conSTR)
        {
            return DAL.Reports.SalesPerRevenueUnit.GetSalesPerRevenueUnit(conSTR);
        }
    }
}
