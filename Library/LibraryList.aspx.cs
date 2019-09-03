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
    public partial class LibraryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select ID, BranchName, StreetAddress, City, State, Country, ZipCode
                    from Library
                    order by BranchName
                ");

                LibraryRepeater.DataSource = dt.Rows;
                LibraryRepeater.DataBind();

            }
        }
    }
}