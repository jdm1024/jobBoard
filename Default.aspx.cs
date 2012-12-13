using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            generateListFilter();
        }
    }

    /**
     * Checks every dynamically created member of the checkbox list on the user's
     * first visit to the site.
     */
    protected void checkAllBoxes(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var sendingCheckboxList = (CheckBoxList)sender;
            for (int i = 0; i < sendingCheckboxList.Items.Count; i++)
            {
                sendingCheckboxList.Items[i].Selected = true;
            }
        }
    }

    /**
     * Iterates over the checkbox list which was changed and updates the list
     * of items to exclude from the database results.
     */
    protected void generateListFilter()
    {
        var updatedFilter = " WHERE ";
        var isUsingFilter = false;
        //Exclude the locations which are unchecked
        for (int i = 0; i < locationCheckboxList.Items.Count; i++)
        {
            if (locationCheckboxList.Items[i].Selected == false)
            {
                isUsingFilter = true;
                updatedFilter += "States.longName != '" + locationCheckboxList.Items[i].Text + "'";
            }
        }

        if (isUsingFilter)
        {
            jobListControl.whereClause = updatedFilter;
        }
        else
        {
            jobListControl.whereClause = null;
        }
    }
}