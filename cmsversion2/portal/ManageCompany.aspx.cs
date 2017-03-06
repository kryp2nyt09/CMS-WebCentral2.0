using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
public partial class _ManageCompany : System.Web.UI.Page
{

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
    
        
        RadGrid2.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = false;
      
        if (!string.IsNullOrEmpty(Session["UsernameSession"] as string))
        {
            string usersession = Session["UsernameSession"].ToString();
        }

    }

    protected void RadGrid2_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            HyperLink editLink = (HyperLink)e.Item.FindControl("EditLink");
            editLink.Attributes["href"] = "javascript:void(0);";
            editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"], e.Item.ItemIndex);

            HyperLink ViewReps = (HyperLink)e.Item.FindControl("ViewRepsLink");
            ViewReps.Attributes["href"] = "javascript:void(0);";
            ViewReps.Attributes["onclick"] = String.Format("return ViewRep('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"], e.Item.ItemIndex);


            HyperLink ViewApprovingLink = (HyperLink)e.Item.FindControl("ViewApprovingLink");
            ViewApprovingLink.Attributes["href"] = "javascript:void(0);";
            ViewApprovingLink.Attributes["onclick"] = String.Format("return ViewApprovingAuthority('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"], e.Item.ItemIndex);

        }
    }

    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {
        if (e.Argument == "Rebind")
        {

            RadGrid2.MasterTableView.SortExpressions.Clear();
            RadGrid2.MasterTableView.GroupByExpressions.Clear();
            RadGrid2.Rebind();
        }
        else if (e.Argument == "RebindAndNavigate")
        {
            RadGrid2.MasterTableView.SortExpressions.Clear();
            RadGrid2.MasterTableView.GroupByExpressions.Clear();
            RadGrid2.MasterTableView.CurrentPageIndex = RadGrid2.MasterTableView.PageCount - 1;
            RadGrid2.Rebind();
        }
    }
    //public DataTable Sellers
    //{
    //    get
    //    {
    //        DataTable data = Session["Data"] as DataTable;

    //        if (data == null)
    //        {
    //            data = GetUsers();
    //            Session["Data"] = data;
    //        }


    //        return data;
    //    }
    //}

    public DataTable GetCompany()
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.Company.GetCompanies(getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }



    protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        RadGrid2.DataSource = GetCompany();
    }




    protected void RadGrid2_ItemDataBound(object sender, GridItemEventArgs e)
    {

    }

    protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
    {
    }

    protected void RadGrid2_ItemDataBound1(object sender, GridItemEventArgs e)
    {

    }

    protected void RadGrid2_ItemUpdated(object sender, GridUpdatedEventArgs e)
    {

    }

    protected void RadGrid2_ItemCommand1(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string userid = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"].ToString();
            BLL.Users_Info.UpdateUserProfile(new Guid(userid), 3, getConstr.ConStrCMS);
            //3 for delete flagging
        }
    }
}