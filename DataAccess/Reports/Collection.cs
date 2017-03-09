using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Reports
{
    public class Collection
    {
        public static DataSet GetCollection(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_Reports_Collection", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
    }
}
