<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="job_portal.jobs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job Listings</title>
    <link href="Styles/jobs.css" rel="stylesheet" type="text/css" />
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 85%;
            margin: 0 auto;
            padding: 30px;
            background: white; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }

        /* Search Form Styles */
        .search-section {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .search-box {
            padding: 12px;
            font-size: 16px;
            width: 300px;
            border-radius: 30px;
            border: 1px solid #ccc;
            transition: all 0.3s ease-in-out;
        }

        .search-box:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
        }

        .btn-search {
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-search:hover {
            background-color: #45a049;
        }

        /* Job Grid Styles */
        .job-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .job-grid th {
            background-color: #f7f7f7;
            color: #555;
            text-align: left;
            padding: 15px;
            font-weight: bold;
        }

        .job-grid td {
            background-color: #fff;
            color: #666;
            text-align: left;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .job-grid td a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .job-grid td a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            .search-box {
                width: 80%;
            }

            .search-section {
                flex-direction: column;
            }

            .btn-search {
                width: 80%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Job Listings</h2>
            <div class="search-section">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search jobs..." />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
            </div>
            <asp:GridView ID="gvJobList" runat="server" CssClass="job-grid" AutoGenerateColumns="False" OnRowDataBound="gvJobList_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="JobDescription" HeaderText="Description" />
                    <asp:ButtonField Text="View Details" CommandName="ViewDetails" ButtonType="Link" />
                </Columns>
            </asp:GridView>  
        </div>
    </form>
</body>
</html>

