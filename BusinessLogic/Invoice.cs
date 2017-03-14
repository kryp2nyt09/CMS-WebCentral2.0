using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;

namespace BusinessLogic
{    
    public class Invoice
    {
        public string AcceptedArea { get; set; }
        public string AcceptedBy { get; set; }
        public decimal ActualGrossWeight { get; set; }
        public string AirwayBillNo { get; set; }
        public decimal AwbFee { get; set; }
        public string Branch { get; set; }
        public decimal ChargeableWeight { get; set; }
        public string Consignee { get; set; }
        public decimal CratingFee { get; set; }
        public decimal DangerousFee { get; set; }
        public DateTime DateAccepted { get; set; }
        public decimal  DeclaredValue { get; set; }
        public decimal DeliveryFee { get; set; }
        public string  DestinationArea { get; set; }
        public decimal Discount { get; set; }
        public decimal FreightCollectCharge { get; set; }
        public decimal FuelSurcharge { get; set; }
        public string HasAwbFee { get; set; }
        public string HasFreightCollectCharge { get; set; }
        public string HasNonVatInsurance { get; set; }
        public string HasNonVatWeightCharge { get; set; }
        public string HasPerishableGoods { get; set; }
        public decimal Insurance { get; set; }
        public string IsNonVatValuation { get; set; }
        public string IsNonVatable { get; set; }
        public string OriginArea { get; set; }
        public decimal OtherChargesAmount { get; set; }
        public string OtherChargesDesc { get; set; }
        public string PaymentMode { get; set; }
        public string PaymentTerm { get; set; }
        public decimal PeracFee { get; set; }
        public string Quantity { get; set; }
        public string ServiceMode { get; set; }
        public string Shipper { get; set; }
        public decimal SubTotal { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal  ValuationAmount { get; set; }
        public decimal VatAmount { get; set; }
        public decimal WeightCharge { get; set; }

        public static List<Invoice> GetInvoices(DateTime start, DateTime end, string ConnectionString)
        {
            return Invoices( DAL.Invoice.GetInvoice(start, end, ConnectionString));
        }

        private static List<Invoice> Invoices( DataSet data)
        {
            List<Invoice> invoices = new List<Invoice>();
            DataTable convertdata = new DataTable();
            convertdata = data.Tables[0];
            foreach (DataRow row in convertdata.Rows)
            {
                Invoice invoice = new Invoice();
                invoice.AcceptedArea = row["AcceptedArea"].ToString();
                invoice.AcceptedBy = row["AcceptedBy"].ToString();
                invoice.ActualGrossWeight = (decimal)row["ActualGrossWeight"];
                invoice.AirwayBillNo = row["AirwayBillNo"].ToString();
                invoice.AwbFee =(decimal) row["AwbFee"];
                invoice.Branch = row["Branch"].ToString();
                invoice.ChargeableWeight = (decimal)row["ChargeableWeight"];
                invoice.Consignee = row["Consignee"].ToString();
                invoice.CratingFee = (decimal)row["CratingFee"];
                invoice.DangerousFee = (decimal)row["DangerousFee"];
                invoice.DateAccepted = (DateTime)row["DateAccepted"];
                invoice.DeclaredValue = (decimal)row["DeclaredValue"];
                invoice.DeliveryFee = (decimal)row["DeliveryFee"];
                invoice.DestinationArea = row["DestinationArea"].ToString();
                invoice.Discount = (decimal)row["Discount"];
                invoice.FreightCollectCharge = (decimal)row["FreightCollectCharge"];
                invoice.FuelSurcharge = (decimal)row["FuelSurcharge"];
                invoice.HasAwbFee = row["HasAwbFee"].ToString();
                invoice.HasFreightCollectCharge = row["HasFreightCollectCharge"].ToString();
                invoice.HasNonVatInsurance = row["HasNonVatInsurance"].ToString();
                invoice.HasNonVatWeightCharge = row["hasNonVatWeightCharge"].ToString();
                invoice.HasPerishableGoods = row["HasPerishableGoods"].ToString();
                invoice.Insurance = (decimal)row["Insurance"];
                invoice.IsNonVatable = row["IsNonVatable"].ToString();
                invoice.IsNonVatValuation = row["IsNonVatValuation"].ToString();
                invoice.OriginArea = row["OriginArea"].ToString();
                invoice.OtherChargesAmount =(decimal) row["OtherChargesAmount"];
                invoice.OtherChargesDesc = row["OtherChargesDesc"].ToString();
                invoice.PaymentMode = row["PaymentMode"].ToString();
                invoice.PaymentTerm = row["PaymentTerm"].ToString();
                invoice.PeracFee = (decimal)row["PeracFee"];
                invoice.Quantity = row["Quantity"].ToString();
                invoice.ServiceMode = row["ServiceMode"].ToString();
                invoice.Shipper = row["Shipper"].ToString();
                invoice.SubTotal = (decimal)row["SubTotal"];
                invoice.TotalAmount = (decimal)row["TotalAmount"];
                invoice.ValuationAmount = (decimal)row["ValuationAmount"];
                invoice.VatAmount = (decimal)row["VatAmount"];
                invoice.WeightCharge = (decimal)row["WeightCharge"];

                invoices.Add(invoice);
            }

            return invoices;
        }
    }
}
