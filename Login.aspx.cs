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

public partial class Login : System.Web.UI.Page
{
    string email;
    public void btnLogin(object sender, EventArgs e)
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
            Response.Redirect("MainContent.aspx");
            email= LoginEmail.Text;
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
}