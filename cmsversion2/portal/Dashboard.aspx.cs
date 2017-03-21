using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
using DAL = DataAccess;
public partial class _Dashboard : System.Web.UI.Page
{

    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!string.IsNullOrEmpty(Session["UsernameSession"] as string))
        {
            string usersession = Session["UsernameSession"].ToString();
        }

        if (!IsPostBack)
        {
           
            
        }
    }

    #region InitLoad

    #endregion


    #region DataSources
    public DataTable GetAwbNoInformation(string awbNo)
    {
        DataSet data = BLL.AirwayBill.GetAwbInfoByAwbNo(awbNo, getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }

    public DataTable GetDetailsAwbNoInformation(string awbNo)
    {
        DataSet data = BLL.AirwayBill.GetDetailsAwbNo(awbNo, getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }

    public void fillAwbNoInfo(DataTable Data)
    {
        int counter = 0;
        foreach (DataRow row in Data.Rows)
        {
            if (counter == 0)
            {
                try
                {
                    txtAwb.Text = row["AirwayBillNo"].ToString();

                    string acceptedDate = row["DateAccepted"].ToString();
                    DateTime dateAccepted = Convert.ToDateTime(acceptedDate);

                    txtDate.Text = dateAccepted.ToShortDateString(); ;

                    txtOrigin.Text = row["Origin"].ToString();
                    txtDestination.Text = row["Destination"].ToString();
                    txtShipper.Text = row["Shipper"].ToString();
                    txtConsignee.Text = row["Consignee"].ToString();

                    txtCommodity.Text = row["CommodityName"].ToString();
                    txtDesc.Text = row["GoodsDescriptionName"].ToString();
                    txtServiceType.Text = row["ServiceTypeName"].ToString();
                    txtShipMode.Text = row["ShipModeName"].ToString();
                    txtAddress1.Text = row["OriginAddress"].ToString();
                    txtAddress2.Text = row["DestinationAddress"].ToString();

                    txtQuantity.Text = row["Quantity"].ToString();
                    txtWeight.Text = row["Weight"].ToString();
                    txtDimension.Text = row["Dimension"].ToString();

                    
                    
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }

                counter++;
            }
        }
    }
    #endregion


    #region Events
    #region RadGrid Events

    #endregion

    #region Search
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string awbNo = "";
        if(!String.IsNullOrEmpty(txtAwbNo.Text))
        {
            awbNo = txtAwbNo.Text;
            DataTable Data = GetAwbNoInformation(awbNo);
            //fillAwbNoInfo(Data);
            #region Fill Value
            int counter = 0;
            foreach (DataRow row in Data.Rows)
            {
                if (counter == 0)
                {
                    try
                    {
                        txtAwb.Text = row["AirwayBillNo"].ToString();

                        string acceptedDate = row["DateAccepted"].ToString();
                        DateTime dateAccepted = Convert.ToDateTime(acceptedDate);

                        txtDate.Text = dateAccepted.ToShortDateString(); ;

                        txtOrigin.Text = row["Origin"].ToString();
                        txtDestination.Text = row["Destination"].ToString();
                        txtShipper.Text = row["Shipper"].ToString();
                        txtConsignee.Text = row["Consignee"].ToString();

                        txtCommodity.Text = row["CommodityName"].ToString();
                        txtDesc.Text = row["GoodsDescriptionName"].ToString();
                        txtServiceType.Text = row["ServiceTypeName"].ToString();
                        txtShipMode.Text = row["ShipModeName"].ToString();
                        txtAddress1.Text = row["OriginAddress"].ToString();
                        txtAddress2.Text = row["DestinationAddress"].ToString();

                        txtQuantity.Text = row["Quantity"].ToString();
                        txtWeight.Text = row["Weight"].ToString();
                        txtDimension.Text = row["Dimension"].ToString();



                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);
                    }

                    counter++;
                }
            }
            #endregion
            radGridAwbNo.DataSource = GetDetailsAwbNoInformation(awbNo);
            radGridAwbNo.Rebind();
            radGridAwbNo.DataBind();

        }
    }

    protected void radGridAwbNo_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        string awbNo = txtAwbNo.Text;
        radGridAwbNo.DataSource = GetDetailsAwbNoInformation(awbNo);
    }
    #endregion
    #endregion

}