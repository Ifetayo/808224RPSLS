using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _808224RPSLS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /*
         * This method selects the given username against the database, loads all user records associated witht he username.
         * If the username exists it redirects the user to the home page, it not it send an alert to the user showing loing failed.
         */
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            DataView p = (DataView)LoginDataSource.Select(DataSourceSelectArguments.Empty); //Adding the parameter is not needed here, it has already been done declaratively
            int record = p.Count;
            if (record == 1) //record exists
            {
                Array result = p.Table.Rows[0].ItemArray;
                int hjk = result.GetLength(0);
                Session["userId"] = (Int32)result.GetValue(0); //store userid
                Session["username"] = (string)result.GetValue(1);//store username
                Session["birthdate"] = (DateTime)result.GetValue(2);//store birthdate
                Response.Redirect("~/Home.aspx");
            }
            else 
            {
                errolbl.Text = "Username doesn't seem to be registered.";
                flashpanel.Visible = true;
            }
        }
    }
}