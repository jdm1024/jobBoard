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
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                REQUIREMENTS
            </asp:TableCell >
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                HOW TO APPLY
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
               POSTING DURATION
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>              
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                LOCATION
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                KEYWORDS
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>
               
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                JOB TYPE
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:RadioButtonList id="category"  runat="server"  >
                              <asp:ListItem Text="Full Time" Value="0" Selected="true" />
                              <asp:ListItem Text="Part Time" Value="1" />
                </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                JOB DESCRIPTION
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <textarea id="TextArea1" rows="2" cols="20"></textarea>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow >
            <asp:TableCell HorizontalAlign="Left">
                <input id="Submit1" type="submit" value="submit" />
            </asp:TableCell>
            </asp:TableRow>
    </asp:Table>

</div>
<div class="right_panel">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Add Edit jobs.aspx">ADD / EDIT JOB POSTINGS</asp:HyperLink>
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/view my jobs.aspx">VIEW MY JOB POSTINGS</asp:HyperLink>
        
        <hr />
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    </div>
            

</asp:Content>

