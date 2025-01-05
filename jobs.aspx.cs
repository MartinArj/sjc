using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
namespace job_portal
{
    public partial class jobs : System.Web.UI.Page
    {
         private List<Job> jobList = new List<Job>
        {
            new Job { JobTitle = "Software Developer", CompanyName = "TechCorp", Location = "New York", JobDescription = "Develop software applications" },
            new Job { JobTitle = "Web Developer", CompanyName = "WebWorks", Location = "San Francisco", JobDescription = "Build and maintain websites" },
            new Job { JobTitle = "Data Analyst", CompanyName = "DataCo", Location = "Boston", JobDescription = "Analyze company data" },
            // Add more jobs as needed
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobList(jobList); // Bind the job list when the page loads
            }
        }

        // Bind the job list to the GridView
        private void BindJobList(List<Job> jobs)
        {
            gvJobList.DataSource = jobs;
            gvJobList.DataBind();
        }

        // Search button click event
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim().ToLower();

            // Filter the jobs based on search term (case insensitive)
            var filteredJobs = jobList.Where(job =>
                job.JobTitle.ToLower().Contains(searchTerm) ||
                job.CompanyName.ToLower().Contains(searchTerm) ||
                job.Location.ToLower().Contains(searchTerm)
            ).ToList();

            // Bind the filtered job list to the GridView
            BindJobList(filteredJobs);
        }

        // Optional: Event handler for when the user clicks "View Details"
        protected void gvJobList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvJobList.Rows[rowIndex];

                string jobTitle = row.Cells[0].Text;
                // Get more details and redirect to another page or show details
                //Response.Redirect("job_details.aspx?jobTitle={jobTitle}");
            }
        }

        // Optional: Customize the GridView row binding if needed
        protected void gvJobList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Custom logic when binding each row (e.g., add tooltips, styling, etc.)
            }
        }
    }

    // Job class (you can replace this with a real model from your database)
    public class Job
    {
        public string JobTitle { get; set; }
        public string CompanyName { get; set; }
        public string Location { get; set; }
        public string JobDescription { get; set; }
    }
}