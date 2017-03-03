using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Reports
{
    public class Shipment
    {
        public static DataSet GetShipment(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_Shipment", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //da.SelectCommand.Parameters.Add("@ShipmentBasicFeeID", SqlDbType.UniqueIdentifier).Value = ID;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
    }
}
