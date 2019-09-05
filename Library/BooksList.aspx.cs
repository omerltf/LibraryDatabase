using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class BooksList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select b.Id, b.Title, b.ISBN, a.FirstName + ' ' + a.LastName as AuthorName
                    from Book b
                    join Author a on b.AuthorID = a.ID
                    order by Title
                ");

                BooksRepeater.DataSource = dt.Rows;
                BooksRepeater.DataBind();

            }
        }
    }
}