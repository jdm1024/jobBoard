<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Add jobs.aspx.cs" Inherits="ADD_EDIT_JOB_POSTINGS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="left_panel">                          
            <asp:Label ID="Label1" runat="server" Text="ADD JOB POSTING" > </asp:Label>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Title
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtJobtitle" runat="server"></asp:TextBox>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Roles / Responsibilities
            </asp:TableCell >
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox id="txtResponsibilities" rows="2" width="150px" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                How to apply
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:RadioButtonList id="rblHowToApply"  runat="server"  >
                              <asp:ListItem Text="Email" Value="0" Selected="true" />
                              <asp:ListItem Text="Mail" Value="1" />
                    </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
               Expiration Date
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                   <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">  
    </asp:ToolkitScriptManager>  
      
    <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>  
      
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
                <asp:DropDownList ID="ddlocation" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Keywords
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="ddKeywords" runat="server">
                   
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Type
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="ddJobtype" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                Job Description
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox id="txtJobDescription" rows="2" width="150px" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow >
            <asp:TableCell HorizontalAlign="Left">
                <asp:Button  id="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
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

