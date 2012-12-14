<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JobListControl.ascx.cs" Inherits="Controls_FilterControl" %>

<asp:SqlDataSource ID="jobListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
<asp:ListView ID="jobsListView" runat="server" DataSourceID="jobListDataSource">
    <EmptyDataTemplate>
        <span>No matching jobs were found in the database.</span>
    </EmptyDataTemplate>
    <ItemTemplate>
        <div class="job_item">
            <span class="darker_background">
            <asp:Label ID="Label2" runat="server" Text="Job Title:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") + " (" + Eval("jobType") + ")" %>' />
            </span>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Desired Skills:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text='<%# Eval("skillNames") %>' />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Responsibilities:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="responsibilitiesLabel" runat="server" Text='<%# Eval("responsibilities") %>' />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Employer:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="jobTypeLabel" runat="server" Text='<%# Eval("employer") %>' />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Location:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="canApplyOnlineLabel" runat="server" Text='<%# Eval("state") + " (" + Eval("applyDetails") + ")" %>' />
            <br />
            <div class="job_item_link_area">
                <asp:Button ID="viewJobButton" runat="server" Text="View Job" CausesValidation="False" PostBackUrl='<%#"~/EmployerPage/Edit jobs.aspx?jobId="+Eval("jobId")%>' CssClass="job_item_link" />
            </div>
        </div>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
</asp:ListView>
