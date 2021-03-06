﻿using System;
using System.Data;
using System.Web;
using BLL = BusinessLogic;
using Tools = utilities;

public partial class _EditBatch : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] == null)
            {

            }
            else
            {
                string batchId = Request.QueryString["ID"].ToString();


                DataTable GroupInfo = GetBatchById(new Guid(batchId));
                int counter = 0;
                foreach (DataRow row in GroupInfo.Rows)
                {
                    if (counter == 0)
                    {
                        string x = row["BatchID"].ToString();
                        string y = row["BatchName"].ToString();

                        txtBatchName.Text = y;
                        lblBatchID.Text = x;
                        counter++;
                    }
                }

            }
        }
    }


    public DataTable GetBatchById(Guid ID)
    {
        DataSet data = BLL.Batch.GetBatchByBatchID(getConstr.ConStrCMS, ID);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        string host = HttpContext.Current.Request.Url.Authority;
        BLL.Batch.UpdateBatchName(new Guid(lblBatchID.Text), txtBatchName.Text, getConstr.ConStrCMS);

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