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
    public partial class PatronsEdit : System.Web.UI.Page
    {
        int libraryCardNumber = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["LibraryCardNumber"], out libraryCardNumber))
            {
                Response.Redirect("~/PatronsList.aspx");
            }
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select FirstName, LastName, EmailAddress, StreetAddress, City, State, Country, ZipCode
                    from Patron
                    where LibraryCardNumber = @LibraryCardNumber
                ", new SqlParameter("@LibraryCardNumber", libraryCardNumber));

                if (dt.Rows.Count == 1)
                {
                    FirstName.Text = dt.Rows[0].Field<string>("FirstName");
                    LastName.Text = dt.Rows[0].Field<string>("LastName");
                    EmailAddress.Text = dt.Rows[0].Field<string>("EmailAddress");
                    StreetAddress.Text = dt.Rows[0].Field<string>("StreetAddress");
                    City.Text = dt.Rows[0].Field<string>("City");
                    State.Text = dt.Rows[0].Field<string>("State");
                    Country.Text = dt.Rows[0].Field<string>("Country");
                    ZipCode.Text = dt.Rows[0].Field<string>("ZipCode");
                }
                else
                {
                    Response.Redirect("~/PatronsList.aspx");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string emailAddress = EmailAddress.Text;
            string streetAddress = StreetAddress.Text;
            string city = City.Text;
            string state = State.Text;
            string country = Country.Text;
            string zipCode = ZipCode.Text;

            DatabaseHelper.Update(@"
                update Patron set
                    FirstName=@FirstName,
                    LastName=@LastName,
                    EmailAddress=@EmailAddress,
                    StreetAddress=@StreetAddress,
                    City=@City,
                    State=@State,
                    Country=@Country,
                    ZipCode=@ZipCode
                    where LibraryCardNumber = @LibraryCardNumber",
                    new SqlParameter("@FirstName", firstName),
                    new SqlParameter("@LastName", lastName),
                    new SqlParameter("@EmailAddress", emailAddress),
                    new SqlParameter("@StreetAddress", streetAddress),
                    new SqlParameter("@City", city),
                    new SqlParameter("@State", state),
                    new SqlParameter("@Country", country),
                    new SqlParameter("@ZipCode", zipCode),
                    new SqlParameter("@LibraryCardNumber", libraryCardNumber));
            Response.Redirect("~/PatronsList.aspx");
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PatronsList.aspx");
        }
    }
}