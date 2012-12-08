<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Controls/FilterControl.ascx" TagPrefix="cs6301" TagName="FilterControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="left_panel">
        This is where the jobs go.
    </div>
    <div class="right_panel">
        <cs6301:FilterControl runat="server" id="FilterControl"/>
        <a href="Default.aspx">Default.aspx</a>
    </div>
</asp:Content>

