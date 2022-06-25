<%@ Page Title="Keranjang" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Keranjang.aspx.cs" Inherits="Keranjang" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="col-md-8 order-md-1">
        <h1 class="mb-3" style="text-align:center; font-weight:bold;">Data Pariwisata</h1>
        <div class="needs-validation" novalidate="">
          
            <!--List Pembelian Tiket-->
           <div>      
            <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" CellPadding="30" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">  
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

            <!--tambah data pariwisata-->
          <h2>Tambah Data Pariwisata</h2>
          <div style="padding-left:5%;padding-right:5%;">
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputNama">Nama Pariwisata</label>
                <asp:TextBox ID="txtNama" runat="server" CssClass="form-control" placeholder="Nama Pariwisata" type="text"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
              <label for="inputHarga">Harga Satuan (per Tiket)</label>
                <asp:TextBox ID="txtHarga" runat="server" CssClass="form-control" placeholder="Harga @tiket" type="text"></asp:TextBox>
            </div>
          </div>
          <div class="form-group">
            <label for="inputlokasi">Lokasi</label>
              <asp:TextBox ID="txtLokasi" runat="server" CssClass="form-control" placeholder="Lokasi" type="tel"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="inputKeterangan">Keterangan</label>
              <asp:TextBox ID="txtKeterangan" runat="server" CssClass="form-control" placeholder="Keterangan (opsional)" type="text"></asp:TextBox>
          </div>
          
          <a runat="server" href="~/MainContent"><asp:Button ID="btnInsertion" runat="server" class="btn btn-primary" Text="Tambahkan Data" OnClick="btnInsertionPariwisata"/></a>
            <asp:Label ID="labeltambahpariwisata" runat="server" ForeColor="Green"></asp:Label>
        </div>


            <!--hapus data pariwisata-->
            <hr class="mb-4">   
            <hr class="mb-4">
            <h2>Hapus Data Pariwisata</h2>
            <asp:TextBox ID="txtIDdelete" runat="server" CssClass="form-control" placeholder="ID yang akan dihapus"></asp:TextBox>
            <asp:button CssClass="btn btn-primary btn-lg btn-block" type="delete" runat="server" Text="Hapus" OnClick="btnDelete"></asp:button>
            <asp:Label ID="tandapesan" runat="server" ForeColor="Red"></asp:Label>


            <hr class="mb-4">
            <hr class="mb-4">
            <asp:button CssClass="btn btn-primary btn-lg btn-block" type="submit" runat="server" Text="Selesai" OnClick="btnSave"></asp:button>
        </div>
    </div>
</div>

</asp:Content>