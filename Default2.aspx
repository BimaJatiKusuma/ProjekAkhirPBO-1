<%@ Page Title="Main Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
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
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <div class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </div>
  </div>
</nav>
<!--navbar_end-->

<div class="separator">
    <h1>Separator</h1>
    <h2>log_in</h2>
</div>

<!--Login Form-->
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

          <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="form3Example3">Email address</label>
            <asp:TextBox type="email" ID="LoginEmail" runat="server" CssClass="form-control from-control-lg" placeholder="Enter a valid email address"></asp:TextBox>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <label class="form-label" for="form3Example4">Password</label>
            <asp:TextBox type="password" ID="LoginPassword" runat="server" CssClass="form-control from-control-lg" placeholder="Enter password"></asp:TextBox>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <asp:Button type="button" CssClass="btn btn-primary btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem" runat="server" Text="Login" OnClick="btnLogin"/>
            <asp:Label ID="login_tandapesan" runat="server"></asp:Label>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                class="link-danger">Register</a></p>
          </div>


      </div>
    </div>
  </div>
  <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2020. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>
</section>
<!--login_end-->

<div class="separator">
    <h1>Separator</h1>
    <h2>sign_up2</h2>
</div>

<!--sign_up2-->
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
          
          <asp:Button ID="btnInsertion" runat="server" class="btn btn-primary" Text="Daftar" OnClick="btnInsertion_Click"  />
            <asp:Label ID="tandapesan" runat="server" ForeColor="Green"></asp:Label>
    </div>
<!--sign_up2_end-->

<div class="separator">
    <h1>Separator</h1>
    <h2>check_out</h2>
</div>

<!--check_out-->
<div class="container">
    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Billing address</h4>
        <div class="needs-validation" novalidate="">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="NamaPengguna">Nama</label>
                    <input type="text" class="form-control" id="NamaPengguna" placeholder="Nama Lengkap" value="">
                </div>
            </div>
            <div class="mb-3">
                <label for="username">No Telepon</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="username" placeholder="No Telepon">
                </div>
            </div>
            <div class="mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
            </div>
            <div class="row">
                <div class="col-md-5 mb-3">
                    <label for="Nama Pariwisaata">Nama Pariwisata</label>
                    <input type="text" class="form-control" id="NamaPariwisata" placeholder="Nama pariwisata">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="Tiket Pariwisata">Jumlah Tiket</label>
                    <input type="number" class="form-control" id="COJumlahTiket" placeholder="Jumlah Tiket">
                </div>
                <div class="col-md-3 mb-3">
                    <label for="Total Harga">Total Harga</label>
                    <input type="number" class="form-control" id="TotalHarga" placeholder="Total Harga">
                </div>
            </div>
            
            <!--List Pembelian Tiket-->
           <div>      
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_pariwisata_id" runat="server" Text='<%#Eval("pariwisata_id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="Nama Pariwisata">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_PariwisataNama" runat="server" Text='<%#Eval("pariwisata_nama") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_PariwisataNama" runat="server" Text='<%#Eval("pariwisata_nama") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                
                <asp:TemplateField HeaderText="Lokasi">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_lokasi" runat="server" Text='<%#Eval("lokasi") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_lokasi" runat="server" Text='<%#Eval("lokasi") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Harga">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_harga" runat="server" Text='<%#Eval("harga") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_harga" runat="server" Text='<%#Eval("harga") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Keterangan">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_keterangan" runat="server" Text='<%#Eval("keterangan") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_keterangan" runat="server" Text='<%#Eval("keterangan") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>  
       </div>  



            <h4 class="mb-3">Payment</h4>
            <div class="form-group">
                <asp:Label ID="MetodePembayaran" runat="server" Text="Pilih Metode Pembayaran" Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="ddlMetodePembayaran" class="form-control input-sm floatlabel" runat="server"></asp:DropDownList>
            </div>

                
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
        </div>
    </div>
</div>
    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2017-2019 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
<!--check_out_end-->

<div class="separator">
    <h1>Separator</h1>
    <h2>content</h2>
</div>

<!--content-->
<div>
    <asp:Label ID="Label1" runat="server" Text="Webiste IniU_NET"></asp:Label>
    <h1>Hallo World</h1>
    <asp:Image ID="Image1" ImageUrl="~/assets/gambar1.jpg" runat="server" style="width: 100px;"/>

    <asp:Label ID="LabelViewPrwst" runat="server" OnLoad="ShowPariwisata"/>
    <asp:GridView ID="tampilData1" runat="server"></asp:GridView>
</div>

<div class="form-group">
    <asp:Label ID="LabelPariwisataNama" runat="server" Text="Nama Pariwisata" Font-Bold="true"></asp:Label>
    <asp:DropDownList ID="ddlPariwisataNama" class="form-control input-sm floatlabel" runat="server"></asp:DropDownList>
</div>

<div>
    <asp:Label ID="JumlahTiket" runat="server" Text="Jumlah Tiket"></asp:Label>
    <asp:TextBox ID="txtJumlahTiket" runat="server" type="number" value="1" min="1"></asp:TextBox>
</div>
<div>
    <asp:TextBox ID="txtTglBeliTiket" runat="server" type="date"></asp:TextBox>
</div>
<div>
    <asp:Button ID="btnPariwisata_harga" runat="server" Text="Selesai" OnClick="ShowPariwisata_Harga" />
</div>
<div>
    <table>
        <tr>
            <td>Total Harga</td>
            <td><asp:GridView ID="tampilPariwisata_harga" runat="server"></asp:GridView></td>
        </tr>

    </table>
</div>

<div>
    <asp:Button ID="Confirm1" runat="server" Text="Konfirmasi"/>
</div>

<div>
</div>
<!--content_end-->


</asp:Content>