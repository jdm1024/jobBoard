<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Add Edit jobs.aspx.cs" Inherits="ADD_EDIT_JOB_POSTINGS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="left_panel">                          
            <asp:Label ID="Label1" runat="server" Text="ADD / EDIT JOB POSTING" > </asp:Label>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                JOB TITLE
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtJobtitle" runat="server"></asp:TextBox>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                ROLES / RESPONSIBILITIES
            </asp:TableCell >
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox id="txtResponsibilities" rows="2" width="150px" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                HOW TO APPLY
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:RadioButtonList id="rblHowToApply"  runat="server"  >
                              <asp:ListItem Text="EMAIL" Value="0" Selected="true" />
                              <asp:ListItem Text="Mail" Value="1" />
                    </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
               EXPIRATION DATE
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
                LOCATION
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="ddlocation" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                KEYWORDS
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="ddKeywords" runat="server">
                   
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                JOB TYPE
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="ddJobtype" runat="server">
                   
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                JOB DESCRIPTION
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
        <asp:HyperLink ID="hlAddjobs" runat="server" NavigateUrl="~/Add Edit jobs.aspx">ADD / EDIT JOB POSTINGS</asp:HyperLink>
        
        <asp:HyperLink ID="hlViewjobs" runat="server" NavigateUrl="~/view my jobs.aspx">VIEW MY JOB POSTINGS</asp:HyperLink>
        
        <hr />
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    </div>
            

</asp:Content>

