using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class Checkout : System.Web.UI.Page
    {
        int bookId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!int.TryParse(Request.QueryString["ID"], out bookId))
            {
                Response.Redirect("~/BooksList.aspx");
            }
            if (!IsPostBack)
            {
                DataTable dataTable = DatabaseHelper.Retrieve(@"
                    select p.FirstName + ' ' + p.LastName as Name, p.LibraryCardNumber, li.EmployeeNumber as EmployeeNumber
                    from Librarian li
                    join Patron p on p.LibraryCardNumber=li.LibraryCardNumber
                ");
                LibrarianDropDownList.DataTextField = "Name";
                LibrarianDropDownList.DataValueField = "EmployeeNumber";
                LibrarianDropDownList.AppendDataBoundItems = true;
                LibrarianDropDownList.DataSource = dataTable;
                LibrarianDropDownList.DataBind();

                DataTable dt = DatabaseHelper.Retrieve(@"
                    select LibraryCardNumber, FirstName + ' ' + LastName as PatronName
                    from Patron
                    order by PatronName
                    ");
                PatronDropDownList.DataTextField = "PatronName";
                PatronDropDownList.DataValueField = "LibraryCardNumber";
                PatronDropDownList.AppendDataBoundItems = true;
                PatronDropDownList.DataSource = dt;
                PatronDropDownList.DataBind();

                DataTable data = DatabaseHelper.Retrieve(@"
                    select b.Id, b.LibraryId as LibraryId, b.Available, a.BranchName as BranchName
                    from BookCopy b
                    join Library a on b.LibraryId = a.Id
                    where b.BookID=@bookId
                ",
                    new SqlParameter("@BookID", bookId));
                AvailableLibrariesDropDownList.DataTextField = "BranchName";
                AvailableLibrariesDropDownList.DataValueField = "LibraryId";
                AvailableLibrariesDropDownList.AppendDataBoundItems = true;
                AvailableLibrariesDropDownList.DataSource = data;
                AvailableLibrariesDropDownList.DataBind();
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            int patronLibraryCardNumber = int.Parse(PatronDropDownList.SelectedValue);
            int employeeNumber = int.Parse(LibrarianDropDownList.SelectedValue);
            DateTime now = DateTime.Today;
            DateTime due = DateTime.Now.AddDays(14);

            int? id = DatabaseHelper.Insert(@"
                insert into PatronCheckout (LibraryCardNumber, EmployeeNumber, BookCopyID, CheckedOutOn, DueOn)
                values (@LibraryCardNumber, @EmployeeNumber, @BookCopyID, @CheckedOutOn, @DueOn);
            ",
                new SqlParameter("@LibraryCardNumber", patronLibraryCardNumber),
                new SqlParameter("@EmployeeNumber", employeeNumber),
                new SqlParameter("@BookCopyID", bookId),
                new SqlParameter("@CheckedOutOn", now),
                new SqlParameter("@DueOn", due));
            Response.Redirect("~/Checkout.aspx");
        }
    }
}