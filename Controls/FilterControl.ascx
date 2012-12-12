<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilterControl.ascx.cs" Inherits="Controls_FilterControl" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Jobs.description, Jobs.title, Jobs.responsibilities, Jobs.canApplyOnline, Jobs.expirationDate, States.longName, Jobs.jobType FROM Jobs INNER JOIN States ON Jobs.stateId = States.Id"></asp:SqlDataSource>
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
    <AlternatingItemTemplate>
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
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <span style="">description:
        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
        <br />
        title:
        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
        <br />
        responsibilities:
        <asp:TextBox ID="responsibilitiesTextBox" runat="server" Text='<%# Bind("responsibilities") %>' />
        <br />
        <asp:CheckBox ID="canApplyOnlineCheckBox" runat="server" Checked='<%# Bind("canApplyOnline") %>' Text="canApplyOnline" />
        <br />
        expirationDate:
        <asp:TextBox ID="expirationDateTextBox" runat="server" Text='<%# Bind("expirationDate") %>' />
        <br />
        longName:
        <asp:TextBox ID="longNameTextBox" runat="server" Text='<%# Bind("longName") %>' />
        <br />
        jobType:
        <asp:TextBox ID="jobTypeTextBox" runat="server" Text='<%# Bind("jobType") %>' />
        <br />
        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
        <br />
        <br />
        </span>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <span>No data was returned.</span>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <span style="">description:
        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
        <br />
        title:
        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
        <br />
        responsibilities:
        <asp:TextBox ID="responsibilitiesTextBox" runat="server" Text='<%# Bind("responsibilities") %>' />
        <br />
        <asp:CheckBox ID="canApplyOnlineCheckBox" runat="server" Checked='<%# Bind("canApplyOnline") %>' Text="canApplyOnline" />
        <br />
        expirationDate:
        <asp:TextBox ID="expirationDateTextBox" runat="server" Text='<%# Bind("expirationDate") %>' />
        <br />
        longName:
        <asp:TextBox ID="longNameTextBox" runat="server" Text='<%# Bind("longName") %>' />
        <br />
        jobType:
        <asp:TextBox ID="jobTypeTextBox" runat="server" Text='<%# Bind("jobType") %>' />
        <br />
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
        <br />
        <br />
        </span>
    </InsertItemTemplate>
    <ItemTemplate>
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


