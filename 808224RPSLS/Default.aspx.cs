using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

namespace _808224RPSLS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*
         * This method inserts the user into the database. 
         * It accepts the username and date of brith.
         */
        protected void regbtn_Click(object sender, EventArgs e)
        {
            DateTime dateOfBirth = new DateTime(); //initialize date of birth field used to store the inputted date of birth from the form
            try
            {
                dateOfBirth = DateTime.Parse(dob.Text); //try to parse the inputted date to the DateTime variable dateOfBirth
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Date Of Birth format, please use dd/mm/yyyy format.')", true);
                return;
            }
            if (username.Text.Length > 10) //perform serverside validation for the username field, even though the textbox length has been set to a maximum of 8 characters
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username is too long.')", true);
                return;
            }
            bool u = UserNameExists(username.Text); //all is fine, now check if a user with the same username exists.
            if (u == true) //if true, username exists
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('A user with the same username exists. Please choose another username.')", true);
                return;
            }
            //perform database insertion
            try
            {
                int numberInserted = SqlDataSource1.Insert();
                if(numberInserted < 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry an error has occured, please try again later')", true);
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry an error has occured, please try again later')", true);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username successfully added')", true);
        }
        /*
         * This method checks the database if the username that is to be added exists in the database.
         * It retruns true if the username exists and returns false if it doesn't.
         */
        protected bool UserNameExists(string user)
        {
            DataView p = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty); //Adding the parameter is not needed here, it has already been done declaratively
            int records = (int)p.Table.Rows[0][0]; //Get select command result count.
            if (records > 0) //if number of records is greater than 0, this means a user with the same username exists, therefore return true, else return false
            {
                return true;
            }
            return false;
        }
    }
}