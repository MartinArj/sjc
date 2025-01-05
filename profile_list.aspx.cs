using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace job_portal
{
    public partial class job_list : System.Web.UI.Page
    {
        List<stud> studentList = repository.GetProfiles();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentGrid();
            }
        }

        // Method to bind the GridView
        private void BindStudentGrid(string keyword = "")
        {
            // Filter list based on search keyword
            var filteredList = string.IsNullOrEmpty(keyword)
                ? studentList
                : studentList.Where(s =>
                    s.FirstName.ToLower().Contains(keyword.ToLower()) ||
                    s.Email.ToLower().Contains(keyword.ToLower()) ||
                    s.Degree.ToLower().Contains(keyword.ToLower())).ToList();

            // Bind the filtered list to GridView
            gvStudents.DataSource = filteredList;
            gvStudents.DataBind();
        }

        // Event for search text change
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            BindStudentGrid(keyword);
        }

        // Event for GridView page index change
        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindStudentGrid(txtSearch.Text.Trim());
        }

        // Event for View Profile button click
        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")
            {
                // Retrieve the StudentID from CommandArgument
                String studentID = Convert.ToString(e.CommandArgument);

                // Find the student by ID
                var student = studentList.FirstOrDefault(s => s.Dno == studentID);
                if (student.Dno != null)
                {
                    Session["Id"] = student.Dno;
                    Response.Redirect("view_profile.aspx");
                }
                
            }
        }

        // Student class to represent data
       

        protected void gvStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow selectedRow = gvStudents.SelectedRow;
          string id = selectedRow.Cells[1].Text;
          Session["Id"] = id;
            Response.Redirect("view_profile.aspx");
        }
    
    }
}