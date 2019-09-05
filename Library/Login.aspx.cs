using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;


namespace Library
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            int libraryCardNumber = 0;
            int.TryParse(LibraryCardNumberTextBox.Text, out libraryCardNumber);
            string submittedPassword = Password.Text;

            DataTable dt = DatabaseHelper.Retrieve(@"
                    select p.FirstName, p.LastName, p.LibraryCardNumber, li.EmployeeNumber, li.Password 
                    from Librarian li
                    join Patron p on p.LibraryCardNumber=li.LibraryCardNumber
                ");
            if (libraryCardNumber == 0)
            {
                BadLoginMessage.Visible = true;
            }
            else { 
                for (int count = 0; count < dt.Rows.Count; count++)
                {
                    if ((dt.Rows[count].Field<int>("LibraryCardNumber") == libraryCardNumber) && (BCrypt.Net.BCrypt.Verify(submittedPassword, dt.Rows[count].Field<string>("Password"))))
                    {
                            FormsAuthentication.RedirectFromLoginPage(dt.Rows[count].Field<string>("LastName"), true);
                            BadLoginMessage.Visible = false;  
                    }
                    else
                    {
                        BadLoginMessage.Visible = true;
                    }
                }
            }
        }
    }
}