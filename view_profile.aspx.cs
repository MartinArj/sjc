using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace job_portal
{
    public partial class view_profile : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var s = Session["ID"].ToString();
            id = Session["ID"].ToString();
            if (!IsPostBack)
              {
                  if (Session["ID"] != null)
                     {
                     id = Session["ID"].ToString();
                         stud profile = repository.GetProfiles().FirstOrDefault(T => T.Dno == id);
                         imgProfilePicture.ImageUrl = profile.ProfilePicture; // Assuming ProfilePicture is a URL
                         lblFirstName.Text = profile.FirstName;
                         lblLastName.Text = profile.LastName;
                         lblEmail.Text = profile.Email;
                         lblPhone.Text = profile.Phone;
                         lblDOB.Text = profile.DateOfBirth.ToShortDateString();
                         lblDegree.Text = profile.Degree;
                         lblUniversity.Text = profile.University;
                         if (!string.IsNullOrEmpty(profile.Skills))
                         {
                             string[] skills = profile.Skills.Split(','); // Split skills by comma
                             foreach (string skill in skills)
                             {
                                 HtmlGenericControl li = new HtmlGenericControl("li");
                                 li.InnerText = skill.Trim(); // Remove extra spaces
                                 ulSkills.Controls.Add(li);
                             }
                         }
                     }
             }
           

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Session["ID"] = id;
            Response.Redirect("profile_creation.aspx");
        }
    }
}