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
    public partial class BooksEdit : System.Web.UI.Page
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
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Id, FirstName + ' ' + LastName as Name
                    from Author
                    order by LastName, FirstName
                ");

                AuthorDropDownList.DataTextField = "Name";
                AuthorDropDownList.DataValueField = "Id";


                AuthorDropDownList.DataSource = dt;
                AuthorDropDownList.DataBind();

                DataTable dataTable = DatabaseHelper.Retrieve(@"
                    select id, Title, ISBN
                    from Book
                    where id = @id
                ", new SqlParameter("@id", bookId));

                if (dataTable.Rows.Count == 1)
                {
                    BookTitle.Text = dataTable.Rows[0].Field<string>("Title");
                    ISBN.Text = dataTable.Rows[0].Field<string>("ISBN");
                }
                else
                {
                    Response.Redirect("~/BooksList.aspx");
                }
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string bookTitle = BookTitle.Text;
            string bookISBN = ISBN.Text;
            string authorID = AuthorDropDownList.SelectedValue;


            DatabaseHelper.Update(@"
                update Book set
                Title=@Title,
                ISBN=@ISBN,
                AuthorID=@AuthorID
                where id = @id
            ",
                new SqlParameter("@Title", bookTitle),
                new SqlParameter("@ISBN", bookISBN),
                new SqlParameter("@id",bookId),
                new SqlParameter("@AuthorID", int.Parse(authorID)));

            Response.Redirect("~/BooksList.aspx");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BooksList.aspx");
        }
    }
}