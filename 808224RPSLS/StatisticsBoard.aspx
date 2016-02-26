<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StatisticsBoard.aspx.cs" Inherits="_808224RPSLS.StatistcsBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <div class="jumbotron" style="background-color:white">   
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="377px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="User name" SortExpression="username" />
                <asp:BoundField DataField="status" HeaderText="Outcome" SortExpression="status" />
                <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                No Games History.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        </div></center>
<asp:SqlDataSource ID="StatDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select Player.username, Games.status, COUNT(Games.status) as Count FROM Games 
inner join Player on Player.playerId = Games.playerid
group by Player.username, Games.status order by Player.username"></asp:SqlDataSource>
        
</asp:Content>
