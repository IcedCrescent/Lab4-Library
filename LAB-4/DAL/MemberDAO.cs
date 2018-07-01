using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace LAB_4.DAL
{
    public class MemberDAO
    {
        static string connectionString = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        public static void DeleteMember(int memberID)
        {
            string deleteCmd = @"delete from tbl_Member WHERE MemberCode = @id";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(deleteCmd, conn))
                {
                    conn.Open();
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = memberID;
                    cmd.ExecuteNonQuery();
                }
                if (conn.State != ConnectionState.Connecting)
                    conn.Close();
            }
        }

        public static void InsertMember(string name, string sex, string address, string phone, string email)
        {
            string insertCmd = "insert into tbl_Member (Name, Sex, Address, Telephone, Email) values (@name, @sex, @address, @phone, @email);";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertCmd, conn))
                {
                    conn.Open();
                    cmd.Parameters.Add("@name", SqlDbType.NChar).Value = name;
                    cmd.Parameters.Add("@sex", SqlDbType.NChar).Value = sex;
                    cmd.Parameters.Add("@address", SqlDbType.NChar).Value = address;
                    cmd.Parameters.Add("@phone", SqlDbType.NChar).Value = phone;
                    cmd.Parameters.Add("@email", SqlDbType.NChar).Value = email;
                    cmd.ExecuteNonQuery();
                }
                if (conn.State != ConnectionState.Connecting)
                    conn.Close();
            }
        }
    }
}