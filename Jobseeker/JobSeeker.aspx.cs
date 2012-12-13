using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class JobSeeker : System.Web.UI.Page
{
    private static Boolean jobSeekerExists = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!((Page)System.Web.HttpContext.Current.CurrentHandler).IsPostBack)
        {
           
            bind();
            Session["userId"] = userId.Value;
           
        }

        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex--;
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if(!jobSeekerValidate())
             MultiView1.ActiveViewIndex++;
    }
    protected override void OnPreRender(EventArgs e)
    {

        btnBack.Visible = MultiView1.ActiveViewIndex > 0;
        btnNext.Visible = MultiView1.ActiveViewIndex < MultiView1.Views.Count - 1;
        btnSend.Visible = MultiView1.ActiveViewIndex == MultiView1.Views.Count - 1;
        base.OnPreRender(e);
    }

    public void ConnnectDB()
    {
        SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader = null;
        try
        {
           
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;


            if (!jobSeekerExists)
            {

                
               sqlCmd.CommandText = "insert into dbo.JobSeeker(Id, firstName, middleName, lastName, email, currentAddress, currentState, zipCode, phone, nationality) values ('" + userId.Value + "','" + firstName.Text + "','" + middleName.Text + "','" + lastName.Text + "','" + email.Text + "','" + currentAddress.Text + "' , '" + currentState.SelectedValue + "', '" + zipCode.Text + "', '" + phone.Text + "', '" + nationality.Text + "')";
           }

          else
           {

                sqlCmd.CommandText = "update dbo.JobSeeker SET firstName = '" + firstName.Text + "', middleName = '" + middleName.Text + "', lastName = '" + lastName.Text + "', currentAddress = '" + currentAddress.Text + "', currentState = '" + currentState.SelectedValue + "', zipCode = '" + zipCode.Text + "', phone = '" + phone.Text + "', nationality = '" + nationality.Text + "', email = '" + email.Text + "' where Id='" + userId.Value + "'";
            }
          //  sqlCmd.CommandText = "update dbo.JobSeeker SET firstName = 'a', middleName = 'b', lastName = 'c', currentAddress = 'd', currentState = 'e', zipCode = 'f', phone = 'g', nationality = 'h', email = 'i'";
           // sqlCmd.CommandText = "update dbo.JobSeeker SET firstName = '" + firstName.Text + "', middleName = '" + middleName.Text + "', lastName = '" + lastName.Text + "', currentAddress = '" + currentAddress.Text + "', currentState = '" + currentState.SelectedValue + "', zipCode = '" + zipCode.Text + "', phone = '" + phone.Text + "', nationality = '" + nationality.Text + "', email = '" + email.Text + "' where Id='" + userId.Value + "'";
   
            sqlCmd.ExecuteNonQuery();

            saveJobSeekerSkills();

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




    protected void btnSend_Click(object sender, EventArgs e)
    {
       
        ConnnectDB();
       
    }

    protected void bind()
    {
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


            //sqlCmd.CommandText = "insert into dbo.JobSeeker(firstName, middleName, lastName, email, currentAddress, currentState, zipCode, phone, nationality) values ('a','b','c','d','e','f','g','h','i')";
            sqlCmd.CommandText = "select firstName, middleName, lastName, email, currentAddress, currentState, zipCode, phone, nationality from dbo.JobSeeker where Id='"+userId.Value+"'";

            myReader = sqlCmd.ExecuteReader();
   
           
            while(myReader.Read())
            {
                jobSeekerExists = true;
                firstName.Text = myReader.GetString(0).Trim();
                middleName.Text = myReader.GetString(1).Trim();
                lastName.Text = myReader.GetString(2).Trim();
                email.Text = myReader.GetString(3).Trim();
                currentAddress.Text = myReader.GetString(4).Trim();
               // currentState.SelectedValue = myReader.GetInt32(5) + "";
                zipCode.Text = myReader.GetString(6).Trim();
                phone.Text = myReader.GetString(7).Trim();
                nationality.Text = myReader.GetString(8).Trim();
            }

           

            getJobSeekerSkills();
            

            firstName.DataBind();
            middleName.DataBind();
            lastName.DataBind();
            email.DataBind();
            currentAddress.DataBind();
            currentState.DataBind();
            zipCode.DataBind();
            phone.DataBind();
            nationality.DataBind();

           
            
          
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

    protected void btnMoveRight_Click(object sender, EventArgs e)
    {
        for (int i = coursesList.Items.Count - 1; i >= 0; i--)
        {
            if (coursesList.Items[i].Selected == true)
            {
                ListBox2.Items.Add(coursesList.Items[i]);
                ListItem li = coursesList.Items[i];
                coursesList.Items.Remove(li);
            }
        }

    }
    protected void btnMoveLeft_Click(object sender, EventArgs e)
    {
        for (int i = ListBox2.Items.Count - 1; i >= 0; i--)
        {
            if (ListBox2.Items[i].Selected == true)
            {
                coursesList.Items.Add(ListBox2.Items[i]);
                ListItem li = ListBox2.Items[i];
                ListBox2.Items.Remove(li);
            }
        }

    }

    protected void getJobSeekerSkills()
    {
        getJobSeekerCourses();
        getJobSeekerLanguages();
        getJobSeekerSoftwares();
       
    }

    protected void getJobSeekerCourses()
    {
        SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader;


        try
        {
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            sqlCmd.CommandText = "select S.SkillsId, S.name from dbo.JobSeeker_Skills JS,dbo.Skills S where JS.SkillsId = S.SkillsId AND S.type='C' AND JS.JobSeekerId='" + userId.Value + "'";

            myReader = sqlCmd.ExecuteReader();
            coursesList.DataBind();


            ListItem newItem = new ListItem();
            while (myReader.Read())
            {
                newItem = new ListItem(myReader.GetString(1).Trim(), myReader.GetString(0).Trim());
                ListBox2.Items.Add(newItem);
                for (int i = coursesList.Items.Count - 1; i >= 0; i--)
                {
                    ListItem li = coursesList.Items[i];

                    if (li.Value.Equals(myReader.GetString(0)))
                    {
                        coursesList.Items.Remove(li);
                    }
                }
            }

            ListBox2.DataBind();

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


    protected void getJobSeekerLanguages()
    {

        SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader;


        try
        {
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            sqlCmd.CommandText = "select S.SkillsId, S.name from dbo.JobSeeker_Skills JS,dbo.Skills S where JS.SkillsId = S.SkillsId AND S.type='L' AND JS.JobSeekerId='" + userId.Value + "'";

            myReader = sqlCmd.ExecuteReader();
            languagesList.DataBind();


            ListItem newItem = new ListItem();
            while (myReader.Read())
            {
                newItem = new ListItem(myReader.GetString(1).Trim(), myReader.GetString(0).Trim());
                languagesSelectedList.Items.Add(newItem);
                for (int i = languagesList.Items.Count - 1; i >= 0; i--)
                {
                    ListItem li = languagesList.Items[i];

                    if (li.Value.Equals(myReader.GetString(0)))
                    {
                        languagesList.Items.Remove(li);
                    }
                }
            }

            languagesSelectedList.DataBind();

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

    protected void getJobSeekerSoftwares()
    {
        SqlConnection sqlConn = new SqlConnection();
        SqlDataReader myReader;


        try
        {
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            sqlCmd.CommandText = "select S.SkillsId, S.name from dbo.JobSeeker_Skills JS,dbo.Skills S where JS.SkillsId = S.SkillsId AND S.type='S' AND JS.JobSeekerId='" + userId.Value + "'";

            myReader = sqlCmd.ExecuteReader();
            softwaresList.DataBind();


            ListItem newItem = new ListItem();
            while (myReader.Read())
            {
                
                newItem = new ListItem(myReader.GetString(1).Trim(), myReader.GetString(0).Trim());
                softwaresSelectedList.Items.Add(newItem);
                for (int i = softwaresList.Items.Count - 1; i >= 0; i--)
                {
                    ListItem li = softwaresList.Items[i];

                    if (li.Value.Equals(myReader.GetString(0)))
                    {
                        softwaresList.Items.Remove(li);
                    }
                }
            }

            softwaresSelectedList.DataBind();

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


    protected void saveJobSeekerSkills()
    {
        SqlConnection sqlConn = new SqlConnection();
        try
        {
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            sqlConn.Open();

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;

            sqlCmd.CommandText = "delete from JobSeeker_Skills where JobSeekerId='" + userId.Value +"'";

            sqlCmd.ExecuteNonQuery();

            for(int i = ListBox2.Items.Count - 1; i >= 0; i--)
            {
                ListItem li = ListBox2.Items[i];
                sqlCmd.CommandText = "insert into dbo.JobSeeker_Skills(JobSeekerId,SkillsId) values ('" + userId.Value + "', '" + li.Value + "')";
                sqlCmd.ExecuteNonQuery();
            }
            for (int i = languagesSelectedList.Items.Count - 1; i >= 0; i--)
            {
                ListItem li = languagesSelectedList.Items[i];
                sqlCmd.CommandText = "insert into dbo.JobSeeker_Skills(JobSeekerId,SkillsId) values ('" + userId.Value + "', '" + li.Value + "')";
                sqlCmd.ExecuteNonQuery();
            }
            for (int i = softwaresSelectedList.Items.Count - 1; i >= 0; i--)
            {
                ListItem li = softwaresSelectedList.Items[i];
                sqlCmd.CommandText = "insert into dbo.JobSeeker_Skills(JobSeekerId,SkillsId) values ('" + userId.Value + "', '" + li.Value + "')";
                sqlCmd.ExecuteNonQuery();
            }
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

        for (int i = languagesList.Items.Count - 1; i >= 0; i--)
        {
            if (languagesList.Items[i].Selected == true)
            {
                languagesSelectedList.Items.Add(languagesList.Items[i]);
                ListItem li = languagesList.Items[i];
                languagesList.Items.Remove(li);
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        for (int i = languagesSelectedList.Items.Count - 1; i >= 0; i--)
        {
            if (languagesSelectedList.Items[i].Selected == true)
            {
                languagesList.Items.Add(languagesSelectedList.Items[i]);
                ListItem li = languagesSelectedList.Items[i];
                languagesSelectedList.Items.Remove(li);
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        for (int i = softwaresList.Items.Count - 1; i >= 0; i--)
        {
            if (softwaresList.Items[i].Selected == true)
            {
                softwaresSelectedList.Items.Add(softwaresList.Items[i]);
                ListItem li = softwaresList.Items[i];
                softwaresList.Items.Remove(li);
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        for (int i = softwaresSelectedList.Items.Count - 1; i >= 0; i--)
        {
            if (softwaresSelectedList.Items[i].Selected == true)
            {
                softwaresList.Items.Add(ListBox2.Items[i]);
                ListItem li = softwaresSelectedList.Items[i];
                softwaresSelectedList.Items.Remove(li);
            }
        }
    }

    public bool jobSeekerValidate()
    {
        bool isError = false;
        errorMessage.Text = "Please enter ";
        if ("".Equals(firstName.Text))
        {
            isError = true;
            errorMessage.Text = errorMessage.Text + "First Name";
        }
        if ("".Equals(lastName.Text))
        {
            if (isError == true)
            {
                errorMessage.Text = errorMessage.Text + ", Last Name";
            }
            else
            {
                isError = true;
                errorMessage.Text = errorMessage.Text + "Last Name";
            }
        }
        if ("".Equals(email.Text))
        {
            if (isError == true)
            {
                errorMessage.Text = errorMessage.Text + ", E-mail";
            }
            else
            {
                isError = true;
                errorMessage.Text = errorMessage.Text + "E-mail";
            }
        }
        return isError;
        
      
    }
}