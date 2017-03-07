using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class UnbundleReport
    {
        public static DataSet GetBundle(string conSTR)
        {
            return DAL.Reports.Unbundle.GetUnbundle(conSTR);
        }
    }
}