using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using DAL = DataAccess;


namespace BusinessLogic
{
    public class ApprovingAuthority
    {
        public static DataSet GetApprovingAuthority(string conSTR)
        {
            return DAL.ApprovingAuthority.GetApprovingAuthority(conSTR);
        }


        public static DataSet GetApprovingAuthorityById(string conSTR, Guid CompanyId)
        {
            return DAL.ApprovingAuthority.GetApprovingAuthorityByID(conSTR, CompanyId);
        }


        public static DataSet GetApprovingAuthorityDetailsById(string conSTR, Guid AuthorityID)
        {
            return DAL.ApprovingAuthority.GetApprovingAuthorityDetailsByID(conSTR, AuthorityID);
        }
        public static void UpdateApprovingAuthority(Guid ClientID, int Flag, string conStr)
        {
            DAL.ApprovingAuthority.UpdateApprovingAuthority(ClientID, Flag, conStr);
        }
        public static void UpdateApprovingAuthorityDetails(Guid ApprovingAuthorityId, String FirstName, String Lastname, String title, String position, String department, String ContactNo, String Mobile, String Fax, String Email, Guid CompanyId, Guid ModifiedBy, int Flag, string conStr)
        {
            DAL.ApprovingAuthority.UpdateApprovingAuthorityDetails(ApprovingAuthorityId, FirstName, Lastname, title, position, department, ContactNo, Mobile, Fax, Email, CompanyId, ModifiedBy, Flag, conStr);
        }

        public static void  InsertApprovingAuthorityDetails(String FirstName, String Lastname, String title, String position, String department, String ContactNo, String Mobile, String Fax, String Email, Guid CompanyId, Guid ModifiedBy, int Flag, string conStr)
        {
            DAL.ApprovingAuthority.InsertApprovingAuthorityDetails(FirstName, Lastname, title, position, department, ContactNo, Mobile, Fax, Email, CompanyId, ModifiedBy, Flag, conStr);
        }


    }
}
