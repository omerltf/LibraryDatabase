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
    public partial class LibraryEdit : System.Web.UI.Page
    {
        int branchId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!int.TryParse(Request.QueryString["ID"], out branchId))
            {
                Response.Redirect("~/LibraryList.aspx");
            }
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select BranchName, StreetAddress, City, State, Country, ZipCode
                    from Library
                    where Id = @BranchId
                ", new SqlParameter("@BranchId", branchId));

                if (dt.Rows.Count == 1)
                {
                    BranchName.Text = dt.Rows[0].Field<string>("BranchName");
                    StreetAddress.Text = dt.Rows[0].Field<string>("StreetAddress");
                    City.Text = dt.Rows[0].Field<string>("City");
                    State.Text = dt.Rows[0].Field<string>("State");
                    Country.Text = dt.Rows[0].Field<string>("Country");
                    ZipCode.Text = dt.Rows[0].Field<string>("ZipCode");
                }
                else
                {
                    Response.Redirect("~/LibraryList.aspx");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string branchName = BranchName.Text;
            string streetAddress = StreetAddress.Text;
            string city = City.Text;
            string state = State.Text;
            string country = Country.Text;
            string zipCode = ZipCode.Text;

            DatabaseHelper.Update(@"
                update Library set
                    BranchName=@BranchName,
                    StreetAddress=@StreetAddress,
                    City=@City,
                    State=@State,
                    Country=@Country,
                    ZipCode=@ZipCode
                    where Id = @BranchId",
                    new SqlParameter("@BranchName", branchName),
                    new SqlParameter("@StreetAddress", streetAddress),
                    new SqlParameter("@City", city),
                    new SqlParameter("@State", state),
                    new SqlParameter("@Country", country),
                    new SqlParameter("@ZipCode", zipCode),
                    new SqlParameter("@BranchId", branchId));
            Response.Redirect("~/LibraryList.aspx");
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LibraryList.aspx");
        }

    }
}