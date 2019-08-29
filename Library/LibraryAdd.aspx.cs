using Library.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class LibraryAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Save_Click (object sender, EventArgs e)
        {
            string branchName = BranchName.Text;
            string streetAddress = StreetAddress.Text;
            string city = City.Text;
            string state = State.Text;
            string country = Country.Text;
            string zipCode = ZipCode.Text;

            int? id = DatabaseHelper.Insert(@"
                insert into Library (BranchName, StreetAddress, City, State, Country, ZipCode)
                values (@BranchName, @StreetAddress, @City, @State, @Country, @ZipCode);
            ",
                new SqlParameter("@BranchName", branchName),
                new SqlParameter("@StreetAddress", streetAddress),
                new SqlParameter("@City", city),
                new SqlParameter("@State", state),
                new SqlParameter("@Country", country),
                new SqlParameter("@ZipCode", zipCode));

            Response.Redirect("~/LibraryList.aspx");
        }
    }
}