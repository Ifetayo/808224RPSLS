<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_808224RPSLS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="width: 300px">
            <asp:Panel ID="flashpanel" runat="server" Visible="false">
                <div class="alert alert-danger alert-dismissable" style="margin-top: 25px">
                    <asp:Button ID="flashclosebtn" aria-hidden="true" data-dismiss="alert" class="close" type="button" runat="server" Text="x"/>
                    <asp:Label ID="errolbl" runat="server" Text=""/>
                </div>
            </asp:Panel>
            <div class="center">
                <h1>Login</h1>
            </div>
            <hr>
            <div class="form-group">
                <asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="username"></asp:TextBox>
            </div>
            <asp:Button ID="loginbtn" runat="server" CssClass="btn btn-success btn-primary btn-lg" Text="Go!" OnClick="loginbtn_Click" />
        </div>
    </div>
    <asp:SqlDataSource ID="LoginDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Player] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:ControlParameter ControlID="username" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
