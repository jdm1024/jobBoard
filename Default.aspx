<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Controls/FilterControl.ascx" TagPrefix="cs6301" TagName="FilterControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        /**
         * Assumes the base name of the list is the same as the base name of the title
         */
        function animateListTransition() {
            var list_element = document.getElementById(this.id.replace("title", "list"));
            var slideSetting = $(list_element).attr("slide");
            var currentText = $(this).text();

            if (slideSetting == null) {
                $(list_element).slideUp();
                $(list_element).attr("slide", "down");
                $(this).text(currentText.replace("-", "+"));
                if ($(list_element).hasClass("hidden")) {
                    $(list_element).removeAtr("class");
                }
            } else {
                $(list_element).slideDown();
                $(list_element).removeAttr("slide");
                $(this).text(currentText.replace("+", "-"));
            }
        }
        $(document).ready(function () {
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
        <cs6301:FilterControl runat="server" id="FilterControl"/>
    </div>
    <div class="right_panel">
        <div class="filter_control_heading">
            Filter Options
        </div>
        <div class="keyword_category_title" id="languages_title">
            - Programming Languages
        </div>
        <span class="filter_option_list" id="languages_list">
            <asp:CheckBoxList ID="keywordCheckboxList" runat="server" DataSourceID="keywordDataSource" DataTextField="keyword" DataValueField="keyword" AutoPostBack="True" BorderStyle="None">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="keywordDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [keyword] FROM [Keywords]"></asp:SqlDataSource>
        </span>
        <div class="keyword_category_title" id="employers_title">
            + Employers
        </div>
        <span class="filter_option_list hidden" id="employers_list" slide="down">
            <input type="checkbox" checked="checked">Bob's Burgers<br/>
            <input type="checkbox" checked="checked">Earl's Emporium<br/>
            <input type="checkbox" checked="checked">Flashy Bang Stuff!<br/>
            <input type="checkbox" checked="checked">West End Superstore<br/>
            <input type="checkbox" checked="checked">That Place We All Love<br/>
            <input type="checkbox" checked="checked">A Cornerstore<br/>
        </span>
        <div class="keyword_category_title" id="job_type_title">
            + Job Type
        </div>
        <span class="filter_option_list hidden" id="job_type_list" slide="down">
            <asp:CheckBoxList ID="jobTypeCheckboxList" runat="server" DataSourceID="jobTypeDataSource" DataTextField="jobType" DataValueField="jobType" AutoPostBack="True" BorderStyle="None">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="jobTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [jobType] FROM [JobType]"></asp:SqlDataSource>
        </span>
        <div class="keyword_category_title" id="location_title">
            + Location
        </div>
        <span class="filter_option_list hidden" id="location_list" slide="down">
            <asp:CheckBoxList ID="locationCheckboxList" runat="server" DataSourceID="locationDataSource" DataTextField="longName" DataValueField="longName" AutoPostBack="True" BorderStyle="None">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="locationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [longName] FROM [States]"></asp:SqlDataSource>
        </span>
    </div>
</asp:Content>