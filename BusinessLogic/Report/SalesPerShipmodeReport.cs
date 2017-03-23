using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class SalesPerShipmodeReport
    {
        public static DataSet GetSalesPerShipMode(string conSTR)
        {
            return DAL.Reports.SalesPerShipmode.GetSalesPerShipMode(conSTR);
        }
    }
}
