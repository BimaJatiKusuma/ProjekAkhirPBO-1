<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-left:5%;padding-right:5%;">
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputFname4">Nama Depan</label>
                <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Nama Depan" type="text"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
              <label for="inputLname4">Nama Belakang</label>
                <asp:TextBox ID="txtLName" runat="server" CssClass="form-control" placeholder="Nama Belakang" type="text"></asp:TextBox>
            </div>
          </div>
          <div class="form-group">
            <label for="inputNomorTelepon">Nomor Telepon</label>
              <asp:TextBox ID="txtTlp" runat="server" CssClass="form-control" placeholder="Nomor Telepon" type="tel"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="inputEmail">Email</label>
              <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="etc@gmail.com" type="email"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="inputPassword">Password</label>
              <asp:TextBox ID="txtPswd" runat="server" CssClass="form-control" placeholder="Password" type="password"></asp:TextBox>
          </div>
          
          <a runat="server" href="~/MainContent"><asp:Button ID="btnInsertion" runat="server" class="btn btn-primary" Text="Daftar" OnClick="btnInsertion_Click"/></a>
            <asp:Label ID="tandapesan" runat="server" ForeColor="Green"></asp:Label>
    </div>
</asp:Content>
