using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_OnLoad(object sender, EventArgs e)
    {

    }

    protected void checkAllBoxes(object sender, EventArgs e)
    {
        var sendingCheckboxList = (CheckBoxList)sender;
        if (!Page.IsPostBack)
        {
            for (int i = 0; i < sendingCheckboxList.Items.Count; i++)
            {
                sendingCheckboxList.Items[i].Selected = true;
            }
        }
    }
}