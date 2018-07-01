<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="LAB_4.Reserve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reserve</title>
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
                        <li><a href="Member.aspx">Member</a></li>
                        <li class="active"><a href="Reserve.aspx">Reserve</a></li>
                    </ul>
                </div>
            </nav>
            <h1>Book Copy Information</h1>
            <table style="width: 100%; border-collapse: collapse">
                <tr>
                    <td>Member Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    <td>Book Code</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    <td>Copy Code</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Borrow Number</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td>Borrow Date</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <h3>Due Date</h3>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <h3>Book Copy List</h3>
            <div class="rounded_corners" style="display: inline-block">
                <asp:GridView ID="GridViewCopy" runat="server" AutoGenerateColumns="False" DataKeyNames="CopyCode" DataSourceID="SqlDataSource2" OnRowCommand="GridViewCopy_RowCommand" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="CopyCode" HeaderText="Copy Code" InsertVisible="False" ReadOnly="True" SortExpression="CopyCode" />
                        <asp:BoundField DataField="BookCode" HeaderText="Book Code" SortExpression="BookCode" />
                        <asp:BoundField DataField="CopyNumber" HeaderText="Copy Number" SortExpression="CopyNumber" Visible="False" />
                        <asp:BoundField DataField="SequenceNumber" HeaderText="Sequence Number" SortExpression="SequenceNumber" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("CopyCode") %>' CommandName="DeleteRow" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab_3ConnectionString2 %>" SelectCommand="SELECT * FROM [tbl_Copy]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
