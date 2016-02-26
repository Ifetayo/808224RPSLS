using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _808224RPSLS
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * Check to see if the user has a valid session.
             */
            if (!IsPostBack)
            {
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                if (Session["userId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    try
                    {
                        DateTime dob = new DateTime();
                        dob = (DateTime)Session["birthdate"];
                        if (DateTime.Today.Day.Equals(dob.Day) && DateTime.Today.Month.Equals(dob.Month))
                        {
                            birthdaylbl.Text = "Happy birthday " + Session["username"] + " !!!!!!!";
                            marq.Visible = true;
                        }
                        DsiplayResultPanel();
                    }
                    catch
                    {
                        Response.Redirect("~/Login.aspx");
                    }
                }
            }
            //else
                 //prevent postback;
        }
        /*
         * This method displays the user previous game result if any.
         * It sets text value to the result panel components, and set the panel to visible
         */
        protected void DsiplayResultPanel() 
        {
            if (Session["lastGameResult"] != null) 
            {
                string lastGameResult = Session["lastGameResult"].ToString();
                resultlbl.Text = "You " + lastGameResult;
                if (lastGameResult == "Win") 
                {
                    resultlbl.Text = "You Won!";
                    infolbl.Text = "Your: " + Session["userChoice"] + " beats CPU's: " + Session["cpuChoice"] + ". Play Again! ";
                }
                else if (lastGameResult == "Lost")
                {
                    resultlbl.Text = "You Lost!";
                    infolbl.Text = "CPU: " + Session["cpuChoice"] + " beats Your: " + Session["userChoice"] + ". Play Again! ";
                }
                else 
                {
                    resultlbl.Text = "Draw";
                    infolbl.Text = "Your: " + Session["userChoice"] + " draws CPU's: " + Session["cpuChoice"] + ". Play Again! ";
                }
                gameresultpnl.Visible = true;
            }
            return;
        }

        /*
         * This method picks a random number from a range of 0 to 4. 0 = Rock, 1= Paper, 2 = Scissors, 3 = Lizard, and 4 = Spock.
         * Returns the selected random value.
         */
        protected int CPUchoice()
        {
            Random randomPick = new Random();
            return randomPick.Next(0, 5);
        }

        /*
         * This method reads in the button indentifier that calls this method.
         * Each button identifier is attached to a number. The default number is 0 = Rock, then the rest are1 = Paper, 2 = Scissors, 3 = Lizard, and 4 = Spock.
         * Once the number is determined, it calls method Gamedecider sending the return value of the CPUchoice method and its own number.
         * Once control is returned to the system it redirects to its self, thereby mitigating postback from page refresh.
         */
        protected void UserChoice(object sender, EventArgs e)
        {
            Button selectedButton = (Button)sender;
            string buttonName = selectedButton.ID;
            int buttonId = 0;
            switch (buttonName)
            {
                case "pprbtn":
                    buttonId = 1; //Paper
                    break;
                case "scbtn":
                    buttonId = 2; //Scissors
                    break;
                case "lzdbtn":
                    buttonId = 3; //Lizard
                    break;
                case "spkbtn":
                    buttonId = 4; //Spock
                    break;
            }
            
            GameDecider(CPUchoice(), buttonId);
            Response.Redirect("~/Home.aspx");
        }

        /*
         * This method accepts two integers, it has an outcome 2D array consisting of the game permutation. 
         * The method takes in the cpu and user values, and uses these values as indexes for the outcome 2D array. 
         * If the array value of the 2D array is equals to 1 the cpu wins, if the result equals 0 then the user wins, else the match is drawn.
         * Results of the game are inserted into a database.
         */
        protected void GameDecider(int cpuChoice, int userChoice)
        {
            int[,] outcomeArray = { { 2, 0, 1, 1, 0 }, { 1, 2, 0, 0, 1 }, { 0, 1, 2, 1, 0 }, { 0, 1, 0, 2, 1 }, { 1, 0, 1, 0, 2 } }; //array arrangement is {Rock, Paper, Scissors, Lizard, Spock}
            string[] nameofChoice = { "Rock", "Paper", "Scissors", "Lizard", "Spock" };
            string resultvalue;
            //int[,] array2D = new int[,] { { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 } };

            int result = outcomeArray[cpuChoice, userChoice];
            if (result == 1)//CPU wins
            {
                resultvalue = "Lost";
                //resultlbl.Text = "You Lost!";
                infolbl.Text = "CPU: " + nameofChoice[cpuChoice] + " beats Your: " + nameofChoice[userChoice] + ". Play Again! ";
            }
            else if (result == 0)//user wins
            {
                resultvalue = "Won";
            }
            else //its a draw 
            {
                resultvalue = "Draw";
            }

            try
            {
                PlayerDataSource.InsertParameters["playerId"].DefaultValue = Session["userId"].ToString();
                PlayerDataSource.InsertParameters["status"].DefaultValue = resultvalue;
                PlayerDataSource.InsertParameters["datetimeplayed"].DefaultValue = DateTime.Now.ToString();
                PlayerDataSource.Insert();
                Session["lastGameResult"] = resultvalue;
                Session["cpuChoice"] = nameofChoice[cpuChoice];
                Session["userChoice"] = nameofChoice[userChoice];
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry an error has occured saving your game data. Please try again.')", true);
            }
        }
    }
}