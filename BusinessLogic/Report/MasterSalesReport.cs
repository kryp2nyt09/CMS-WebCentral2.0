using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class MasterSalesReport
    {
        public static DataSet GetMasterSales(string conSTR)
        {
            return DAL.Reports.MasterSales.GetMasterSales(conSTR);
        }
    }
}
