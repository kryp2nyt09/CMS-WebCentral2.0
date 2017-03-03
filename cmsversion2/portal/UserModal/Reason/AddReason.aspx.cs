﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
using DAL = DataAccess;


public partial class _AddReason : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["StatusCode"] == null)
            {

            }
            else
            {
                string statusCode = Request.QueryString["StatusCode"].ToString();
                StatusCode(statusCode);
                LoadStatusbyStatusCode(statusCode);
            }
        }
    }

    private void StatusCode(string statusCode)
    {
        GlobalCode.globalCode = statusCode;
    }

    private void LoadStatusbyStatusCode(string statusCode)
    {
        rcbStatus.DataSource = BLL.Status.GetStatusByStatusCode(getConstr.ConStrCMS, statusCode);
        rcbStatus.DataValueField = "StatusID";
        rcbStatus.DataTextField = "StatusName";
        rcbStatus.DataBind();
    }


    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Insert Reason";
    }
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Guid statusID = new Guid(rcbStatus.SelectedItem.Value.ToString());
        Guid createdBy = new Guid("11111111-1111-1111-1111-111111111111");
        string host = HttpContext.Current.Request.Url.Authority;

        string reasonName = txtStatusName.Text;
        string reasonCode = GlobalCode.globalCode;
        BLL.Reason.InsertReason(statusID, reasonCode, reasonName, createdBy, 1, getConstr.ConStrCMS);
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

 
}