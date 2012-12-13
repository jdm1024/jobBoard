<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:LoginView runat="server">
      <LoggedInTemplate>
          You are already logged in!
          <asp:LoginStatus ID="LoginStatus1" runat="server" />
      </LoggedInTemplate>
     <AnonymousTemplate>
<asp:Login ID="Login1" CreateUserText="Sign Up!"  CreateUserUrl="~/SignUp.aspx" runat="server"></asp:Login>
         </AnonymousTemplate>
   </asp:LoginView>
     
</asp:Content>