using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class PatronsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select LibraryCardNumber, FirstName, LastName, EmailAddress, StreetAddress, City, State, Country, ZipCode
                    from Patron
                    order by LastName, FirstName
                ");

                PatronRepeater.DataSource = dt.Rows;
                PatronRepeater.DataBind();
            }
        }
    }
}