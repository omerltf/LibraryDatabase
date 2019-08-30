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
    public partial class BookDetails : System.Web.UI.Page
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
                    select b.Id, b.Title, b.ISBN, a.FirstName + ' ' + a.LastName as AuthorName
                    from Book b
                    join Author a on b.AuthorID = a.ID
                    where b.Id = @ID
                ", new SqlParameter("@ID", bookId));

                if (dataTable.Rows.Count == 1)
                {
                    BookTitle.Text = dataTable.Rows[0].Field<string>("Title");
                    ISBN.Text = dataTable.Rows[0].Field<string>("ISBN");
                    AuthorTextBox.Text = dataTable.Rows[0].Field<string>("AuthorName");
                    BookTitle.Enabled = false;
                    ISBN.Enabled = false;
                    AuthorTextBox.Enabled = false;
                }
                else
                {
                    Response.Redirect("~/BooksList.aspx");
                }

                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Id, BranchName
                    from Library
                    order by BranchName
                ");
                LibraryDropDownList.DataTextField = "BranchName";
                LibraryDropDownList.DataValueField = "Id";
                LibraryDropDownList.AppendDataBoundItems = true;
                LibraryDropDownList.DataSource = dt;
                LibraryDropDownList.DataBind();

                BindBookCopyList();
            }
        }

        private void BindBookCopyList()
        {
            DataTable data = DatabaseHelper.Retrieve(@"
                    select b.Id, b.LibraryId, b.Available, a.BranchName as BranchName
                    from BookCopy b
                    join Library a on b.LibraryId = a.Id
                ");
            BookCopyRepeater.DataSource = data.Rows;
            BookCopyRepeater.DataBind();
        }

        protected void Edit_Click (object sender, EventArgs e)
        {
            Response.Redirect($"~/BooksEdit.aspx?ID={bookId}");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BooksList.aspx");
        }

        protected void AddBookButton_Click(object sender, EventArgs e)
        {
            int libraryId = int.Parse(LibraryDropDownList.SelectedValue);   //this gets selected libraryID
            string branchName = LibraryDropDownList.SelectedItem.Text;
            int? id = DatabaseHelper.Insert(@"
                insert into BookCopy (BookID, LibraryID, Available)
                values (@BookID, @LibraryID, 1);
            ",
                new SqlParameter("@BookID", bookId),
                new SqlParameter("@LibraryID", libraryId));

            Response.Redirect("~/BookDetails.aspx");
        }

        protected void NotAvailabilityButton_Click(object sender, EventArgs e)
        {
            HandleAvailabitilityButtonClick(sender, false);
        }

        protected void AvailabilityButton_Click(object sender, EventArgs e)
        {
            HandleAvailabitilityButtonClick(sender, true);
        }

        private void HandleAvailabitilityButtonClick(object sender, bool available)
        {
            Button button = (Button)sender;
            int bookCopyId = int.Parse(button.CommandArgument);

            DatabaseHelper.Update(@"
                update BookCopy set Available = @Available
                where Id = @BookCopyId    
            ",
            new SqlParameter("@Available", available),
            new SqlParameter("@BookCopyId", bookCopyId));
            BindBookCopyList();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

        }

        
    }
}