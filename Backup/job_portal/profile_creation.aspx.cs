using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace job_portal
{
    public partial class profile_creation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
           protected void btnCreateProfile_Click(object sender, EventArgs e)
        {
            string error;
            // Check if a file is uploaded
            if (fileProfilePicture.HasFile)
            {
                // Check the file extension to ensure it's an image
                string fileExtension = Path.GetExtension(fileProfilePicture.FileName).ToLower();

                // Valid image file extensions
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                if (Array.Exists(allowedExtensions, ext => ext == fileExtension))
                {
                    // Define the path where the file will be saved
                    string savePath = Server.MapPath("~/ProfilePictures/");
                    
                    // Check if the directory exists, if not, create it
                    if (!Directory.Exists(savePath))
                    {
                        Directory.CreateDirectory(savePath);
                    }

                    // Generate a unique file name to avoid overwriting files with the same name
                    string fileName = Guid.NewGuid().ToString() + fileExtension;

                    // Save the file on the server
                    fileProfilePicture.SaveAs(Path.Combine(savePath, fileName));

                    // Optional: If you want to display the image on the webpage, use the relative path
                    string fileUrl = "~/ProfilePictures/" + fileName;
                    
                    // You can store this file URL in your database, or show it on the webpage
                    // For example, display the image:
                    error = "Profile picture uploaded successfully!";
                   // lblFileError.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    // Invalid file type
                    error = "Invalid file type. Please upload a valid image file (jpg, png, gif).";
                }
            }
            else
            {
                // No file was uploaded
                error = "Please upload a profile picture.";
            }
        }
    
 
    }
}