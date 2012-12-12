<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JobListControl.ascx.cs" Inherits="Controls_FilterControl" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Jobs.description, Jobs.title, Jobs.responsibilities, Jobs.canApplyOnline, Jobs.expirationDate, States.longName, Jobs.jobType FROM Jobs INNER JOIN States ON Jobs.stateId = States.Id"></asp:SqlDataSource>
<asp:ListView ID="jobsListView" runat="server" DataSourceID="SqlDataSource1">
    <EmptyDataTemplate>
        <span>No jobs were found in the database.</span>
    </EmptyDataTemplate>
    <ItemTemplate>
        <div class="job_item">
            <asp:Label ID="Label1" runat="server" Text="Description:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Job Title:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Responsibilities:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="responsibilitiesLabel" runat="server" Text='<%# Eval("responsibilities") %>' />
            <br />
            <asp:CheckBox ID="canApplyOnlineCheckBox" runat="server" Checked='<%# Eval("canApplyOnline") %>' Enabled="false" Text="canApplyOnline" />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Post expires:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="expirationDateLabel" runat="server" Text='<%# Eval("expirationDate") %>' />
            <br />
            <asp:Label ID="Label5" runat="server" Text="State:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="longNameLabel" runat="server" Text='<%# Eval("longName") %>' />
            <br />
            <asp:Label ID="Label6" runat="server" Text="jobType:" CssClass="job_item_label"></asp:Label>
            <asp:Label ID="jobTypeLabel" runat="server" Text='<%# Eval("jobType") %>' />
            <br />
        </div>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <span style="">description:
        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
        <br />
        title:
        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
        <br />
        responsibilities:
        <asp:Label ID="responsibilitiesLabel" runat="server" Text='<%# Eval("responsibilities") %>' />
        <br />
        <asp:CheckBox ID="canApplyOnlineCheckBox" runat="server" Checked='<%# Eval("canApplyOnline") %>' Enabled="false" Text="canApplyOnline" />
        <br />
        expirationDate:
        <asp:Label ID="expirationDateLabel" runat="server" Text='<%# Eval("expirationDate") %>' />
        <br />
        longName:
        <asp:Label ID="longNameLabel" runat="server" Text='<%# Eval("longName") %>' />
        <br />
        jobType:
        <asp:Label ID="jobTypeLabel" runat="server" Text='<%# Eval("jobType") %>' />
        <br />
        <br />
        </span>
    </SelectedItemTemplate>
</asp:ListView>


