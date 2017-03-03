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
    public class Company
    {
        public static DataSet GetCompanies(string conSTR)
        {
            return DAL.Company.GetCompanies(conSTR);
        }

        public static void UpdateClientProfile(Guid ClientID, int Flag, string conStr)
        {
            DAL.Client.UpdateClientProfile(ClientID, Flag, conStr);
        }

    }
}
