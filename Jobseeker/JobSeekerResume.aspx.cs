using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class JobSeekerResume : System.Web.UI.Page
{
    protected static String userId;
    protected static bool resumeExists = false;
    protected static string fileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)(Session["userId"]);
        SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader;

        SqlDataAdapter MyAdapter;
        DataTable MyTable;
        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
       
        try
        {
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            sqlCmd.CommandText = "select fileName from JobSeeker_Resume where JobSeekerId = '" + userId + "'";
            myReader = sqlCmd.ExecuteReader();

            while (myReader.Read())
            {
                resumeExists  = true;
                fileName = myReader.GetString(0).Trim();
            }

            /*if (resumeExists)
                download.Visible = true;
            else
                download.Visible = false;*/
            download.Visible = false;


        }
        catch (Exception ex)
        {
            Console.Out.WriteLine("Exception occured:" + ex.Message);
        }
        finally
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }

         
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
            try
            {
                
                fileName = "E:\\Web Programming Language\\Resume Repository\\" + FileUpload1.FileName; ;
                FileUpload1.SaveAs(fileName);
               
                Label1.Text = "Your resume has been saved Successfully";
                
                FileUpload1.Visible = false;
                save.Visible = false;
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            Label1.Text = "You have not specified a file.";
        }
     //   saveJobSeekerResume();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        try
        {
           // string strURL = "E:\\Web Programming Language\\Resume Repository\\"+userId+"-Resume";
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
            byte[] data = req.DownloadData(Server.MapPath(fileName));
            response.BinaryWrite(data);
            response.End();
        }
        catch (Exception ex)
        {
        }
    }

    protected void saveJobSeekerResume()
    {
         SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader = null;
        try
        {
           
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;


            if (!resumeExists)
            {


                sqlCmd.CommandText = "insert into dbo.JobSeeker_Resume(JobSeekerId, fileName) values ('" + userId + "','" + fileName + "')";
                Label1.Text = "inserted:" + fileName;
            }

          else
           {

               sqlCmd.CommandText = "update dbo.JobSeeker_Resume SET fileName = '" + fileName + "' where JobSeekerId='" + userId + "'";
               Label1.Text = "updated:" + fileName;
            }

            myReader = sqlCmd.ExecuteReader();

        }
        catch (Exception ex)
        {
            Console.Out.WriteLine("Exception occured:" + ex.Message);
        }
        finally
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }

    }

   
}