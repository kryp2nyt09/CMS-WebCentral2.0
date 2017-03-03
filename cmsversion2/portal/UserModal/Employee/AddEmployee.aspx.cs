﻿using System;
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


public partial class _AddCrating : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitLoad();
        }
    }



    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Add Employee";
    }


    public void InitLoad()
    {
        LoadDepartment();
        LoadPosition();
        LoadBranchCorporateOffice();
        LoadRevenueUnitType();
        PopulateRevenueUnitName();
    }

    #region Data Sources
    public void LoadDepartment()
    {
        DataTable data = BLL.Department.GetDepartment(getConstr.ConStrCMS).Tables[0];
        rcbDepartment.DataSource = data;
        rcbDepartment.DataTextField = "DepartmentName";
        rcbDepartment.DataValueField = "DepartmentId";
        rcbDepartment.DataBind();
    }

    public void LoadPosition()
    {
        DataTable data = BLL.Position.GetPosition(getConstr.ConStrCMS).Tables[0];
        rcbPosition.DataSource = data;
        rcbPosition.DataTextField = "PositionName";
        rcbPosition.DataValueField = "PositionId";
        rcbPosition.DataBind();
    }

    private void LoadBranchCorporateOffice()
    {
        DataTable bcoList = BLL.Revenue_Info.getBranchCorp(getConstr.ConStrCMS).Tables[0];

        rcbBranchCorpOffice.DataSource = bcoList;
        rcbBranchCorpOffice.DataTextField = "BranchCorpOfficeName";
        rcbBranchCorpOffice.DataValueField = "BranchCorpOfficeId";
        rcbBranchCorpOffice.DataBind();

    }

    private void LoadRevenueUnitType()
    {
        DataTable revenueUnitTypeList = BLL.Revenue_Info.getRevenueType(getConstr.ConStrCMS).Tables[0];
        rcbRevenueUnitType.DataSource = revenueUnitTypeList;
        rcbRevenueUnitType.DataTextField = "RevenueUnitTypeName";
        rcbRevenueUnitType.DataValueField = "RevenueUnitTypeId";
        rcbRevenueUnitType.DataBind();
    }

    private void PopulateRevenueUnitName()
    {
        DataTable revenueUnitName = BLL.Revenue_Info.getRevenueUnit(new Guid(rcbRevenueUnitType.SelectedValue.ToString()), getConstr.ConStrCMS).Tables[0];
        rcbRevenueUnitName.DataSource = revenueUnitName;
        rcbRevenueUnitName.DataTextField = "RevenueUnitName";
        rcbRevenueUnitName.DataValueField = "RevenueUnitId";
        rcbRevenueUnitName.DataBind();
    }

    private void populateRevenueUnitNameByBCO()
    {
        DataTable LocationList = BLL.Revenue_Info.getRevenueUnitByBCO(new Guid(rcbRevenueUnitType.SelectedValue.ToString()), new Guid(rcbBranchCorpOffice.SelectedValue.ToString()), getConstr.ConStrCMS).Tables[0];
        rcbRevenueUnitName.DataSource = LocationList;
        rcbRevenueUnitName.DataTextField = "RevenueUnitName";
        rcbRevenueUnitName.DataValueField = "RevenueUnitId";
        rcbRevenueUnitName.DataBind();
    }
    #endregion


    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "Insert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        for (int i = 1; i < 4; i++)
        {
            string val = e.NewValues[i - 1].ToString();
            int maxLength = i * 10;
            if (val.Length > maxLength) e.NewValues[i - 1] = val.Substring(0, maxLength);
        }
    }

    protected void DetailsView1_ItemCommand1(object sender, DetailsViewCommandEventArgs e)
    {

    }

    protected void DetailsView1_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
    {

    }

    protected void rcbRevenueUnitType_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        //PopulateRevenueUnitName();
        populateRevenueUnitNameByBCO();
    }

    protected void rcbRevenueUnitType_TextChanged(object sender, EventArgs e)
    {
        rcbRevenueUnitName.Items.Clear();
         //PopulateRevenueUnitName();
        populateRevenueUnitNameByBCO();
    }

    protected void rcbBranchCorpOffice_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        populateRevenueUnitNameByBCO();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string host = HttpContext.Current.Request.Url.Authority;
        Guid deparmentId = new Guid(rcbDepartment.SelectedItem.Value.ToString());
        Guid positionid = new Guid(rcbPosition.SelectedItem.Value.ToString());
        Guid assignedtoareaId = new Guid(rcbRevenueUnitName.SelectedItem.Value.ToString());

        Guid ID = new Guid("11111111-1111-1111-1111-111111111111");
        BLL.Employee_Info.InsertEmployee(deparmentId, positionid, assignedtoareaId, txtFirstname.Text, txtLastname.Text, txtMiddlename.Text,
           dpBirthDate.SelectedDate.Value, txtTel.Text, txtMobile.Text, txtEmail.Text, txtLicense.Text, dpLicense.SelectedDate.Value, ID, getConstr.ConStrCMS);

        string script = "<script>CloseOnReload()</" + "script>";
        ClientScript.RegisterStartupScript(this.GetType(), "CloseOnReload", script);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }

    protected void CloseButton_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);



    }

    //protected void CloseButton_Click1(object sender, EventArgs e)
    //{

    //    Page.ClientScript.RegisterClientScriptBlock(GetType(),
    //        "CloseScript", "Close()", true);

    //}
}