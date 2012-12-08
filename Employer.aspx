<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Employer.aspx.cs" Inherits="Employer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="left_panel">
       <asp:GridView ID="GridView2" runat="server">

       </asp:GridView>

    </div>
    <div class="right_panel">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Add Edit jobs.aspx">ADD / EDIT JOB POSTINGS</asp:HyperLink>
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/view my jobs.aspx">VIEW MY JOB POSTINGS</asp:HyperLink>
        <hr />
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
     
    </div>
            


</asp:Content>

