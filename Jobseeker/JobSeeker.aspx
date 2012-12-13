<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="JobSeeker.aspx.cs" Inherits="JobSeeker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="left_panel">
    
    <link href="../Styles/JobSeeker.css" rel="stylesheet" type="text/css" />
   
   
         <asp:Table ID="Table0" runat="server">

              <asp:TableRow>
                   <asp:TableCell >
                       
       <asp:HiddenField ID="userId"  Value="99" runat="server" />
		<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
              
             <asp:View ID="View1" runat="server"  > 
                
                  <asp:Table ID="Table1" runat="server" >
                         
                 <asp:TableRow>
                       
                          <asp:TableCell  CssClass="infoHeader" ColumnSpan ="2"> Personal Information </asp:TableCell>
                          
                      </asp:TableRow>

                      <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">First Name  <asp:Label ID="Label1" CssClass="error" runat="server" Text="(*)"></asp:Label> </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="firstName" runat="server" ></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">Middle Name </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="middleName" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell">Last Name <asp:Label ID="Label2" CssClass="error" runat="server" Text="(*)"></asp:Label> </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="lastName" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell">E-mail <asp:Label ID="Label3" CssClass="error" runat="server" Text="(*)"></asp:Label> </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="email" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell">Current Address </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="currentAddress" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell">Current State </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                              <asp:DropDownList ID="currentState" runat="server"  DataValueField="Id" DataTextField="longName" DataSourceID="SqlDataSource5"  Width="100">
                   
                </asp:DropDownList>
                          </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">ZIP code </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="zipCode" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell" >Phone </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="phone" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       <asp:TableRow>
                          <asp:TableCell CssClass="TableCell" >Nationality </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:TextBox ID="nationality" runat="server"></asp:TextBox></asp:TableCell>
                      </asp:TableRow>
                       
                      <asp:TableRow>
                          <asp:TableCell ColumnSpan="2"><asp:Label runat="server" CssClass="error" ID="generalError" Text="(*) Fields are mandatory"></asp:Label></asp:TableCell></asp:TableRow>
                          <asp:TableRow>
                          
                            <asp:TableCell ColumnSpan="2">
                               <asp:Label runat="server" CssClass="error" ID="errorMessage"></asp:Label>  
                               </asp:TableCell>
                      </asp:TableRow>

                   </asp:Table>
                                    

            </asp:View>
           
               <asp:View ID="View2" runat="server" > 
              
                  <asp:Table ID="Table2" runat="server"   CssClass="table">
                     
                         <asp:TableRow>
                          <asp:TableCell ColumnSpan ="2" CssClass="infoHeader"> Skills and Qualifications  </asp:TableCell>
                          
                      </asp:TableRow>

                        <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">Courses known </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            <asp:ListBox CssClass="myListBox" ID="coursesList" runat="server" SelectionMode="Multiple" DataValueField="SkillsId" DataTextField="name"  DataSourceID="SqlDataSource2"></asp:ListBox>
                         
			<asp:Button Runat="server" ID="btnMoveRight" Text=" >> " OnClick="btnMoveRight_Click"></asp:Button>
			<asp:Button Runat="server" ID="btnMoveLeft" Text=" <<" OnClick="btnMoveLeft_Click"></asp:Button>
			<asp:ListBox Runat="server" ID="ListBox2" SelectionMode="Multiple" CssClass="myListBox"></asp:ListBox>
                            
                          </asp:TableCell>
                      </asp:TableRow>

                       <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">Languages known </asp:TableCell>
                          <asp:TableCell CssClass="TableCell">
                            
             <asp:ListBox ID="languagesList" runat="server" SelectionMode="Multiple" DataValueField="SkillsId" DataTextField="name"  DataSourceID="SqlDataSource3" CssClass="myListBox"></asp:ListBox>
                         
			<asp:Button Runat="server" ID="Button1" Text=" >> " OnClick="Button1_Click"></asp:Button>
			<asp:Button Runat="server" ID="Button2" Text=" <<" OnClick="Button2_Click"></asp:Button>
			<asp:ListBox Runat="server" ID="languagesSelectedList" SelectionMode="Multiple" CssClass="myListBox"></asp:ListBox>
                              </asp:TableCell>
                      </asp:TableRow>   

                        <asp:TableRow>
                          <asp:TableCell  CssClass="TableCell">Software/ Tools Used </asp:TableCell>
                          <asp:TableCell>
                            
                                <asp:ListBox ID="softwaresList" runat="server" SelectionMode="Multiple" DataValueField="SkillsId" DataTextField="name"  DataSourceID="SqlDataSource4" CssClass="myListBox"></asp:ListBox>
                         
			<asp:Button Runat="server" ID="Button3" Text=" >> " OnClick="Button3_Click"></asp:Button>
			<asp:Button Runat="server" ID="Button4" Text=" <<" OnClick="Button4_Click"></asp:Button>
			<asp:ListBox Runat="server" ID="softwaresSelectedList" SelectionMode="Multiple" CssClass="myListBox"></asp:ListBox>
           

                          </asp:TableCell>
                      </asp:TableRow>

                      </asp:Table>
                 </asp:View>

          
	</asp:MultiView>
</asp:TableCell>
                  </asp:TableRow>
             
             <asp:TableRow>  
                 <asp:TableCell HorizontalAlign="Left">       
         <asp:Button ID="btnBack" runat="server" Text="&lt; Back" OnClick="btnBack_Click" CssClass="buttonClass" />
		<asp:Button ID="btnNext" runat="server" Text="Next &gt;" OnClick="btnNext_Click" ViewStateMode="Enabled" CssClass="buttonClass" />	
		<asp:Button ID="btnSend" runat="server" Text="Save" onClick="btnSend_Click"  CssClass="buttonClass"/>
                     </asp:TableCell>
                 </asp:TableRow>

             </asp:Table>
       
           </div>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SkillsId],[name] FROM [Skills] WHERE ([type] = @type)">
        <SelectParameters>
            <asp:Parameter DefaultValue="L" Name="type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
   
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SkillsId],[name] FROM [Skills] WHERE ([type] = @type)">
        <SelectParameters>
            <asp:Parameter DefaultValue="C" Name="type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SkillsId],[name] FROM [Skills] WHERE ([type] = @type)">
        <SelectParameters>
            <asp:Parameter DefaultValue="S" Name="type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id],[longName] FROM [States] ">
    </asp:SqlDataSource>

     <div class="right_panel">
         <a>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Jobseeker/JobSeekerResume.aspx">My Resume</asp:HyperLink>
     </a>
    </div>

</asp:Content>


