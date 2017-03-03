using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class Shipment
    {
        public static DataSet GetShipment(string conSTR)
        {
            return DAL.Reports.Shipment.GetShipment(conSTR);
        }
    }
}
