using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;


public partial class _AddRepresentatives : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitLoad();
           
        }
    }


    #region InitLoad
    private void InitLoad()
    {
        LoadCity();
        LoadAllRevenueUnit();
        LoadCompany();
    }
    #endregion


    #region Data Sources
    private void LoadCity()
    {
        rcbRepCity.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbRepCity.DataValueField = "CityId";
        rcbRepCity.DataTextField = "CityName";
        rcbRepCity.DataBind();
    }

    private void LoadAllRevenueUnit()
    {
        rcbRepArea.DataSource = BLL.Revenue_Info.getAllRevenueUnit(getConstr.ConStrCMS);
        rcbRepArea.DataValueField = "RevenueUnitId";
        rcbRepArea.DataTextField = "RevenueUnitName";
        rcbRepArea.DataBind();
    }

    private void LoadCompany()
    {
        rcbRepCompany.DataSource = BLL.Company.GetCompanies(getConstr.ConStrCMS);
        rcbRepCompany.DataValueField = "CompanyId";
        rcbRepCompany.DataTextField = "CompanyName";
        rcbRepCompany.DataBind();
    }
    #endregion


    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        string host = HttpContext.Current.Request.Url.Authority;
        Guid ID = new Guid("11111111-1111-1111-1111-111111111111");
        Guid cityId = new Guid();
        Guid companyId = new Guid();
        Guid areaId = new Guid();

        cityId = Guid.Parse(rcbRepCity.SelectedValue.ToString());
        companyId = Guid.Parse(rcbRepCompany.SelectedValue.ToString());
        areaId = Guid.Parse(rcbRepArea.SelectedValue.ToString());


        BLL.Representatives.InsertRepresentatives(txtRepFirstName.Text, txtRepLastName.Text, txtRepContactNo.Text,txtRepMobileNo.Text, txtRepFax.Text,
            txtRepEmail.Text, txtRepAdress1.Text, txtRepAdress2.Text, cityId, txtRepzipCode.Text, txtRepTitle.Text,
            txtRepDept.Text,txtRepRemarks.Text, companyId, areaId, txtRepStreet.Text, 
            txtRepBarangay.Text, ID, getConstr.ConStrCMS);

        string script = "<script>CloseOnReload()</" + "script>";
        ClientScript.RegisterStartupScript(this.GetType(), "CloseOnReload", script);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }


}