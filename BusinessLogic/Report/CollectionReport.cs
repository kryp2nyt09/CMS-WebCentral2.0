using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class CollectionReport
    {
        public static DataSet GetCollection(string conSTR)
        {
            return DAL.Reports.Collection.GetCollection(conSTR);
        }
    }
}
