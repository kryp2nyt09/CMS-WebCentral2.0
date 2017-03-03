using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAccess
{
    public class Representatives
    {

        public static DataSet GetRepresentatives(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_representatives", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
        
        public static DataSet GetRepresentativesByCompandId(string conSTR, Guid CompanyId)
{
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                using (SqlCommand cmd = new SqlCommand("sp_view_representativesByCompany", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter("sp_view_representativesByCompany", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@companyid", SqlDbType.UniqueIdentifier).Value = CompanyId;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }

    }
}
