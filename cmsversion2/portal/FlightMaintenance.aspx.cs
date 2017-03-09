using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
using DAL = DataAccess;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.VisualBasic.FileIO;

public partial class _FlightMaintenance : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        FileUploadFlightInfo.Attributes["onchange"] = "UploadFile(this)";



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
                editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["FlightInfoId"], e.Item.ItemIndex);

                //HyperLink ViewReps = (HyperLink)e.Item.FindControl("ViewRepsLink");
                //ViewReps.Attributes["href"] = "javascript:void(0);";
                //ViewReps.Attributes["onclick"] = String.Format("return ViewRep('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"], e.Item.ItemIndex);


                //HyperLink ViewApprovingLink = (HyperLink)e.Item.FindControl("ViewApprovingLink");
                //ViewApprovingLink.Attributes["href"] = "javascript:void(0);";
                //ViewApprovingLink.Attributes["onclick"] = String.Format("return ViewApprovingAuthority('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CompanyId"], e.Item.ItemIndex);
            
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

    public DataTable GetFlightDetails()
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.Flight.GetFlightInformation(getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }



    protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        RadGrid2.DataSource = GetFlightDetails();
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

    protected void RadGrid2_ItemCreated1(object sender, GridItemEventArgs e)
    {

    }

 


    protected void RadGrid2_ItemCommand1(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string userid = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["FlightInfoId"].ToString();
            DAL.Flight.DeleteFlightInfo(new Guid(userid),  getConstr.ConStrCMS);
           
        }
    }

    //Upload File
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //StreamReader streamReader;
        //FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + Path.GetFileName(FileUpload1.FileName)));
        if (FileUploadFlightInfo.HasFile)
        {
            string extension = System.IO.Path.GetExtension(FileUploadFlightInfo.FileName); // extension file
            //string contentType = FileUploadFlightInfo.PostedFile.ContentType;
            if (extension.Equals(".csv") || extension.Equals(".xlsx") || extension.Equals(".xls"))
            {
                try
                {
                    //string fileName = Path.GetFileName(FileUploadFlightInfo.PostedFile.FileName);
                    //string SaveLocation = Server.MapPath("UploadedFiles") + "\\" + fileName;
                    // FileInfo fi = new FileInfo(SaveLocation);
                    //FileUploadFlightInfo.PostedFile.SaveAs(SaveLocation);
                    //FileUploadFlightInfo.SaveAs(SaveLocation);
                    string folderPath = Server.MapPath("~/Upload");
                    
                    //Check whether Directory (Folder) exists.
                    if (!Directory.Exists(folderPath))
                    {
                        //If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderPath);
                    }

                    string SaveLocation = folderPath + "\\" + FileUploadFlightInfo.FileName;
                    //string SaveLocation = folderPath + Path.GetFileName(FileUploadFlightInfo.FileName);
                    // FileUploadFlightInfo.SaveAs(SaveLocation);
                    
                    //Save the File to the Directory (Folder).
                    FileUploadFlightInfo.SaveAs(SaveLocation);

                    DataTable csvData = GetDataTableFromCSVFile(SaveLocation);


                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
            else
            {

            }
        }
    }

    static System.Globalization.DateTimeFormatInfo dti = new System.Globalization.DateTimeFormatInfo();
    static string dateFormat = "yyyyMMddHHmmss";

    public DataTable GetDataTableFromCSVFile(string csvFilePath)
    {
        DataTable csvData = new DataTable();
        try
        {
            using (TextFieldParser csvReader = new TextFieldParser(csvFilePath))
            {
                csvReader.SetDelimiters(new string[] { "," });
                csvReader.HasFieldsEnclosedInQuotes = true;

                //read column names  
                string[] colFields = csvReader.ReadFields();
                foreach (string column in colFields)
                {
                    DataColumn datecolumn = new DataColumn(column);
                    datecolumn.AllowDBNull = true;
                    csvData.Columns.Add(datecolumn);
                }

                while (!csvReader.EndOfData)
                {
                    string[] fieldData = csvReader.ReadFields();
                    string flightNo = fieldData[0];
                    string airlineName = fieldData[3];
                    string originCityName = fieldData[4];
                    string destinationCityName = fieldData[5];
                    //DateTime ETD = convertStringToDateTime(fieldData[1]);
                    //DateTime ETA = convertStringToDateTime(fieldData[2]);
                    DateTime ETD = Convert.ToDateTime(fieldData[1]);
                    DateTime ETA = Convert.ToDateTime(fieldData[2]);

                    // csvData.Rows.Add(fieldData);
                }
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine(ex);
        }

        return csvData;
    }

    //convert DateTime into Formated String
    public static string convertDateTimeToFormatedString(DateTime dateTime)
    {
        return dateTime.ToString(dateFormat, dti);
    }

    //convert Formatted String into DateTime
    public static DateTime convertStringToDateTime(string dateTimeInString)
    {
        dti.LongTimePattern = dateFormat;
        return DateTime.ParseExact(dateTimeInString, "T", dti);
    }



}