using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class PickupCargoManifestReport
    {
        public static DataSet GetPickupCargoManifest(string conSTR)
        {
            return DAL.Reports.PickupCargoManifest.GetPickupCargoManifest(conSTR);
        }
    }
}
