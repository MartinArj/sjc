<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign_up.aspx.cs" Inherits="job_portal.sign_up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="Styles/login_sheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <center>
     <form id="form1" runat="server">
        <div class="login-container">
            <h2>Create Your Account</h2>

            <!-- Message for invalid inputs -->
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" />

            <!-- Sign Up Form Table -->
         
            <table class="signup-table" style="margin-top: 10px">
                <tr>
                    <td><label for="txtUsername">Username:</label></td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
                                                    ErrorMessage="Username is required" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td><label for="txtEmail">Email:</label></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                                    ErrorMessage="Email is required" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" 
                                                        ErrorMessage="Invalid email format" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td><label for="txtPassword">Password:</label></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                                                    ErrorMessage="Password is required" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td><label for="txtConfirmPassword">Confirm Password:</label></td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                                              ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="submit-row">
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="btn btn-primary" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <p>Already have an account? <a href="Login.aspx">Login here</a></p>
                    </td>
                </tr>
            </table>
        
        </div>
    </form>
        </center>
</body>
</html>
