using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace job_portal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        List<stud> profile;
        protected void Page_Load(object sender, EventArgs e)
        {
            profile = repository.GetProfiles();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            var student = profile.FirstOrDefault(s => s.Dno == username);
            if (student != null && student.Password == password)
            {
                Session["id"] = username;
                Response.Redirect("view_profile.aspx");
            }
            else
            {
                Response.Write("<script>alert('wrong');</script>");
            }
          

        }
    }
}