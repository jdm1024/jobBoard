<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="view my jobs.aspx.cs" Inherits="view_my_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="left_panel">
    View my jobs code goes here...!
    </div>
            
    <div class="right_panel">
       <a>
           <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EmployerPage/Add jobs.aspx">Add Job Postings</asp:HyperLink>
           <br/>
           <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/EmployerPage/Edit jobs.aspx">Edit Job Postings</asp:HyperLink>
           <br/>
           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EmployerPage/view my jobs.aspx">View My Job Postings</asp:HyperLink>
           <hr />
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>  
       </a>
    </div>
</asp:Content>

