using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BAL = BusinessLogic;

namespace CMS2.API.Controllers
{
    public class CmsApiController : ApiController
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Shipment"].ConnectionString;
        
        // GET: api/CmsApi/5
        public List<BusinessLogic.Invoice> GetInvoices(DateTime start, DateTime end)
        {
             return BAL.Invoice.GetInvoices(start, end, connectionString);
        }

    }
}
