<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_profile.aspx.cs" Inherits="job_portal.view_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Profile View</title>
    <link href="Styles/profile_view.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h2>Your Profile</h2>
        <div class="profile">
            <!-- Profile Picture -->
            <div class="profile-picture">
                <asp:Image ID="imgProfilePicture" runat="server" Width="150px" Height="150px" AlternateText="Profile Picture" />
            </div>
            <div class="profile-details">
                <p><strong>First Name:</strong> <asp:Label ID="lblFirstName" runat="server" /></p>
                <p><strong>Last Name:</strong> <asp:Label ID="lblLastName" runat="server" /></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
                <p><strong>Date of Birth:</strong> <asp:Label ID="lblDOB" runat="server" /></p>
                <p><strong>Degree:</strong> <asp:Label ID="lblDegree" runat="server" /></p>
                <p><strong>University:</strong> <asp:Label ID="lblUniversity" runat="server" /></p>
                <p><strong>Skills:</strong></p>
                <ul id="ulSkills" runat="server" class="skills-list"></ul>
                 <asp:Button ID="edit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="Edit-btn" />
            </div>
        </div>
    </div>
        </form>
</body>
</html>

