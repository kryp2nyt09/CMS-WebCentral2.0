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
    public class Flight
    {

        public static DataSet GetFlightInformation(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_FlightInformation", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }

        public static DataSet GetFlightInformationById(Guid FlightInfoId, string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_FlightInformationById", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@FlightInformationId", SqlDbType.UniqueIdentifier).Value = FlightInfoId;

                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
        public static void DeleteFlightInfo(Guid FlightInfoId, string conStr)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_Delete_FlightInformationById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@FlightInformationId", SqlDbType.UniqueIdentifier).Value = FlightInfoId;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void InsertFlightInfo(
            String flightNo, DateTime ETD, DateTime ETA, Guid BCOid, Guid GatewayId, Guid OriginCity, Guid DestinationId, Guid CreatedBy,
           string conStr)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_Insert_FlightInformation", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.Add("@RevenueUnitId", SqlDbType.UniqueIdentifier).Value = RevenueUnitId;

                    cmd.Parameters.Add("@FlightNo", SqlDbType.VarChar).Value = flightNo;
                    cmd.Parameters.Add("@ETD", SqlDbType.DateTime).Value = ETD;
                    cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = ETA;
                    cmd.Parameters.Add("@BCOId", SqlDbType.UniqueIdentifier).Value = BCOid;
                    cmd.Parameters.Add("@GatewayId", SqlDbType.UniqueIdentifier).Value = GatewayId;
                    cmd.Parameters.Add("@OriginCity", SqlDbType.UniqueIdentifier).Value = OriginCity;
                    cmd.Parameters.Add("@DestinationId", SqlDbType.UniqueIdentifier).Value = DestinationId;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.UniqueIdentifier).Value = CreatedBy;


                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void UpdateFlightInfo(Guid FlightInfoId,
            String flightNo, DateTime ETD, DateTime ETA, Guid BCOid, Guid GatewayId, Guid OriginCity, Guid DestinationId, Guid CreatedBy,
           string conStr)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_FlightInformation", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@FlightId", SqlDbType.UniqueIdentifier).Value = FlightInfoId;
                    cmd.Parameters.Add("@FlightNo", SqlDbType.VarChar).Value = flightNo;
                    cmd.Parameters.Add("@ETD", SqlDbType.DateTime).Value = ETD;
                    cmd.Parameters.Add("@ETA", SqlDbType.DateTime).Value = ETA;
                    cmd.Parameters.Add("@BCOId", SqlDbType.UniqueIdentifier).Value = BCOid;
                    cmd.Parameters.Add("@GatewayId", SqlDbType.UniqueIdentifier).Value = GatewayId;
                    cmd.Parameters.Add("@OriginCity", SqlDbType.UniqueIdentifier).Value = OriginCity;
                    cmd.Parameters.Add("@DestinationId", SqlDbType.UniqueIdentifier).Value = DestinationId;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.UniqueIdentifier).Value = CreatedBy;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

    



    }
}
