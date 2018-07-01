using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace LAB_4.DAL
{
    public class CopyDAO
    {
        static string connectionString = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        public static void DeleteCopy(int copyID)
        {
            string deleteCmd = @"delete from tbl_Copy WHERE CopyCode = @id";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(deleteCmd, conn))
                {
                    conn.Open();
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = copyID;
                    cmd.ExecuteNonQuery();
                }
                if (conn.State != ConnectionState.Connecting)
                    conn.Close();
            }
        }

        public static void InsertCopy(int code, int copyNum, int sequenceNum, string type, int price)
        {
            string insertCmd = "insert into tbl_Copy (BookCode, CopyNumber, SequenceNumber, [Type], Price) VALUES(@code, @copyNum, @sequenceNum, @type, @price)";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertCmd, conn))
                {
                    conn.Open();
                    cmd.Parameters.Add("@code", SqlDbType.Int).Value = code;
                    cmd.Parameters.Add("@copyNum", SqlDbType.Int).Value = copyNum;
                    cmd.Parameters.Add("@sequenceNum", SqlDbType.Int).Value = sequenceNum;
                    cmd.Parameters.Add("@type", SqlDbType.NChar).Value = type;
                    cmd.Parameters.Add("@price", SqlDbType.Int).Value = price;
                    cmd.ExecuteNonQuery();
                }
                if (conn.State != ConnectionState.Connecting)
                    conn.Close();
            }
        }
    }
}