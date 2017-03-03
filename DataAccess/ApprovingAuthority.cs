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
    public class ApprovingAuthority
    {

        public static DataSet GetApprovingAuthority(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_approvingauthority", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }

        public static DataSet GetApprovingAuthorityByID(string conSTR, Guid CompanyId)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                using (SqlCommand cmd = new SqlCommand("sp_view_approvingauthoritybycompanyid", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter("sp_view_approvingauthoritybycompanyid", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@companyid", SqlDbType.UniqueIdentifier).Value = CompanyId;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }

        public static DataSet GetApprovingAuthorityDetailsByID(string conSTR, Guid AuthorityId)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                using (SqlCommand cmd = new SqlCommand("sp_view_approvingauthoritydetailsbycompanyid", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter("sp_view_approvingauthoritydetailsbycompanyid", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@AuthorityId", SqlDbType.UniqueIdentifier).Value = AuthorityId;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }

        public static void UpdateApprovingAuthority(Guid ApprovingAuthorityId, int Flag, string conStr)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_delete_ApprovingAuthority", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ApprovingAuthorityId", SqlDbType.UniqueIdentifier).Value = ApprovingAuthorityId;
                    cmd.Parameters.Add("@Flag", SqlDbType.VarChar).Value = Flag;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public static void UpdateApprovingAuthorityDetails(Guid ApprovingAuthorityId, String FirstName, String Lastname, String title, String position, String department, String ContactNo, String Mobile, String Fax, String Email, Guid CompanyId,  Guid ModifiedBy,  int Flag, string conStr)

        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_update_approvingauthority", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ApprovingAuthorityId", SqlDbType.UniqueIdentifier).Value = ApprovingAuthorityId;
                    cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = FirstName;
                    cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = Lastname;
                    cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = title;
                    cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = position;
                    cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = department;
                    cmd.Parameters.Add("@ContactNo", SqlDbType.VarChar).Value = ContactNo;
                    cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = Mobile;
                    cmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = Fax;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                    cmd.Parameters.Add("@CompanyId", SqlDbType.UniqueIdentifier).Value = CompanyId;
                    cmd.Parameters.Add("@ModifiedBy", SqlDbType.UniqueIdentifier).Value = ModifiedBy;
                    cmd.Parameters.Add("@RecordStatus", SqlDbType.VarChar).Value = Flag;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void InsertApprovingAuthorityDetails( String FirstName, String Lastname, String title, String position, String department, String ContactNo, String Mobile, String Fax, String Email, Guid CompanyId, Guid ModifiedBy, int Flag, string conStr)

        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_Insert_approvingauthority", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.Add("@ApprovingAuthorityId", SqlDbType.UniqueIdentifier).Value = ApprovingAuthorityId;
                    cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = FirstName;
                    cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = Lastname;
                    cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = title;
                    cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = position;
                    cmd.Parameters.Add("@Department", SqlDbType.VarChar).Value = department;
                    cmd.Parameters.Add("@ContactNo", SqlDbType.VarChar).Value = ContactNo;
                    cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = Mobile;
                    cmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = Fax;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                    cmd.Parameters.Add("@CompanyId", SqlDbType.UniqueIdentifier).Value = CompanyId;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.UniqueIdentifier).Value = ModifiedBy;
                    cmd.Parameters.Add("@RecordStatus", SqlDbType.VarChar).Value = Flag;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}
