using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_jobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        bind1();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        ConnnectDB();
    }
    public void bind1()
    {
        SqlConnection MyConnection;
        SqlCommand MyCommand;
        SqlDataAdapter MyAdapter;
        DataTable MyTable;
       

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "SELECT * FROM JOBS WHERE Id=" + Convert.ToInt32(txtJobId.Text);
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        txtJobtitle.Text = MyTable.Rows[0]["title"].ToString();
        txtResponsibilities.Text = MyTable.Rows[0]["responsibilities"].ToString();
        txtStartDate.Text = MyTable.Rows[0]["expirationDate"].ToString();
        ddlocation.SelectedValue = MyTable.Rows[0]["stateId"].ToString();
        ddJobtype.SelectedValue = MyTable.Rows[0]["jobType"].ToString();                  
        txtJobDescription.Text = MyTable.Rows[0]["description"].ToString();

        MyAdapter.Dispose();
        MyCommand.Dispose();
        MyConnection.Dispose();
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
            sqlCmd.CommandText = "UPDATE JOBS  SET description = '" + txtJobDescription.Text + "',title='" + txtJobtitle.Text + "',responsibilities='" + txtResponsibilities.Text + "',stateId=" + ddlocation.SelectedValue + ",jobType=" + ddJobtype.SelectedValue + ",expirationDate='" + txtStartDate.Text + "' where Id=" + Convert.ToInt32(txtJobId.Text);
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
}