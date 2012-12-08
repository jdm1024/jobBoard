<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Controls/FilterControl.ascx" TagPrefix="cs6301" TagName="FilterControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="left_panel">
        This is where the jobs go.
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="responsibilities" HeaderText="responsibilities" SortExpression="responsibilities" />
                <asp:CheckBoxField DataField="canApplyOnline" HeaderText="canApplyOnline" SortExpression="canApplyOnline" />
                <asp:BoundField DataField="expirationDate" HeaderText="expirationDate" SortExpression="expirationDate" />
                <asp:BoundField DataField="stateId" HeaderText="stateId" SortExpression="stateId" />
                <asp:BoundField DataField="jobType" HeaderText="jobType" SortExpression="jobType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Jobs]"></asp:SqlDataSource>
    </div>
    <div class="right_panel">
        <cs6301:FilterControl runat="server" id="FilterControl"/>
    </div>
</asp:Content>