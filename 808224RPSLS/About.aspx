<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="_808224RPSLS.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
        <p></p>
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;</h2>
    <p>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Player] WHERE [playerId] = @playerId" InsertCommand="INSERT INTO [Player] ([playerId], [username], [dateofbirth], [dateofreg]) VALUES (@playerId, @username, @dateofbirth, @dateofreg)" SelectCommand="SELECT * FROM [Player]" UpdateCommand="UPDATE [Player] SET [username] = @username, [dateofbirth] = @dateofbirth, [dateofreg] = @dateofreg WHERE [playerId] = @playerId">
            <DeleteParameters>
                <asp:Parameter Name="playerId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="playerId" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofbirth" />
                <asp:Parameter Name="dateofreg" Type="Object" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofbirth" />
                <asp:Parameter Name="dateofreg" Type="Object" />
                <asp:Parameter Name="playerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    
</asp:Content>
