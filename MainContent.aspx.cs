using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Npgsql;
using IniU_Net.models;

public partial class MainContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindPariwisataNama();
            bindMetodePembayaran();
        }
    }

    protected void ShowPariwisata(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "Select pariwisata_nama as pariwisata,lokasi,harga,keterangan from pariwisata order by pariwisata_nama";
        cmd.CommandType = CommandType.Text;
        NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.Dispose();
        connection.Close();

        tampilData1.DataSource = dt;
        tampilData1.DataBind();
    }



    protected void ShowPariwisata_Harga(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "select harga * @jumlah_tiket as Total from pariwisata where (pariwisata_nama) ilike @pariwisata_nama";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new NpgsqlParameter("@pariwisata_nama", ddlPariwisataNama.Items[ddlPariwisataNama.SelectedIndex].Text));
        cmd.Parameters.Add(new NpgsqlParameter("@jumlah_tiket", Convert.ToInt32(txtJumlahTiket.Text)));
        NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.Dispose();
        connection.Close();

        tampilPariwisata_harga.DataSource = dt;
        tampilPariwisata_harga.DataBind();
    }


 
    private void bindPariwisataNama()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        DataSet dsPariwisataNama = getPariwisataNama();
        if (dsPariwisataNama.Tables[0].Rows.Count > 0)
        {
            ddlPariwisataNama.DataSource = dsPariwisataNama.Tables[0];
            ddlPariwisataNama.DataTextField = "pariwisata_nama";
            ddlPariwisataNama.DataValueField = "pariwisata_nama";
            ddlPariwisataNama.DataBind();
        }
        ddlPariwisataNama.Items.Insert(0, new ListItem("--Select Pariwisata--", "0"));
    }
    private DataSet getPariwisataNama()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        DataSet dsGetPariwisataNama = new DataSet();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        if (connection.State == ConnectionState.Closed)
        {
            connection.Open();
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select (pariwisata_nama) from pariwisata";
        cmd.Connection = connection;
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter(cmd);
        sda.Fill(dsGetPariwisataNama);
        return dsGetPariwisataNama;
    }


    private void bindMetodePembayaran()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        DataSet dsMetodePembayaran = getMetodePembayaran();
        if (dsMetodePembayaran.Tables[0].Rows.Count > 0)
        {
            ddlMetodePembayaran.DataSource = dsMetodePembayaran.Tables[0];
            ddlMetodePembayaran.DataTextField = "metode_pembayaran_nama";
            ddlMetodePembayaran.DataValueField = "metode_pembayaran_nama";
            ddlMetodePembayaran.DataBind();
        }
        ddlMetodePembayaran.Items.Insert(0, new ListItem("-Pilih Metode Pembayaran--", "0"));
    }
    private DataSet getMetodePembayaran()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        DataSet dsGetMetodePembayaran = new DataSet();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        if (connection.State == ConnectionState.Closed)
        {
            connection.Open();
        }
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select metode_pembayaran_nama from metode_pembayaran";
        cmd.Connection = connection;
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter(cmd);
        sda.Fill(dsGetMetodePembayaran);
        return dsGetMetodePembayaran;
    }


}