<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<%@ Register Src="~/Controls/JobListControl.ascx" TagPrefix="cs6301" TagName="FilterControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        /**
         * Assumes there are no extra - characters in the text of group headings
         */
        function animateListTransition() {
            var list_element = $(this).next();
            var currentText = $(this).text();

            if (currentText.search("-") > -1) {
                $(list_element).slideUp();
                $(this).text(currentText.replace("-", "+"));
                $(this).prev().val('true');
            } else {
                $(list_element).slideDown();
                $(this).text(currentText.replace("+", "-"));
                $(this).prev().val('false');
            }
        }

        /**
         * Maintain the state of the expanded and contracted filter lists
         */
        $(document).ready(function () {
            var title;

            if ($('#<%= isLanguagesHiddenField.ClientID %>').val() == 'true') {
                title = $("#languages_title");
                title.text(title.text().replace("-", "+"));
                title.next().addClass('hidden');
            }
            if ($('#<%= isEmployersHiddenField.ClientID %>').val() == 'true') {
                title = $("#employers_title");
                title.text(title.text().replace("-", "+"));
                title.next().hide();
            }
            if ($('#<%= isJobTypeHiddenField.ClientID %>').val() == 'true') {
                title = $("#job_type_title");
                title.text(title.text().replace("-", "+"));
                title.next().hide();
            }
            if ($('#<%= isLocationhiddenField.ClientID %>').val() == 'true') {
                title = $("#location_title");
                title.text(title.text().replace("-", "+"));
                title.next().hide();
            }

            $("#languages_title").click(animateListTransition);
            $("#employers_title").click(animateListTransition);
            $("#job_type_title").click(animateListTransition);
            $("#location_title").click(animateListTransition);
        }
        );
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="left_panel">
        <cs6301:FilterControl runat="server" id="jobListControl"/>
    </div>
    <div class="right_panel">
        <div class="filter_control_heading">
            Filter Options
        </div>
        <asp:HiddenField ID="isLanguagesHiddenField" runat="server" ViewStateMode="Enabled" Value="false" />
        <div class="keyword_category_title" id="languages_title">
            - Programming Languages
        </div>
        <span class="filter_option_list" id="languages_list">
            <asp:CheckBoxList ID="keywordCheckboxList" runat="server" DataSourceID="keywordDataSource" DataTextField="name" DataValueField="name" AutoPostBack="True" BorderStyle="None" OnDataBound="checkAllBoxes">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="keywordDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [Skills] WHERE ([type] = @type)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="L" Name="type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </span>

        <asp:HiddenField ID="isEmployersHiddenField" runat="server" ViewStateMode="Enabled" Value="true" />
        <div class="keyword_category_title" id="employers_title">
            - Employers
        </div>
        <span class="filter_option_list" id="employers_list">
            <asp:CheckBoxList ID="employersCheckboxList" runat="server" AutoPostBack="True" DataSourceID="employersCheckboxListSqlDataSource" DataTextField="companyName" DataValueField="companyName" OnDataBound="checkAllBoxes">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="employersCheckboxListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employer]"></asp:SqlDataSource>
        </span>
        
        <asp:HiddenField ID="isJobTypeHiddenField" runat="server" ViewStateMode="Enabled" Value="true" />
        <div class="keyword_category_title" id="job_type_title">
            - Job Type
        </div>
        <span class="filter_option_list" id="job_type_list">
            <asp:CheckBoxList ID="jobTypeCheckboxList" runat="server" DataSourceID="jobTypeDataSource" DataTextField="jobType" DataValueField="jobType" AutoPostBack="True" BorderStyle="None" OnDataBound="checkAllBoxes">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="jobTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [jobType] FROM [JobType]"></asp:SqlDataSource>
        </span>
        
        <asp:HiddenField ID="isLocationhiddenField" runat="server" ViewStateMode="Enabled" Value="true" />
        <div class="keyword_category_title" id="location_title">
            - Location
        </div>
        <span class="filter_option_list" id="location_list">
            <asp:CheckBoxList ID="locationCheckboxList" runat="server" DataSourceID="locationDataSource" DataTextField="longName" DataValueField="longName" AutoPostBack="True" BorderStyle="None" OnDataBound="checkAllBoxes">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="locationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [longName] FROM [States]"></asp:SqlDataSource>
        </span>
    </div>
</asp:Content>