<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="view my jobs.aspx.cs" Inherits="view_my_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="left_panel">
        <asp:Label ID="Label1" runat="server" Text="Complete Job details" > </asp:Label>
            <asp:Table ID="Table1" width="300px" runat="server">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Company Name
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox width="205px" ReadOnly="true" ID="txtname" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Job Title
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox width="205px" ReadOnly="true" ID="txtjobtitle" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Responsibilities
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox width="205px" ReadOnly="true" ID="txtroles" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Application Method
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtaplmethod" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Post Expires
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtpostexp" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Job Location
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtstate" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Job Type
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtjobtype" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Skills Required
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtskills" ReadOnly="true" rows="2" width="205px" TextMode="MultiLine"  runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Address
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtAddress" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Email ID
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtemail" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Website
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtwebsite" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        Contact Number
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtcontact" ReadOnly="true" width="205px" runat="server"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">                                                  
                            <asp:Button  id="btnEdit" runat="server"  Text="Edit" OnClick="btnEdit_Click"/>                            
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                            <asp:Button  id="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>     
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

