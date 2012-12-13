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

             sqlCmd.CommandText = "insert into dbo.Login(UserName, pwd, userType ) values ('" + userName1.Text + "', '"+password1.Text+"', "+usertypeList1.SelectedValue+")";
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
   
  
}