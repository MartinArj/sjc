using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace job_portal
{
    public partial class profile_creation : System.Web.UI.Page
    {
        string path = @"Data Source=LENOVO\SQLEXPRESS;Initial Catalog=job;Integrated Security=True";

        // Method to hash the password

        bool isupdate = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"]!=null) 
            { 
               
                isupdate = true;
                Dno.Text = Session["ID"].ToString();
                var profile = repository.GetProfiles().FirstOrDefault(s => s.Dno == Dno.Text);
                txtFirstName.Text = profile.FirstName;
                txtLastName.Text = profile.LastName;
                txtEmail.Text = profile.Email;
                txtPhone.Text = profile.Phone;
                txtDateOfBirth.Text = profile.DateOfBirth.ToShortDateString();
                txtDegree.Text = profile.Degree;
                txtUniversity.Text = profile.University;
                txtSkills.Text = profile.Skills;
                imgProfilePicture.ImageUrl = profile.ProfilePicture;
                
            }
        }

        protected void btnCreateProfile_Click(object sender, EventArgs e)
        {
            try
            {
                string imagePath = string.Empty;

                // Check if a profile picture has been uploaded
                if (fileProfilePicture.HasFile)
                {
                    // Generate a unique file name for the uploaded image
                    string fileName = Path.GetFileName(fileProfilePicture.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/img/"); // Ensure the folder exists in your project directory
                    string filePath = Path.Combine(folderPath, fileName);

                    // Save the image to the server
                    fileProfilePicture.SaveAs(filePath);

                    // Store the relative path of the image (stored in the 'img' folder)
                    imagePath = "~/img/" + fileName; // You can use a relative path or a full path
                }

                using (SqlConnection conn = new SqlConnection(path))
                {
                    conn.Open();

                    string query = "INSERT INTO Profiles (Dno, FirstName, LastName, Email, Phone, DateOfBirth, Degree, University, Skills, ProfilePicture, Pass_word) " +
                                   "VALUES (@Dno, @FirstName, @LastName, @Email, @Phone, @DateOfBirth, @Degree, @University, @Skills, @ProfilePicture, @Password)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Dno", Dno.Text);
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@DateOfBirth", DateTime.Parse(txtDateOfBirth.Text));
                        cmd.Parameters.AddWithValue("@Degree", txtDegree.Text);
                        cmd.Parameters.AddWithValue("@University", txtUniversity.Text);
                        cmd.Parameters.AddWithValue("@Skills", txtSkills.Text);

                        // Store the image path in the database
                        cmd.Parameters.AddWithValue("@ProfilePicture", imagePath); // Save the path in the ProfilePicture column

                        // Hash the password before saving
                        string hashedPassword = txtPhone.Text;
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        try
                        {
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                ClearForm();
                                Response.Write("<script>alert('Profile created successfully!');</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('No rows were affected. Please try again.');</script>");
                            }
                        }
                        catch (Exception t)
                        {
                            Response.Write("<script>alert('Error: " + t.Message + "!');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error occurred: " + ex.Message + "');</script>");
            }
        }
        private void ClearForm()
        {
            // Clear textboxes
            Dno.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtDateOfBirth.Text = "";
            txtDegree.Text = "";
            txtUniversity.Text = "";
            txtSkills.Text = "";

            // Clear file upload
            fileProfilePicture.Attributes.Clear();

            // Optionally, reset other controls (like drop-downs, checkboxes, etc.)
        }

    }
}
