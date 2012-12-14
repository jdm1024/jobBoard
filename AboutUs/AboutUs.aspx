<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Welcome to the SE Job Boards!</h1>
    <div class="about_us_pages">
        <p>
            The SE (Software Engineering) Job Board is a job database intended to connect qualified job seekers with exciting employers.
        </p>
        <p>
            While our current feature set is rather minimal, we invite you to search through the posted jobs using the filters available 
            on our main page. These filters will allow you to limit the shown results to only the jobs which fit your interests whether 
            those intrests are a certain programming language, a specific location, an impressive employer, or any combination of the
            available options.
        </p>
        <p>
            We also offer both job seekers and employers the oportunity to create accounts and log into our site with their credentials. 
            After registering, employers will be able to post jobs as well as view, edit, and delete the jobs they have posted.
            Registered job seekers will be able to store their resume digitally so it won't go missing when it is needed the most.
        </p>
        <p>
            To contact us about exciting opportunities, problems with the page, or any other concerns, please email us at 
            thisisafakeemail@notarealplace.com or visit our headquarters at 33333 nowhere ave. Noplace TX, 75888.
        </p>
        <a href="Feedback.aspx" class="underline">Additional feedback details.</a><br />
        <a href="Help.aspx" class="underline">Additional help.</a><br />
        <a href="TermsAndConditions.aspx" class="underline">Terms and conditions.</a><br />
        <a href="PrivacyPolicy.aspx" class="underline">Terms and conditions.</a>
    </div>
</asp:Content>

