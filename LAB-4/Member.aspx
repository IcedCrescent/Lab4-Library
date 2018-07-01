<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="LAB_4.Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Members</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/materialize.css" rel="stylesheet" />
    <script src="js/materialize.js"></script>
</head>
<body class="bg-cool-sky">
    <form id="form1" runat="server">
        <div>
            <nav>
                <div class="nav-wrapper">
                    <a href="#!" class="brand-logo center">Library Management</a>
                    <ul class="left hide-on-med-and-down">
                        <li><a href="Home.aspx">Book</a></li>
                        <li class="active"><a href="Member.aspx">Member</a></li>
                        <li><a href="Reserve.aspx">Reserve</a></li>
                    </ul>
                </div>
            </nav>
            <h1>Member information</h1>
            <table style="width: 100%; border-collapse: collapse">
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name can't be empty" ControlToValidate="TextBoxName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>Sex</td>
                    <td>
                        <asp:TextBox ID="TextBoxSex" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Sex can't be empty" ControlToValidate="TextBoxSex" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address can't be emtpy" ControlToValidate="TextBoxAddress" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>Telephone</td>
                    <td>
                        <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone can't be empty" ControlToValidate="TextBoxPhone" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="Invalid Email Format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Member List"></asp:Label>
        <br />
        <div class="rounded_corners" style="display: inline-block">
            <asp:GridView ID="GridViewMember" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MemberCode" DataSourceID="SqlDataSource1" OnRowCommand="GridViewMember_RowCommand">
                <Columns>
                    <asp:BoundField DataField="MemberCode" HeaderText="MemberCode" InsertVisible="False" ReadOnly="True" SortExpression="MemberCode" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("MemberCode") %>' CommandName="DeleteRow" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab_3ConnectionString3 %>" SelectCommand="SELECT * FROM [tbl_Member]"></asp:SqlDataSource>
        <asp:Button ID="ButtonAdd" runat="server" Text="Add Member" OnClick="ButtonAdd_Click" />
        <br />
    </form>
</body>
</html>
