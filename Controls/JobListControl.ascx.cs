using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_FilterControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        jobListDataSource.SelectCommand =
            "SELECT Jobs.description," +
            "Jobs.Id AS jobId," +
            "Jobs.title," +
            "Jobs.responsibilities," +
            "Jobs.expirationDate," +
            "States.longName AS state," +
            "JobType.jobType," +
            "ApplicationMethod.description AS applyDetails " +

            "FROM Jobs INNER JOIN States ON Jobs.stateId = States.Id " +
            "INNER JOIN JobType ON Jobs.jobType = JobType.Id " +
            "INNER JOIN ApplicationMethod ON Jobs.applicationMethodId = ApplicationMethod.Id";
        if (whereClause != null && whereClause.Length > 0)
        {
            jobListDataSource.SelectCommand += whereClause;
        }
        jobsListView.DataBind();
    }

    public string whereClause { get; set; }

    public SqlDataSource controlDataSource { get; set; }
}