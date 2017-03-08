using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class SegregationReport
    {
        public static DataSet GetSegregation(string conSTR)
        {
            return DAL.Reports.Segregation.GetSegregation(conSTR);
        }
    }
}
