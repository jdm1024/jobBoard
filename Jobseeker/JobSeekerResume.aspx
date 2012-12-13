<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="JobSeekerResume.aspx.cs" Inherits="JobSeekerResume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Table runat="server" >  
        <asp:TableRow>   <asp:TableCell CssClass="infoHeader" HorizontalAlign="Center">        My Resume </asp:TableCell>
                 
                   </asp:TableRow>
        <asp:TableRow>   <asp:TableCell CssClass="TableCell" HorizontalAlign="Center"> 
                 <asp:FileUpload ID="FileUpload1" runat="server"  /></asp:TableCell></asp:TableRow>

<asp:TableRow>   <asp:TableCell  CssClass="TableCell" HorizontalAlign="Center">     <asp:Label ID="Label1" runat="server" ></asp:Label></asp:TableCell></asp:TableRow>
   

   <asp:TableRow>   <asp:TableCell  CssClass="buttonClass" HorizontalAlign="Center">  <asp:Button ID="save" runat="server" Text="Save"  OnClick="Button1_Click" CssClass="buttonClass"/>
       </asp:TableCell></asp:TableRow>

    <asp:TableRow>   <asp:TableCell> <asp:Button ID="download" runat="server" Text="Download"  OnClick="Button2_Click"/>
        </asp:TableCell></asp:TableRow>
        </asp:Table>

</asp:Content>

