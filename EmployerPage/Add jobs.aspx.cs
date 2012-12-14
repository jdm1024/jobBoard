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
        if (!IsPostBack)
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
            sqlCmd.CommandText = "Insert into Jobs (description, title, responsibilities, applicationMethodId, expirationDate, stateId, jobType, employerId) values ('" + txtJobDescription.Text + "','" + txtJobtitle.Text + "','" + txtResponsibilities.Text + "','" + rblHowToApply.SelectedValue + "','" + txtStartDate.Text + "' , " + ddlocation.SelectedValue + ", " + ddJobtype.SelectedValue + ", " + ddEmpid.SelectedValue + ")";
            
            sqlCmd.ExecuteNonQuery();

            sqlCmd.CommandText = "Select max(Id) from jobs";

             //  employerId = Convert.ToInt32(sqlCmd.ExecuteScalar());
              //  employerId = Int32.Parse(sqlCmd.ExecuteScalar());
                string result = sqlCmd.ExecuteScalar().ToString();
                int jobId = Int32.Parse(result);
 

            sqlCmd.CommandText = "Insert into Jobs_Skills (jobId, skillsId) values (" + jobId + ", " + ddKeywords.SelectedValue + ")";

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
        MyCommand.CommandText = "SELECT * FROM Skills";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        ddKeywords.DataSource = MyTable.DefaultView;
        ddKeywords.DataValueField = "SkillsId";
        ddKeywords.DataTextField = "name";
        ddKeywords.DataBind();

        ddKeywords.SelectedValue = "1";
    //    ddKeywords.Items.Add(new Item("--select--",""))
       //     ddKeywords.Items.Insert(0, new ListItem());

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

        MyCommand.CommandText = "SELECT * FROM Employer";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        ddEmpid.DataSource = MyTable.DefaultView;
        ddEmpid.DataValueField = "Id";
        ddEmpid.DataTextField = "companyName";
        ddEmpid.DataBind();

        MyCommand.CommandText = "SELECT * FROM ApplicationMethod";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);     

        rblHowToApply.DataSource = MyTable.DefaultView;
        rblHowToApply.DataValueField = "Id";
        rblHowToApply.DataTextField = "method";
        rblHowToApply.DataBind();

        
        MyAdapter.Dispose();
        MyCommand.Dispose();
        MyConnection.Dispose();  
     }  
        
}

