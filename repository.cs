using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace job_portal
{
    public  class repository
    {
       public static string  path = @"Data Source=LENOVO\SQLEXPRESS;Initial Catalog=job;Integrated Security=True";
        public static List<stud> GetProfiles()
        {
            List<stud> profiles = new List<stud>();

            using (SqlConnection conn = new SqlConnection(path))
            {
                conn.Open();
                string query = "SELECT Dno, FirstName, LastName, Email, Phone, DateOfBirth, Degree, University, Skills, ProfilePicture ,pass_word FROM Profiles";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                      stud profile = new stud
                        {
                            Dno = reader["Dno"].ToString(),
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            Email = reader["Email"].ToString(),
                            Phone = reader["Phone"].ToString(),
                            DateOfBirth = Convert.ToDateTime(reader["DateOfBirth"]),
                            Degree = reader["Degree"].ToString(),
                            University = reader["University"].ToString(),
                            Skills = reader["Skills"].ToString(),
                            ProfilePicture = reader["ProfilePicture"].ToString(),  // Retrieve the relative path
                            Password=reader["Pass_word"].ToString()
                        };
                        profiles.Add(profile);
                    }
                }
            }

            return profiles;
        }


    }
}