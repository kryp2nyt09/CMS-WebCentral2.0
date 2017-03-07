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
using DAL = DataAccess;

public partial class _AddFlight : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBranchCorpOffice();
            LoadCity();
            GetGateway();
            GetGateway();
            //if (Request.QueryString["ID"] == null)
            //{

            //}
            //else
            //{
            //   string BranchCorpId = Request.QueryString["ID"].ToString();
            //    DataTable GroupInfo = GetBranchCorpById(new Guid(BranchCorpId));
            //    int counter = 0;
            //    foreach (DataRow row in GroupInfo.Rows)
            //    {
            //        if (counter == 0)
            //        {

            //            string Id = row["BranchCorpOfficeId"].ToString();
            //            string BranchCorpOfficeName = row["BranchCorpOfficeName"].ToString();

            //            string ProvinceName = row["ProvinceName"].ToString();
            //            string ContactNo1 = row["ContactNo1"].ToString();
            //            string ContactNo2 = row["ContactNo2"].ToString();
            //            string street = row["StreetAddress"].ToString();
            //            string fax = row["fax"].ToString();
            //            string zipcode = row["ZipCode"].ToString();

            //            RadComboBoxItem item = rcbGroup.FindItemByText(ProvinceName);
            //            item.Selected = true;

            //            txtRegionName.Text = BranchCorpOfficeName; //BCOname
            //            txtContactNo1.Text = ContactNo1;
            //            txtContactNo2.Text = ContactNo2;
            //            txtFax.Text = fax;
            //            txtStreet.Text = street;
            //            txtzipcode.Text = zipcode;

            //            lblGroupID.Text = Id;
            //            counter++;
            //        }
            //    }

            //}
        }
    }

    private void GetGateway()
    {

        rcbGateway.DataSource = BLL.Gateway.GetGateway(getConstr.ConStrCMS);
        rcbGateway.DataValueField = "RevenueUnitId";
        rcbGateway.DataTextField = "RevenueUnitName";
        rcbGateway.DataBind();
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Edit BranchCorp";
    }


    private void LoadBranchCorpOffice()
    {
        rcbBCO.DataSource = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        rcbBCO.DataValueField = "BranchCorpOfficeId";
        rcbBCO.DataTextField = "BranchCorpOfficeName";
        rcbBCO.DataBind();
    }

    private void LoadCity()
    {
        rcbOrigin.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbOrigin.DataValueField = "CityId";
        rcbOrigin.DataTextField = "CityName";
        rcbOrigin.DataBind();

        rcbDestination.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbDestination.DataValueField = "CityId";
        rcbDestination.DataTextField = "CityName";
        rcbDestination.DataBind();
    }



    public DataTable GetBranchCorpById(Guid ID)
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOfficeById(ID, getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }


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
        //logic to truncate long string to prevent SQL error
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


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Guid BCOid = new Guid(rcbBCO.SelectedItem.Value.ToString());
        Guid GatewayId = new Guid(rcbGateway.SelectedItem.Value.ToString());
        Guid OriginCity = new Guid(rcbOrigin.SelectedItem.Value.ToString());
        Guid DestinationCity = new Guid(rcbDestination.SelectedItem.Value.ToString());
        DateTime ETD = rdtETD.SelectedDate.Value;
        DateTime ETA = rdtETD.SelectedDate.Value;
        String FlightNo = txtFlightNo.Text;
                Guid ModifiedBy = new Guid("11111111-1111-1111-1111-111111111111");
        string host = HttpContext.Current.Request.Url.Authority;
        DAL.Flight.InsertFlightInfo(txtFlightNo.Text, ETD, ETA, BCOid, GatewayId, OriginCity, DestinationCity, ModifiedBy, getConstr.ConStrCMS);
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