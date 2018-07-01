using LAB_4.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LAB_4
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewMember_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int memberID = int.Parse(e.CommandArgument.ToString());
                MemberDAO.DeleteMember(memberID);
                GridViewMember.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string name = TextBoxName.Text.Trim();
            string sex = TextBoxSex.Text.Trim();
            string address = TextBoxAddress.Text.Trim();
            string phone = TextBoxPhone.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            MemberDAO.InsertMember(name, sex, address, phone, email);
            GridViewMember.DataBind();
        }
    }
}