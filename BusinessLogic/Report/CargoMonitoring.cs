using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class CargoMonitoring
    {
        public static DataSet GetCargoMonitoringDelivered(string conSTR, DateTime? date1, DateTime? date2)
        {
            return DAL.Reports.CargoMonitoring.GetCargoMonitoringDelivered(conSTR, date1, date2);
        }

        public static DataSet GetCargoMonitoringHold(string conSTR, DateTime? date1, DateTime? date2)
        {
            return DAL.Reports.CargoMonitoring.GetCargoMonitoringHold(conSTR, date1, date2);
        }
    }
}
