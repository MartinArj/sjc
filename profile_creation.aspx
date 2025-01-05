<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile_creation.aspx.cs" Inherits="job_portal.profile_creation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Create Profile</title>
    <link href="Styles/profile.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        // <![CDATA[
        // Function to show the selected image
        function previewImage() {
            var fileInput = document.getElementById('<%= fileProfilePicture.ClientID %>');
            var imgPreview = document.getElementById('<%= imgProfilePicture.ClientID %>');
            var file = fileInput.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                imgPreview.src = e.target.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        }
        // ]]>
    </script>
</head>
<body>
    <div class="container">
        <h2>Create Your Profile</h2>
        <form id="form1" runat="server">
            <div>
                <!-- D.no -->
                <asp:Label ID="lb1" runat="server" Text="D.no" AssociatedControlID="Dno" />
                <asp:TextBox ID="Dno" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Dno" 
                    ErrorMessage="D.no is required." 
                    ForeColor="Red" />
                <br />

                <!-- First Name -->
                <asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" />
                <asp:TextBox ID="txtFirstName" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ControlToValidate="txtFirstName" 
                    ErrorMessage="First Name is required." 
                    ForeColor="Red" />
                <br />

                <!-- Last Name -->
                <asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName" />
                <asp:TextBox ID="txtLastName" runat="server" />
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" 
                    ErrorMessage="Last Name is required." 
                    ForeColor="Red" />
                <br />

                <!-- Email -->
                <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" />
                <asp:TextBox ID="txtEmail" runat="server" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    ErrorMessage="Email is required." 
                    ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                    ErrorMessage="Invalid email format." 
                    ForeColor="Red" />
                <br />

                <!-- Phone -->
                <asp:Label ID="lblPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" />
                <asp:TextBox ID="txtPhone" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="txtPhone" 
                    ErrorMessage="Phone is required." 
                    ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                    ControlToValidate="txtPhone" 
                    ValidationExpression="^\+?\d{0,13}$" 
                    ErrorMessage="Invalid phone number format." 
                    ForeColor="Red" />
                <br />

                <!-- Date of Birth -->
                <asp:Label ID="lblDOB" runat="server" Text="Date of Birth (MM/DD/YYYY)" AssociatedControlID="txtDateOfBirth" />
                <asp:TextBox ID="txtDateOfBirth" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" 
                    ControlToValidate="txtDateOfBirth" 
                    ErrorMessage="Date of Birth is required." 
                    ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revDOB" runat="server" 
                    ControlToValidate="txtDateOfBirth" 
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$" 
                    ErrorMessage="Invalid Date of Birth format (MM/DD/YYYY)." 
                    ForeColor="Red" />
                <br />

                <!-- Degree -->
                <asp:Label ID="lblDegree" runat="server" Text="Degree" AssociatedControlID="txtDegree" />
                <asp:TextBox ID="txtDegree" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDegree" runat="server" 
                    ControlToValidate="txtDegree" 
                    ErrorMessage="Degree is required." 
                    ForeColor="Red" />
                <br />

                <!-- University -->
                <asp:Label ID="lblUniversity" runat="server" Text="University" AssociatedControlID="txtUniversity" />
                <asp:TextBox ID="txtUniversity" runat="server" />
                <asp:RequiredFieldValidator ID="rfvUniversity" runat="server" 
                    ControlToValidate="txtUniversity" 
                    ErrorMessage="University is required." 
                    ForeColor="Red" />
                <br />

                <!-- Skills -->
                <asp:Label ID="lblSkills" runat="server" Text="Skills" AssociatedControlID="txtSkills" />
                <asp:TextBox ID="txtSkills" runat="server" TextMode="MultiLine" />
                <asp:RequiredFieldValidator ID="rfvSkills" runat="server" 
                    ControlToValidate="txtSkills" 
                    ErrorMessage="Skills are required." 
                    ForeColor="Red" />
                <br />

                <!-- Profile Picture -->
                <div>
                    <asp:Image ID="imgProfilePicture" runat="server" Width="150px" Height="150px" CssClass="profile-picture" 
                               ImageUrl="~/Images/default-profile.png" />
                </div>

                <asp:Label ID="lblProfilePicture" runat="server" Text="Profile Picture" AssociatedControlID="fileProfilePicture" />
                <asp:FileUpload ID="fileProfilePicture" runat="server" OnChange="previewImage()" />
                <br />

                <!-- Submit Button -->
                <asp:Button ID="btnCreateProfile" runat="server" Text="Create Profile" CssClass="btn-submit" OnClick="btnCreateProfile_Click" />
            </div>
        </form>
    </div>
</body>
</html>
