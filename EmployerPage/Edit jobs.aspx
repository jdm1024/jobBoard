<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Edit jobs.aspx.cs" Inherits="Edit_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div class="left_panel">             
              <link href="../Styles/Employer.css" rel="stylesheet" type="text/css" />             
            <asp:Label ID="Label1" runat="server" Text="Edit job postings" > </asp:Label>
    <asp:Table ID="Table1" runat="server">
         <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Enter job Id
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtJobId" width="205px" runat="server"></asp:TextBox>      
            </asp:TableCell>
           <asp:TableCell HorizontalAlign="Left">
                <asp:Button  id="btnRetrieve" runat="server" Text="Retrieve" OnClick="btnRetrieve_Click"/>     
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Title
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtJobtitle" width="205px" runat="server"></asp:TextBox>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Roles / Responsibilities
            </asp:TableCell >
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox id="txtResponsibilities" rows="2" width="205px" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
               Expiration Date
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                   <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">  
    </asp:ToolkitScriptManager>  
      
    <asp:TextBox ID="txtStartDate" width="205px" runat="server"></asp:TextBox>  
      
    <asp:CalendarExtender   
        ID="CalendarExtender1"   
        TargetControlID="txtStartDate"   
        runat="server" />             
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Location
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList width="210px" ID="ddlocation" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Keywords
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList width="210px" ID="ddKeywords" runat="server">
                   
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Type
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList width="210px" ID="ddJobtype" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Description
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox id="txtJobDescription" width="205px" rows="2" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow >
            <asp:TableCell HorizontalAlign="Left">
                <asp:Button  id="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
            </asp:TableCell>
            </asp:TableRow>
    </asp:Table>

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

