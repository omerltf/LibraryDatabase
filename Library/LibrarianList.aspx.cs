using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class LibrarianList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                DataTable dataTable = DatabaseHelper.Retrieve(@"
                    select Id, BranchName
                    from Library
                    order by BranchName
                ");
                LibraryDropDownList.DataTextField = "BranchName";
                LibraryDropDownList.DataValueField = "Id";
                LibraryDropDownList.AppendDataBoundItems = true;
                LibraryDropDownList.DataSource = dataTable;
                LibraryDropDownList.DataBind();


                DataTable data = DatabaseHelper.Retrieve(@"
                    select p.FirstName, p.LastName, l.BranchName, p.LibraryCardNumber, li.EmployeeNumber 
                    from Librarian li
                    join Library l on l.ID=li.LibraryID
                    join Patron p on p.LibraryCardNumber=li.LibraryCardNumber
                ");
                LibrarianRepeater.DataSource = data.Rows;
                LibrarianRepeater.DataBind();
            }
        }

        protected void AddLibrarianButton_Click(object sender, EventArgs e)
        {
            int libraryId = int.Parse(LibraryDropDownList.SelectedValue);   //this gets selected libraryID
            int libraryCardNumber = int.Parse(PatronDropDownList.SelectedValue); //this gets patron's library card number

            int? id = DatabaseHelper.Insert(@"
                insert into Librarian (LibraryID, LibraryCardNumber)
                values (@LibraryID, @LibraryCardNumber);
            ",
                new SqlParameter("@LibraryID", libraryId),
                new SqlParameter("@LibraryCardNumber", libraryCardNumber));
            Response.Redirect("~/LibrarianList.aspx");
        }
    }
}