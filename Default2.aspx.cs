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

public partial class Default2 : System.Web.UI.Page
{
    protected void btnInsertion_Click(object sender, EventArgs e)
    {
        try /* Deletion After Validations*/
        {

            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
            //connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
            connection.Open();
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "insert into customer(first_name, last_name, email, phone_number, password) values (@FName, @LName, @Email, @Tlp, @Password)";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new NpgsqlParameter("@FName", txtFName.Text));
            cmd.Parameters.Add(new NpgsqlParameter("@LName", txtLName.Text));
            cmd.Parameters.Add(new NpgsqlParameter("@Tlp", txtTlp.Text));
            cmd.Parameters.Add(new NpgsqlParameter("@Email", txtEmail.Text));
            cmd.Parameters.Add(new NpgsqlParameter("@Password", txtPswd.Text));
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            connection.Close();
            txtFName.Text = "";
            txtLName.Text = "";
            txtTlp.Text = "";
            txtEmail.Text = "";
            txtPswd.Text = "";
            tandapesan.Text = "Registrasi Berhasil";
        }
        catch (Exception ex) { }
    }

    protected void btnLogin(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "select first_name||' '||last_name as nama from customer where (email)=@login_email and (password)=@login_password";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new NpgsqlParameter("@login_email", LoginEmail.Text));
        cmd.Parameters.Add(new NpgsqlParameter("@login_password", LoginPassword.Text));
        cmd.ExecuteNonQuery();

        NpgsqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            login_tandapesan.Text = "Login Berhasil";
        }
        else
        {
            login_tandapesan.Text = "Email atau Password Salah";
        }
        cmd.Dispose();
        connection.Close();
        LoginEmail.Text = "";
        LoginPassword.Text = "";
    }

    protected void ShowPariwisata(object sender, EventArgs e)
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "Select * from pariwisata";
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
        cmd.CommandText = "select harga * @jumlah_tiket from pariwisata where (pariwisata_nama) ilike @pariwisata_nama";
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


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindPariwisataNama();
            bindMetodePembayaran();
            ShowData();
        }
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


    /*payment*/
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




    /*Tiket Dipesan*/
    //Connection String from web.config File  
    //ShowData method for Displaying Data in Gridview  
    protected void ShowData()
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;Database=pariwisata;User Id=postgres;Password=218218;");
        connection.Open();
        NpgsqlCommand cmd = new NpgsqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "select pariwisata_id, pariwisata_nama, lokasi, harga, keterangan from pariwisata";
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
        cmd.CommandText = ("Update pariwisata set lokasi='" + city.Text + "',harga='" + harga.Text + "',Keterangan='" + keterangan.Text + "' where pariwisata_nama='" + name.Text+"'");
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
}

