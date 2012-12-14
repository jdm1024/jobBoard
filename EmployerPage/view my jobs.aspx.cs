using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class view_my_jobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string loggedinuser = null;
        MembershipUser membershipUser = Membership.GetUser();
        if (membershipUser != null)
        {
            loggedinuser = Membership.GetUser().ToString();
        }
        string jobId = Request.QueryString["jobId"];

        if (loggedinuser == null || "".Equals(loggedinuser) )
        {
            Response.Redirect("../Login.aspx");
        }
        else if(jobId == null || jobId.Length == 0)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                bindview();
            }
        }
    }
    public void bindview()
    {
            SqlConnection MyConnection;
            SqlCommand MyCommand;
            SqlDataAdapter MyAdapter;
            DataTable MyTable;

            MyConnection = new SqlConnection();
            MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            MyCommand = new SqlCommand();

            MyCommand.CommandText = "SELECT * FROM Jobs WHERE Id=" + Convert.ToInt32(Request.QueryString["jobId"]);
            MyCommand.CommandType = CommandType.Text;
            MyCommand.Connection = MyConnection;

            MyTable = new DataTable();
            MyAdapter = new SqlDataAdapter();
            MyAdapter.SelectCommand = MyCommand;
            MyAdapter.Fill(MyTable);

            txtjobtitle.Text = MyTable.Rows[0]["title"].ToString();
            txtroles.Text = MyTable.Rows[0]["responsibilities"].ToString();
            txtaplmethod.Text = MyTable.Rows[0]["applicationMethodId"].ToString();
            txtpostexp.Text = MyTable.Rows[0]["expirationDate"].ToString();
            txtstate.Text = MyTable.Rows[0]["stateId"].ToString();
            txtjobtype.Text = MyTable.Rows[0]["jobType"].ToString();
            string employerID = MyTable.Rows[0]["employerId"].ToString();

        MyCommand.CommandText = "SELECT * FROM Employer WHERE Id=" + employerID;
            MyCommand.CommandType = CommandType.Text;
            MyCommand.Connection = MyConnection;

            MyTable = new DataTable();
            MyAdapter = new SqlDataAdapter();
            MyAdapter.SelectCommand = MyCommand;
            MyAdapter.Fill(MyTable);

            txtAddress.Text = MyTable.Rows[0]["address"].ToString();
            txtname.Text = MyTable.Rows[0]["companyName"].ToString();
            txtemail.Text = MyTable.Rows[0]["email"].ToString();
            txtwebsite.Text = MyTable.Rows[0]["website"].ToString();
            txtcontact.Text = MyTable.Rows[0]["phone"].ToString();



            MyCommand.CommandText = "SELECT * FROM Jobs_Skills js INNER JOIN Skills s ON s.SkillsID  = js.SkillsID AND JobId=" + Convert.ToInt32(Request.QueryString["jobId"]);
            MyCommand.CommandType = CommandType.Text;
            MyCommand.Connection = MyConnection;

            MyTable = new DataTable();
            MyAdapter = new SqlDataAdapter();
            MyAdapter.SelectCommand = MyCommand;
            MyAdapter.Fill(MyTable);

            txtskills.Text = MyTable.Rows[0]["name"].ToString();
            

            MyAdapter.Dispose();
            MyCommand.Dispose();
            MyConnection.Dispose();
        }

    
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit jobs.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection();
        try
        {
            sqlConn.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;
            sqlCmd.CommandText = "DELETE FROM Jobs_Skills WHERE jobId=" + Convert.ToInt32(Request.QueryString["jobId"]);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Connection = sqlConn;
            sqlCmd.CommandText = "DELETE FROM Jobs WHERE Id=" + Convert.ToInt32(Request.QueryString["jobId"]);

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
        /*
        SqlConnection MyConnection;
        SqlCommand MyCommand;
        //SqlDataAdapter MyAdapter;
        //DataTable MyTable;

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "DELETE FROM Jobs WHERE Id=" + Convert.ToInt32(Request.QueryString["jobId"]);
        */
    }
}