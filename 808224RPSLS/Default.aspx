<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_808224RPSLS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Registration Form</h2>
        <p class="lead">
        This project is an implementation of the Rock, Paper, Scissors, Lizard, Spock game.
        Scissors cuts Paper covers Rock crushes Lizard poisons Spock smashes Scissors decapitates Lizard
        eats Paper disproves Spock vaporizes Rock crushes Scissors.
        </p>
        <center>
             <asp:TextBox ID="username" runat="server" placeholder="User name" class="form-control" value="" maxlength="10" type="text" required="required" ToolTip="Your user name"></asp:TextBox>
             <asp:TextBox ID="dob" runat="server" class="form-control" placeholder="dd/mm/yyyy" type="date"></asp:TextBox>
             <p></p>
         </center>
        <p>
            <asp:Button ID="regbtn" runat="server" class="btn btn-success btn-primary btn-lg" Text="Sign Up!" OnClick="regbtn_Click" /></p>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Player] ([username], [dateofbirth]) VALUES (@username, @dateofbirth)" SelectCommand="SELECT COUNT(playerId) AS playerId FROM Player WHERE (username = @username)">
        
        <InsertParameters>
            <asp:ControlParameter ControlID="username" Name="username" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="dob" DbType="Date" Name="dateofbirth" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="username" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
