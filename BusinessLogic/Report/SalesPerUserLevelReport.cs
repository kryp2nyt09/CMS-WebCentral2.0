﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;
namespace BusinessLogic.Report
{
    public class SalesPerUserLevelReport
    {
        public static DataSet GetSalesPerUserLevel(string conSTR)
        {
            return DAL.Reports.SalesPerUserLevel.GetSalesPerUserLevel(conSTR);
        }
    }
}
