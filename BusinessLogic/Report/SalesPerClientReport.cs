﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic.Report
{
    public class SalesPerClientReport
    {
        public static DataSet GetSalesPerClient(string conSTR)
        {
            return DAL.Reports.SalesPerClient.GetSalesPerClient(conSTR);
        }
    }
}
