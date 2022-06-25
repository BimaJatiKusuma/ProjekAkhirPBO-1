using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace IniU_Net.models
{
    public class SqlDBHelper
    {

            private NpgsqlConnection connection;
            public SqlDBHelper()
            {
                connection = new NpgsqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["Server=localhost;Port=5432;User Id=postgres;Password=218218;Database=pariwisata;CommandTimeout=10"].ToString();
            }

            public DataTable ExecuteQuery_sqlDB(string sql)
            {
                DataTable dt = new DataTable();
                try
                {
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = sql; // "select * from users.person";
                    cmd.CommandType = CommandType.Text;
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();
                }
                catch (Exception ex) { }

                return dt;
            }


            public DataTable ExecuteQuery_sqlDB(string sql, params NpgsqlParameter[] parameters)
            {
                DataSet ds = new DataSet();
                NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
                foreach (var item in parameters)
                {
                    cmd.Parameters.Add(item);
                }

                try
                {
                    cmd.Connection.Open();
                    new NpgsqlDataAdapter(cmd).Fill(ds);
                }
                catch (NpgsqlException ex)
                {
                    //Show a message or log a message on ex.Message
                }
                return ds.Tables[0];
            }

            public void ExecuteQuery_sqlDB(ref DataTable dt, string sql)
            {
                try
                {
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = sql; // "select * from users.person";
                    cmd.CommandType = CommandType.Text;
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();
                }
                catch (Exception ex) { }
            }


            public void ExecuteNonQuery_sqlDB(string sql, params NpgsqlParameter[] parameters)
            {
                DataSet ds = new DataSet();
                NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
                foreach (var item in parameters)
                {
                    cmd.Parameters.Add(item);
                }

                try
                {
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
                catch (NpgsqlException ex)
                {
                    //Show a message or log a message on ex.Message
                }
            }

            public void ExecuteNonQuery_sqlDB(string query)
            {
                try
                {
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    cmd.Dispose();
                    connection.Close();

                }
                catch (Exception ex) { }
            }

        }
}