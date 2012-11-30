<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilterControl.ascx.cs" Inherits="Controls_FilterControl" %>

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

<div class="filter_control_heading">
    Filter Options
</div>
<div class="keyword_category_title" id="languages_title">
    - Programming Languages
</div>
<span class="filter_option_list" id="languages_list">
    <input type="checkbox" checked="checked">Java<br/>
    <input type="checkbox" checked="checked">PHP<br/>
    <input type="checkbox" checked="checked">C<br/>
    <input type="checkbox" checked="checked">C++<br/>
    <input type="checkbox" checked="checked">Fortan<br/>
    <input type="checkbox" checked="checked">Cobol<br/>
    <input type="checkbox" checked="checked">C#<br/>
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
    <input type="checkbox" checked="checked">Full Time<br/>
    <input type="checkbox" checked="checked">Part Time<br/>
    <input type="checkbox" checked="checked">Internship<br/>
</span>
<div class="keyword_category_title" id="location_title">
    + Location
</div>
<span class="filter_option_list hidden" id="location_list" slide="down">
    <input type="checkbox" checked="checked">Dallas<br/>
    <input type="checkbox" checked="checked">Houston<br/>
    <input type="checkbox" checked="checked">San Antonio<br/>
</span>