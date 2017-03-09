using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;
namespace BusinessLogic.Report
{
    public class BranchAcceptanceReport
    {
        public static DataSet GetBranchAcceptance(string conSTR)
        {
            return DAL.Reports.BranchAcceptance.GetBranchAcceptance(conSTR);
        }
    }
}
