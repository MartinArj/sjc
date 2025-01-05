<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="job_posting.aspx.cs" Inherits="job_portal.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Post a Job</title>
    <link href="Styles/job_posting.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <h2>Post a Job</h2>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Job Title:" AssociatedControlID="txtJobTitle" />
            <asp:TextBox ID="txtJobTitle" runat="server" CssClass="inputText" />
        </div>
        
        <div>
            <asp:Label ID="Label2" runat="server" Text="Job Description:" AssociatedControlID="txtJobDescription" />
            <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" CssClass="inputText" />
        </div>
        
        <div>
            <asp:Label ID="Label3" runat="server" Text="Company Name:" AssociatedControlID="txtCompanyName" />
            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="inputText" />
        </div>
        
        <div>
            <asp:Label ID="Label4" runat="server" Text="Location:" AssociatedControlID="txtLocation" />
            <asp:TextBox ID="txtLocation" runat="server" CssClass="inputText" />
        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Application Link:" AssociatedControlID="txtApplicationLink" />
            <asp:TextBox ID="txtApplicationLink" runat="server" CssClass="inputText" />
        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="Job Image:" AssociatedControlID="fileJobImage" />
            <asp:FileUpload ID="fileJobImage" runat="server" CssClass="inputText" />
        </div>

        <div>
            <asp:Button ID="btnPostJob" runat="server" Text="Post Job" OnClick="PostJob" CssClass="btnSubmit" />
        </div>

    </form>
</body>
</html>
