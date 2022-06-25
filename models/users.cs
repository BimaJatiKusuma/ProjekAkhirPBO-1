using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;

namespace IniU_Net.models
{
    public class users
    {
        SqlDBHelper objSqlDb = new SqlDBHelper();

        public users()
        {
        }

        public DataTable getDataUsers()
        {
            string query = "select * from users.person;";
            DataTable dt = objSqlDb.ExecuteQuery_sqlDB(query);
            return dt;
        }

        public void hapusUser(string idPerson)
        {
            string query = "delete from users.person where id_person = :id_person::integer; ";
            objSqlDb.ExecuteNonQuery_sqlDB(query, new NpgsqlParameter(":id_person", idPerson));
        }

        public void updateUser(string idPerson, string nama, string email, string noHp, string alamat)
        {
            string query = @"update users.person set nama =:nama::text,
                                email =:email::text , 
                                no_hp =:no_hp::text,
                                alamat =:alamat::text 
                                where id_person =:id_person::integer;";
            objSqlDb.ExecuteNonQuery_sqlDB(query,
                new NpgsqlParameter(":nama", nama),
                new NpgsqlParameter(":email", email),
                new NpgsqlParameter(":no_hp", noHp),
                new NpgsqlParameter(":alamat", alamat),
                new NpgsqlParameter(":id_person", idPerson)
                );


            /*
            string query = @"update users.person set nama = '{0}',
                                        email = '{1}', 
                                        no_hp = '{2}',
                                        alamat = '{3}' 
                                        where id_person = {4};";
            query = string.Format(query, nama, email, noHp,
                alamat, idPerson);

            objSqlDb.ExecuteNonQuery(query); 
            */
        }

        public void insertUser(string nama, string email, string noHp, string alamat)
        {
            string query = "insert into users.person (nama,email, no_hp,alamat) values ('{0}','{1}','{2}','{3}');";
            query = string.Format(query, nama, email, noHp, alamat);
            objSqlDb.ExecuteNonQuery_sqlDB(query);
        }


    }
}