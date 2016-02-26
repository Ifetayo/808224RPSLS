using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _808224RPSLS
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * Check to see if the user has a valid session, if so send to the home page
             * if not redirect the user to the login page.
             */
            loginlnk.Visible = true;
            if (!Request.Url.AbsoluteUri.Contains("/Home") && !Request.Url.AbsoluteUri.Contains("/StatisticsBoard"))
            {
                if (Session["userId"] != null) 
                {
                    homelnk.Visible = true;
                    logoutlnk.Visible = true;
                    loginlnk.Visible = false;
                    Response.Redirect("~/Home.aspx");
                }
            }
            else if(Request.Url.AbsoluteUri.Contains("/Home") || Request.Url.AbsoluteUri.Contains("/StatisticsBoard"))
            {
                if(Session["userId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                
                logoutlnk.Visible = true;
                loginlnk.Visible = false;
            }
        }

        /*
         * Performs  logout process, empties out the session and its values, then return to the default page
         */
        protected void Logoutbtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/");
        }
    }
}