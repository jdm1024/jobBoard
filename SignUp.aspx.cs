using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        
         SqlConnection sqlConn = new SqlConnection();
         SqlDataReader myReader;
         try
         {
             sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
             sqlConn.Open();

             SqlCommand sqlCmd = new SqlCommand();
             sqlCmd.Connection = sqlConn;

             TextBox userName1 =
  (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");

             TextBox password1 =
 (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password");

             DropDownList usertypeList1 =
(DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("userType");
             int employerId = 0;

             if (usertypeList1.SelectedValue.Equals("1"))
             {
                 

                 TextBox companyName1 =   (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("companyName");

                 TextBox address1 =
              (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("address");

                 TextBox phone1 =  (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("phone");
                 TextBox website1 =  (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("website");
                 TextBox email1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email");

                // sqlCmd.CommandText = "insert into employer(companyName, address, phone, email, website) values ('" + companyName1.Text + "', '" + address1.Text + "','" + phone1.Text + "', '" + email1.Text + "','" + website1.Text + "')";
                 sqlCmd.CommandText = "insert into employer(companyName, address, phone, email, website) values ('" + companyName1.Text + "', '" + address1.Text + "','" + phone1.Text + "', '" + email1.Text + "','"+website1.Text+"')";
                 sqlCmd.ExecuteNonQuery();

                 sqlCmd.CommandText = "Select max(Id) from employer";

              //  employerId = Convert.ToInt32(sqlCmd.ExecuteScalar());
               //  employerId = Int32.Parse(sqlCmd.ExecuteScalar());
                 string result = sqlCmd.ExecuteScalar().ToString();
                 employerId = Int32.Parse(result);
             }

            

             sqlCmd.CommandText = "insert into dbo.Login(UserName, pwd, userType, employerId ) values ('" + userName1.Text + "', '"+password1.Text+"', "+usertypeList1.SelectedValue+","+employerId+")";
             sqlCmd.ExecuteNonQuery();
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


    protected void userType_TextChanged(object sender, EventArgs e)
    {

        DropDownList usertypeList1 =
(DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("userType");

        TextBox companyName1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("companyName");

        TextBox address1 =
     (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("address");

        TextBox phone1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("phone");
        TextBox website1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("website");
      

        if (usertypeList1.SelectedValue == "1")
        {
            companyName1.Visible = false;
            address1.Visible = false;
            phone1.Visible = false;
            website1.Visible = false;
        }
    }
    protected void userType_SelectedIndexChanged(object sender, EventArgs e)
    {

        DropDownList usertypeList1 =
(DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("userType");

        TextBox companyName1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("companyName");

        TextBox address1 =
     (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("address");

        TextBox phone1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("phone");
        TextBox website1 = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("website");
        Label label1 = (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Label2");
        Label label2 = (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Label3");
        Label label3 = (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Label4");
        Label label4 = (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Label5");

        if (usertypeList1.SelectedValue == "2")
        {
            companyName1.Visible = false;
            address1.Visible = false;
            phone1.Visible = false;
            website1.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;
            label4.Visible = false;
        }
        else
        {
            companyName1.Visible = true;
            address1.Visible = true;
            phone1.Visible = true;
            website1.Visible = true;
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = true;
            label4.Visible = true;

        }
    }
}