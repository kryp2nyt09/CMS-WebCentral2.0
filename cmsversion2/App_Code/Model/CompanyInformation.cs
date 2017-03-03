using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CompanyInformation
/// </summary>
public class CompanyInformation
{
    //CompInfo
    public string CompanyName { get; set; }
    public string Address1 { get; set; }
    public string Address2 { get; set; }
    public Guid CityId { get; set; }
    public Guid IndustryId { get; set; }
    public string ContactInfo { get; set; }
    public string Tin { get; set; }
    public string Website { get; set; }
    public string Email { get; set; }
    public string President { get; set; }

    //ContactInfo
    public string ContactPerson { get; set; }
    public string Position { get; set; }
    public string Department { get; set; }
    public string MobileNo { get; set; }
    public string ContactInfoEmail { get; set; }
    public string ContactInfoFax { get; set; }

    //AccountInfo1
    public Guid AccttypeId { get; set; }
    public Guid AcctStatusId { get; set; }
    public Guid OrgTypeId { get; set; }

    public Guid? MotherCompId { get; set; }
    public Guid BusinessTypeId { get; set; }
    public Guid BillingPeriodId { get; set; }
    public Guid PaymentTermId { get; set; }
    public Guid PaymentModeId { get; set; }

    public DateTime dateApprove { get; set; }
    public Guid ApproveById { get; set; }
    public Guid AreaId { get; set; }
    public decimal Discount { get; set; }

    public decimal CreditLimit { get; set; }
}