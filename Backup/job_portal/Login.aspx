<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="job_portal.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .login-container {
            width: 400px;
            padding: 20px;
            margin: 100px auto;
            background-color: #ffffff;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-table {
            width: 100%;
            border-spacing: 10px;
        }

        .login-table td {
            text-align: left;
            padding: 8px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .submit-row {
            text-align: center;
        }

        p {
            margin-top: 15px;
            color: #666;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <div class="login-container">
                <h2>Login to Your Account</h2>

                <!-- Message for invalid login -->
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" />

                <!-- Login Form Table -->
                <table class="login-table">
                    <tr>
                        <td><label for="txtUsername">Username:</label></td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
                                                        ErrorMessage="Username is required" ForeColor="Red" />
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
                        <td colspan="2" class="submit-row">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <p>Don't have an account? <a href="sign_up.aspx">Sign up here</a></p>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>