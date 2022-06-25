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

public partial class Signup : System.Web.UI.Page
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
            Response.Redirect("MainContent.aspx");
        }
        catch (Exception ex) { }
    }
}