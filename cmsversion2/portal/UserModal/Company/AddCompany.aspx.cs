using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;


public partial class _AddCompany : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string urlWithSessionID = Response.ApplyAppPathModifier(Request.Url.PathAndQuery);
        //RadTab tab = RadTabStrip1.FindTabByUrl(urlWithSessionID);
        //if (tab != null)
        //{
        //    tab.SelectParents();
        //    tab.PageView.Selected = true;
        //}


        if (!IsPostBack)
        {
            InitLoad();
        }
    }

    #region Properties
    #region Comp Info
    //List<CompanyInformation> companyInfo = new List<CompanyInformation>();
    CompanyInformation compInfo = new CompanyInformation();
   // ContactInformation contactInfo = new ContactInformation();
    #endregion
    #endregion

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Add Company";
    }

    #region Initialization
    private void InitLoad()
    {
        //CompanyInformation
        LoadCity();
        LoadIndustryType();

        //AccountInformation1
        LoadAccountType();
        LoadAccountStatus();
        LoadOrganizationType();
        LoadBusinessType();
        LoadBillingPeriod();
        LoadPaymentTerm();
        LoadApprovedBy();
        LoadBCO();
        LoadAllRevenueUnit();
        loadDataMotherCompany();
        LoadPaymentMode();
    }
    #endregion

    #region DataSources
    #region CompanyInfo
    private void LoadCity()
    {
        rcbCompInfoCity.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbCompInfoCity.DataValueField = "CityId";
        rcbCompInfoCity.DataTextField = "CityName";
        rcbCompInfoCity.DataBind();

        rcbBillingInfoCity.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbBillingInfoCity.DataValueField = "CityId";
        rcbBillingInfoCity.DataTextField = "CityName";
        rcbBillingInfoCity.DataBind();
    }

    private void LoadIndustryType()
    {
        rcbCompInfoIndustry.DataSource = BLL.Industry.GetIndustry(getConstr.ConStrCMS);
        rcbCompInfoIndustry.DataValueField = "IndustryId";
        rcbCompInfoIndustry.DataTextField = "IndustryName";
        rcbCompInfoIndustry.DataBind();
    }
    #endregion

    #region Account Info 1
    private void LoadAccountType()
    {
        rcbAccountType.DataSource = BLL.AccountType.GetAccountType(getConstr.ConStrCMS);
        rcbAccountType.DataValueField = "AccountTypeId";
        rcbAccountType.DataTextField = "AccountTypeName";
        rcbAccountType.DataBind();
    }

    private void LoadAccountStatus()
    {
        rcbAccountStatus.DataSource = BLL.AccountStatus.GetAccountStatus(getConstr.ConStrCMS);
        rcbAccountStatus.DataValueField = "AccountStatusId";
        rcbAccountStatus.DataTextField = "AccountStatusName";
        rcbAccountStatus.DataBind();
    }

    private void LoadOrganizationType()
    {
        rcbAcctInfoOrganizationType.DataSource = BLL.OrganizationType.GetOrganizationType(getConstr.ConStrCMS);
        rcbAcctInfoOrganizationType.DataValueField = "OrganizationTypeId";
        rcbAcctInfoOrganizationType.DataTextField = "OrganizationTypeName";
        rcbAcctInfoOrganizationType.DataBind();
    }

    private void LoadBusinessType()
    {
        rcbBusinessType.DataSource = BLL.BusinessType.GetBusinessType(getConstr.ConStrCMS);
        rcbBusinessType.DataValueField = "BusinessTypeId";
        rcbBusinessType.DataTextField = "BusinessTypeName";
        rcbBusinessType.DataBind();
    }

    private void LoadBillingPeriod()
    {
        rcbBillingPeriod.DataSource = BLL.BillingPeriod.GetBillingPeriod(getConstr.ConStrCMS);
        rcbBillingPeriod.DataValueField = "BillingPeriodId";
        rcbBillingPeriod.DataTextField = "BillingPeriodName";
        rcbBillingPeriod.DataBind();
    }

    private void LoadPaymentTerm()
    {
        rcbApprovedBy.DataSource = BLL.Employee_Info.GetEmployee(getConstr.ConStrCMS);
        rcbApprovedBy.DataValueField = "EmployeeId";
        rcbApprovedBy.DataTextField = "FullName";
        rcbApprovedBy.DataBind();
    }

    private void LoadApprovedBy()
    {
        rcbPaymentTerm.DataSource = BLL.Employee_Info.GetEmployeeName(getConstr.ConStrCMS);
        rcbPaymentTerm.DataValueField = "EmployeeId";
        rcbPaymentTerm.DataTextField = "EmployeeName";
        rcbPaymentTerm.DataBind();
    }

    private void LoadBCO()
    {
        rcbBCO.DataSource = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        rcbBCO.DataValueField = "BranchCorpOfficeId";
        rcbBCO.DataTextField = "BranchCorpOfficeName";
        rcbBCO.DataBind();
    }

    private void LoadAllRevenueUnit()
    {
        rcbArea.DataSource = BLL.Revenue_Info.getAllRevenueUnit(getConstr.ConStrCMS);
        rcbArea.DataValueField = "RevenueUnitId";
        rcbArea.DataTextField = "RevenueUnitName";
        rcbArea.DataBind();
    }

    private void LoadPaymentMode()
    {
        rcbPaymentMode.DataSource = BLL.PaymentMode.GetPaymentMode(getConstr.ConStrCMS);
        rcbPaymentMode.DataValueField = "PaymentModeId";
        rcbPaymentMode.DataTextField = "PaymentModeName";
        rcbPaymentMode.DataBind();
    }

    private void populateRevenueUnitNameByBCOId()
    {
        DataTable LocationList = BLL.Revenue_Info.getRevenueUnitByBCOId(new Guid(rcbBCO.SelectedValue.ToString()), getConstr.ConStrCMS).Tables[0];
        rcbArea.DataSource = LocationList;
        rcbArea.DataValueField = "RevenueUnitId";
        rcbArea.DataTextField = "RevenueUnitName";
        rcbArea.DataBind();
    }

    private void LoadMotherCompany()
    {
        rcbAcctInfoMotherCompany.DataSource = BLL.Company.GetCompanies(getConstr.ConStrCMS);
        rcbAcctInfoMotherCompany.DataValueField = "CompanyId";
        rcbAcctInfoMotherCompany.DataTextField = "CompanyName";
        rcbAcctInfoMotherCompany.DataBind();
    }

    private void loadDataMotherCompany()
    {
        if (rcbAcctInfoOrganizationType.SelectedIndex >= 0)
        {
            string organizationType = rcbAcctInfoOrganizationType.SelectedItem.ToString();
            if (organizationType.Equals("Head Office"))
            {
                rcbAcctInfoMotherCompany.Enabled = false;
                rcbAcctInfoMotherCompany.Items.Clear();
            }
            else if (organizationType.Equals("Branch Office"))
            {
                rcbAcctInfoMotherCompany.Enabled = true;
                LoadMotherCompany();
            }
        }

    }
    #endregion

    #region Account Info 2
    #endregion


    #endregion

    #region Methods
    #region Comp Info
    private void CompInfo()
    {
        Guid cityId = new Guid();
        Guid industryId = new Guid();
        cityId = Guid.Parse(rcbCompInfoCity.SelectedValue.ToString());
        industryId = Guid.Parse(rcbCompInfoIndustry.SelectedValue.ToString());

        compInfo.CompanyName = txtCompInfoCompanyName.Text;
        compInfo.Address1 = txtCompInfoAddress1.Text;
        compInfo.Address2 = txtCompInfoAdress2.Text;
        compInfo.CityId = cityId;
        compInfo.IndustryId = industryId;
        compInfo.ContactInfo = txtContactNo.Text;
        compInfo.Tin = txtCompInfoTin.Text;
        compInfo.Website = txtCompInfoWebsite.Text;
        compInfo.Email = txtCompInfoEmail.Text;
        compInfo.President = txtCompInfoPresident.Text;
       
    }

    #region Contact Info
    private void ContactInfo()
    {
        compInfo.ContactPerson = txtContactInContacPerson.Text;
        compInfo.Position = txtContactInfoPostion.Text;
        compInfo.Department = txtContactInfoDept.Text;
        compInfo.MobileNo = txtContactInfoMobile.Text;
        compInfo.ContactInfoEmail = txtContactInfoEmail.Text;
        compInfo.ContactInfoFax = txtContactInfoFax.Text;
    }

    private void AcctInfo1()
    {
        Guid AccttypeId = new Guid();
        Guid acctStatusId = new Guid();
        Guid OrgTypeId = new Guid();
        AccttypeId = Guid.Parse(rcbAccountType.SelectedValue.ToString());
        acctStatusId = Guid.Parse(rcbAccountStatus.SelectedValue.ToString());
        OrgTypeId = Guid.Parse(rcbAcctInfoOrganizationType.SelectedValue.ToString());

        compInfo.AccttypeId = AccttypeId;
        compInfo.AcctStatusId = acctStatusId;
        compInfo.OrgTypeId = OrgTypeId;
    }
    #endregion
    #endregion
    #endregion

    #region Events
    protected void btnSave_Click(object sender, EventArgs e)
    {
        CompInfo();
        ContactInfo();
       

    }
    

    #region Account Information 1
    protected void rcbBCO_OnSelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        populateRevenueUnitNameByBCOId();
    }

    protected void rcbOrganizationType_OnSelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (rcbAcctInfoOrganizationType.Text.Equals("Head Office"))
        {
            rcbAcctInfoMotherCompany.Enabled = false;
        }
        else
        {
            rcbAcctInfoMotherCompany.Enabled = true;
            LoadMotherCompany();
        }
    }
    #endregion
    #endregion


    


}