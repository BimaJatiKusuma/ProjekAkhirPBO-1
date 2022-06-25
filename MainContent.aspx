<%@ Page Title="MainContent" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MainContent.aspx.cs" Inherits="MainContent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!--navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">INIU.NET</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Keranjang">Edit Data</a>
      </li>
    </ul>
    <div class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </div>
  </div>
</nav>

<!--Main Content-->
<asp:Label ID="labelUser" runat="server"></asp:Label>
    <div>
        <h1 style="text-align:center; font-size:5em;font-weight:bold;">INIU.NET</h1>
    </div>

    <div>
        <asp:Label ID="LabelViewPrwst" runat="server" OnLoad="ShowPariwisata"/>
        <asp:GridView ID="tampilData1" runat="server"  CssClass="table table-striped"></asp:GridView>
    </div>


    <div style="padding-left:5%;padding-right:5%;">
  
    <div class="form-group">
        <asp:Label ID="LabelPariwisataNama" runat="server" Text="Nama Pariwisata" Font-Bold="true"></asp:Label>
        <asp:DropDownList ID="ddlPariwisataNama" class="form-control input-sm floatlabel" runat="server"></asp:DropDownList>
    </div>

    <div class="form-group">
        <label for="JumlahTiket">Jumlah Tiket</label>
        <asp:TextBox ID="txtJumlahTiket" runat="server" type="number" value="1" min="1" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="inputTanggal">Pilih Tanggal</label>
        <asp:TextBox ID="txtTglBeliTiket" runat="server" type="date" Text="Pilih Tanggal" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label ID="MetodePembayaran" runat="server" Text="Pilih Metode Pembayaran" Font-Bold="true"></asp:Label>
        <asp:DropDownList ID="ddlMetodePembayaran" class="form-control input-sm floatlabel" runat="server"></asp:DropDownList>
    </div>

    <div class="form-group">
        <asp:Button ID="btnPariwisata_harga" runat="server" Text="Pesan" OnClick="ShowPariwisata_Harga" CssClass="btn btn-primary btn-lg btn-block"/>
    </div>
    <div>
        <table>
            <tr>
                <td>Total Harga</td>
                <td><asp:GridView ID="tampilPariwisata_harga" runat="server"></asp:GridView></td>
            </tr>

        </table>
    </div>
    </div>
    

    <div>
    </div>
</asp:Content>
