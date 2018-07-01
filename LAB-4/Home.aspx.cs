using LAB_4.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LAB_4
{
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridViewBook_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteRow"))
            {
                int bookID = int.Parse(e.CommandArgument.ToString());
                BookDAO.DeleteBook(bookID);
                GridViewBook.DataBind();
            }
        }

        protected void GridViewBook_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
            //    e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewBook, "Select$" + e.Row.RowIndex);
            //    e.Row.ToolTip = "Click to select this row.";
            //}
        }

        protected void GridViewBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridViewBook.Rows)
            {
                if (row.RowIndex == GridViewBook.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                }
            }
            TextBoxBookCode.Text = GridViewBook.SelectedDataKey.Value.ToString();
        }

        protected void GridViewCopy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int copyID = int.Parse(e.CommandArgument.ToString());
                CopyDAO.DeleteCopy(copyID);
                GridViewCopy.DataBind();
            }
            
        }

        protected void ButtonAddBook_Click(object sender, EventArgs e)
        {
            string title = TextBoxTitle.Text.Trim();
            string author = TextBoxAuthor.Text.Trim();
            string publisher = TextBoxPublisher.Text.Trim();
            int number = int.Parse(TextBoxNumber.Text.Trim());
            BookDAO.InsertBook(title, author, publisher, number);
            GridViewBook.DataBind();
        }

        protected void ButtonAddCopy_Click(object sender, EventArgs e)
        {
            int bookCode = int.Parse(TextBoxBookCode.Text.Trim());
            int copyNum, sequenceNum, price;
            string type = TextBoxType.Text.Trim();
            if (!int.TryParse(TextBoxCopyNumber.Text.Trim(), out copyNum))
            {
                return;
            }
            else if (!int.TryParse(TextBoxSequenceNumber.Text.Trim(), out sequenceNum))
            {
                return;
            } 
            else if (!int.TryParse(TextBoxPrice.Text.Trim(), out price))
            {
                return;
            }
            CopyDAO.InsertCopy(bookCode, copyNum, sequenceNum, type, price);
            GridViewCopy.DataBind();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int number;
            if (int.TryParse(args.Value.Trim(), out number))
            {
                args.IsValid = true;
                return;
            }
            args.IsValid = false;
        }



        //protected void GridViewBook_RowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
        //        e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
        //        e.Row.ToolTip = "Click to select row";
        //        e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewBook, "Select$" + e.Row.RowIndex);
        //    }
        //}
    }
}