using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace LAB_4.DAL
{
    public class BookDAO
    {
        static string connectionString = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        static SqlDataAdapter da = null;
        static DataTable dt = null;
        public static void DeleteBook(int bookID)
        {
            //if (da == null)
            //{
            //    da = new SqlDataAdapter("select * from tbl_Book", connectionString);
            //}
            //if (dt == null)
            //{
            //    dt = new DataTable();
            //    da.Fill(dt);
            //    dt.PrimaryKey = new DataColumn[] { dt.Columns[0] };
            //}
            //DataRow dr = dt.Rows.Find(bookID);
            //string deleteCommand = "DELETE FROM tbl_Book WHERE BookCode = @id";
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = deleteCommand;
            //cmd.Parameters.Add("@id", SqlDbType.Int).Value = bookID;
            //cmd.Connection = new SqlConnection(connectionString);
            //da.DeleteCommand = cmd;
            //da.Update(dt);
            SqlConnection conn = null;
            SqlDataAdapter adapter = new SqlDataAdapter();
            string deleteCommand = "DELETE FROM tbl_Book WHERE BookCode = " + bookID;
            try
            {
                conn = new SqlConnection(connectionString);
                conn.Open();
                adapter.DeleteCommand = conn.CreateCommand();
                adapter.DeleteCommand.CommandText = deleteCommand;
                adapter.DeleteCommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {

                throw e;
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                    conn.Close();
            }
        }

        public static void InsertBook(string title, string author, string publisher, int bookNumber)
        {
            string insertCmd = @"insert into tbl_Book(Title, Author, Publisher, BookNumber) values (@title, @author, @publisher, @number)";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertCmd, conn))
                {
                    try
                    {
                        conn.Open();
                        cmd.Parameters.Add("@title", SqlDbType.NChar).Value = title;
                        cmd.Parameters.Add("@author", SqlDbType.NChar).Value = author;
                        cmd.Parameters.Add("@publisher", SqlDbType.NChar).Value = publisher;
                        cmd.Parameters.Add("@number", SqlDbType.Int).Value = bookNumber;
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }
                }
                if (conn.State != ConnectionState.Connecting)
                    conn.Close();
            }
        }
    }
}