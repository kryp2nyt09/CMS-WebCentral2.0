using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic
{
    public class Flight
    {
        public static DataSet GetFlightInformation(string conSTR)
        {
           return DAL.Flight.GetFlightInformation(conSTR);
        }

        public static void InsertFlightInfo(
            string flightNo, DateTime ETD, DateTime ETA, Guid GatewayId, Guid OriginCity, Guid DestinationId, Guid CreatedBy,
           string conStr)
        {
            DAL.Flight.InsertFlightInfo(flightNo, ETD, ETA, GatewayId, OriginCity, DestinationId, CreatedBy,
               conStr);
        }

        public static void UpdateFlightInfo(Guid FlightInfoId,
            String flightNo, DateTime ETD, DateTime ETA, Guid GatewayId, Guid OriginCity, Guid DestinationId, Guid CreatedBy,
           string conStr)
        {
            DAL.Flight.UpdateFlightInfo(FlightInfoId, flightNo, ETD, ETA, GatewayId, OriginCity, DestinationId, CreatedBy,
               conStr);
        }
    }
}
