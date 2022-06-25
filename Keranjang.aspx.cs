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

public partial class Keranjang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowData();
        }
    }

    /*Tiket Dipesan*/
    //Connection String from web.config File  
    //ShowData method for Displaying Data in Gridview  
    protected void ShowData()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "select pariwisata_id, pariwisata_nama, lokasi, harga, keterangan from pariwisata order by pariwisata_id";
        cmd.CommandType = CommandType.Text;
        NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        connection.Close();

    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        GridView1.EditIndex = e.NewEditIndex;
        ShowData();
    }
    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //Finding the controls from Gridview for the row which is going to update  
        Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        TextBox name = GridView1.Rows[e.RowIndex].FindControl("txt_PariwisataNama") as TextBox;
        TextBox city = GridView1.Rows[e.RowIndex].FindControl("txt_lokasi") as TextBox;
        TextBox harga = GridView1.Rows[e.RowIndex].FindControl("txt_harga") as TextBox;
        TextBox keterangan = GridView1.Rows[e.RowIndex].FindControl("txt_keterangan") as TextBox;

        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = ("Update pariwisata set lokasi='" + city.Text + "',harga='" + harga.Text + "',Keterangan='" + keterangan.Text + "' where pariwisata_nama='" + name.Text + "'");
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        connection.Close();
        GridView1.EditIndex = -1;
        ShowData();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView1.EditIndex = -1;
        ShowData();
    }


    protected void btnInsertionPariwisata(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "Insert into pariwisata(pariwisata_nama, harga, lokasi, keterangan) values(@Nama,@Harga,@Lokasi,@Keterangan)";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new NpgsqlParameter("@Nama", txtNama.Text));
        cmd.Parameters.Add(new NpgsqlParameter("@Harga", Convert.ToInt32(txtHarga.Text)));
        cmd.Parameters.Add(new NpgsqlParameter("@Lokasi", txtLokasi.Text));
        cmd.Parameters.Add(new NpgsqlParameter("@Keterangan", txtKeterangan.Text));
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        connection.Close();
        txtNama.Text = "";
        txtHarga.Text = "";
        txtLokasi.Text = "";
        txtKeterangan.Text = "";
        labeltambahpariwisata.Text = "Data Has been Saved";
        ShowData();
    }


    protected void btnDelete(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "Delete from pariwisata where pariwisata_id=@ID";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new NpgsqlParameter("@ID", Convert.ToInt32(txtIDdelete.Text)));
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        connection.Close();
        txtIDdelete.Text = "";
        tandapesan.Text = "Data Has been Deleted";
        ShowData();
    }

    protected void btnSave(object sender, EventArgs e)
    {
        Response.Redirect("MainContent.aspx");
    }
}