using System;
using DAL = DataAccess;
using Tools = utilities;

public partial class portal_Graph : System.Web.UI.Page
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
        LoadMonths();
    }
    #endregion

    #region Data Source
    private void LoadMonths()
    {
        rcbMonth.DataSource = DAL.Graph.GetAllMonths(getConstr.ConStrCMS);
        rcbMonth.DataValueField = "MonthNumber";
        rcbMonth.DataTextField = "MonthName";
        rcbMonth.DataBind();
    }
    #endregion
}