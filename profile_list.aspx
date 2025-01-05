<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile_list.aspx.cs" Inherits="job_portal.job_list" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job Portal - Student List</title>
    <link rel="stylesheet" type="text/css" href="Styles/profile_list.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Student List - Placement Team</h1>
            <div class="search-bar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" 
                    Placeholder="Search by Name, Email, or Department" 
                    AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" />
            </div>
       <asp:GridView 
    ID="gvStudents" 
    runat="server" 
    CssClass="student-table" 
    AutoGenerateColumns="False" 
    AllowPaging="True" 
    PageSize="10" 
    OnPageIndexChanging="gvStudents_PageIndexChanging" 
    OnRowCommand="gvStudents_RowCommand" OnSelectedIndexChanged="gvStudents_SelectedIndexChanged">
    <RowStyle CssClass="grid-row" />
    <AlternatingRowStyle CssClass="grid-row-alternate" />
    <Columns>
        <asp:ImageField DataImageUrlField="ProfilePicture" HeaderText="Profile Image" ControlStyle-Width="100px" ControlStyle-Height="100px" />
        <asp:BoundField DataField="Dno" HeaderText="ID" />
        <asp:BoundField DataField="FirstName" HeaderText="Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Degree" HeaderText="Degree" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" CssClass="view-profile-btn" CommandName="ViewProfile" CommandArgument='<%# Eval("Dno") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        </div>
    </form>
</body>
</html>
