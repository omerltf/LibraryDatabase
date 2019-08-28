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
    public partial class BooksAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string bookTitle = BookTitleTextBox.Text;
            string bookISBN = ISBNNumberTextBox.Text;
            string authorID = AuthorDropDownList.SelectedValue;


            int? id = DatabaseHelper.Insert(@"
                insert into Book (Title, ISBN, AuthorID)
                values (@Title, @ISBN, @AuthorID);
            ",
                new SqlParameter("@Title", bookTitle),
                new SqlParameter("@ISBN", bookISBN),
                new SqlParameter("@AuthorID", int.Parse(authorID)));

            Response.Redirect("~/BooksList.aspx");
        }
    }
}