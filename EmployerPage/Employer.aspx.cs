using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Employer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string loggedinuser = null;
        MembershipUser membershipUser = Membership.GetUser();
        if (membershipUser != null)
        {
            loggedinuser = Membership.GetUser().ToString();
        }

        if (loggedinuser == null || "".Equals(loggedinuser))
        {
            Response.Redirect("../Login.aspx");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}