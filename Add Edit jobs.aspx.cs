using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ADD_EDIT_JOB_POSTINGS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!((Page)System.Web.HttpContext.Current.CurrentHandler).IsPostBack)
        {
            bind();
        } 
    
    }

    public void ConnnectDB()
    {
        SqlConnection sqlConn = new SqlConnection();
        try
        {
            sqlConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            //sqlCmd.CommandText = "Insert into Jobs (description, title, responsibilities, canApplyOnline, expirationDate, stateId, jobType) values ('" + txtJobDescription.Text + "','" + txtJobtitle.Text + "','" + txtResponsibilities.Text + "','" + rblHowToApply.Text + "','" + txtStartDate.Text + "',)";
            sqlCmd.CommandText = "Insert into Jobs (description, title, responsibilities, canApplyOnline, expirationDate, stateId, jobType) values ('" + txtJobDescription.Text + "','" + txtJobtitle.Text + "','" + txtResponsibilities.Text + "','" + rblHowToApply.Text + "','" + txtStartDate.Text + "' , " + ddlocation.SelectedValue + ", " + ddJobtype.SelectedValue + ")";
            sqlCmd.ExecuteNonQuery();

         }
        catch (Exception ex)
        {

        }
        finally
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ConnnectDB();
    }

    public void bind()
    {
        SqlConnection MyConnection;
        SqlCommand MyCommand;
        SqlDataAdapter MyAdapter;
        DataTable MyTable;

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "SELECT Id, KEYWORD  FROM KEYWORDS";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        ddKeywords.DataSource = MyTable.DefaultView;
        ddKeywords.DataValueField = "Id";
        ddKeywords.DataTextField = "KEYWORD";
        ddKeywords.DataBind();

        MyCommand.CommandText = "SELECT Id, LONGNAME  FROM STATES";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        ddlocation.DataSource = MyTable.DefaultView;
        ddlocation.DataValueField = "Id";
        ddlocation.DataTextField = "LONGNAME";
        ddlocation.DataBind();

        MyCommand.CommandText = "SELECT Id, jobType  FROM JobType";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        ddJobtype.DataSource = MyTable.DefaultView;
        ddJobtype.DataValueField = "Id";
        ddJobtype.DataTextField = "Jobtype";
        ddJobtype.DataBind();

        MyAdapter.Dispose();
        MyCommand.Dispose();
        MyConnection.Dispose();  
     }  
        
}

