﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Reports
{
    public class Bundle
    {
        public static DataSet GetBundle(string conSTR , DateTime date , string bundlenumber , string  destination)
        {
            using (SqlConnection con = new SqlConnection(conSTR ))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_Reports_Bundle", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@date", SqlDbType.DateTime).Value = date;
                da.SelectCommand.Parameters.Add("@bundleNumber", SqlDbType.VarChar).Value = bundlenumber;
                da.SelectCommand.Parameters.Add("@destination", SqlDbType.VarChar).Value = destination;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
    }
}
