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
    public class Representatives
    {
        public static DataSet GetRepresentatives(string conSTR)
        {
            return DAL.Representatives.GetRepresentatives(conSTR);
        }


        public static DataSet GetRepresentativesByCompanyId(string conSTR, Guid CompanyId)
        {
            return DAL.Representatives.GetRepresentativesByCompandId(conSTR, CompanyId);
        }
        //public static void UpdateClientProfile(Guid ClientID, int Flag, string conStr)
        //{
        //    DAL.Client.UpdateClientProfile(ClientID, Flag, conStr);
        //}

    }
}
