<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" ViewStateMode="Enabled" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="_808224RPSLS.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <marquee runat="server" visible="false" class="well well-sm" id="marq">
        <asp:Label ID="birthdaylbl" runat="server" Text=""></asp:Label></marquee>
    <asp:Panel ID="gameresultpnl" runat="server" Visible="false">
        <div class="panel panel-info">
            <div class="panel-heading">Game Result</div>
            <h3>
                <asp:Label ID="resultlbl" runat="server" Text="Label"></asp:Label></h3>
            <asp:Label ID="infolbl" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:Panel>
    <div class="row">
        <div class="col-lg-2">
            <asp:GridView ID="GameView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>

                    <asp:BoundField DataField="status" HeaderText="Outcome" SortExpression="status" />
                    <asp:BoundField DataField="numb" HeaderText="Count" SortExpression="numb" ReadOnly="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    No game history.<br />
                </EmptyDataTemplate>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <PagerTemplate>
                    
                </PagerTemplate>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>

        <div class="col-lg-10">
            <div class="col-md-3 col-md-offset-2" style="width: 200px">
                <asp:Table ID="Table2" runat="server" Height="200px">
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="scbtn" OnClick="UserChoice" BackColor="#ebbbf9" CssClass="btn btn-default btn-lg" runat="server" Text="Scissors" />
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="spkbtn" OnClick="UserChoice" BorderWidth="0" BackColor="#bbd3f7" CssClass="btn btn-primary btn-lg" runat="server" Text="Spock" />
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="pprbtn" OnClick="UserChoice" BorderWidth="0" BackColor="#f9ebbc" CssClass="btn btn-primary btn-lg" runat="server" Text="Paper" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="lzdbtn" OnClick="UserChoice" BorderWidth="0" BackColor="#bdeabf" CssClass="btn btn-primary btn-lg" runat="server" Text="Lizard" />
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="rckbtn" OnClick="UserChoice" BorderWidth="0" BackColor="#f9bbbc" CssClass="btn btn-primary btn-lg" runat="server" Text="Rock" />
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="PlayerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Games] ([datetimeplayed], [status], [playerid]) VALUES (@datetimeplayed, @status, @playerid)" SelectCommand="select status, COUNT(Games.status) as numb FROM Games 
where ([playerid] = @playerid) group by Games.status">
        <InsertParameters>
            <asp:Parameter Name="datetimeplayed" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="playerid" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="playerid" SessionField="userId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
