<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LAB_4.Home" EnableEventValidation="False" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/materialize.css" rel="stylesheet" />
    <script src="js/materialize.js"></script>
</head>
<body class="bg-cool-sky">
    <form id="form1" runat="server">

        <nav>
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo center">Library Management</a>
                <ul class="left hide-on-med-and-down">
                    <li class="active"><a href="Home.aspx">Book</a></li>
                    <li><a href="Member.aspx">Member</a></li>
                    <li><a href="Reserve.aspx">Reserve</a></li>
                </ul>
            </div>
        </nav>
        <h1>Book Information</h1>

        <table style="width: 100%; border-collapse: collapse">
            <tr>
                <td>Title 
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title can't be empty" ControlToValidate="TextBoxTitle" ValidationGroup="group1" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>Publisher
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPublisher" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Publisher can't be empty" ControlToValidate="TextBoxPublisher" ValidationGroup="group1" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Author
                </td>
                <td>
                    <asp:TextBox ID="TextBoxAuthor" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Author can't be empty" ControlToValidate="TextBoxAuthor" ValidationGroup="group1" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>Number
                </td>
                <td>
                    <asp:TextBox ID="TextBoxNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Number can't be empty" ControlToValidate="TextBoxNumber" ValidationGroup="group1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBoxNumber" Display="Dynamic" ErrorMessage="Must be a number" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="group1" ForeColor="Red"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <div class="rounded_corners" style="display: inline-block">
            <asp:GridView ID="GridViewBook" runat="server" AutoGenerateColumns="False" DataKeyNames="BookCode" DataSourceID="SqlDataSource1" OnRowCommand="GridViewBook_RowCommand" AllowPaging="True" OnSelectedIndexChanged="GridViewBook_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                    <asp:BoundField DataField="BookNumber" HeaderText="Book Number" SortExpression="BookNumber" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="ButtonDelete" runat="server" CommandArgument='<%# Eval("BookCode") %>' CommandName="DeleteRow" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab_3ConnectionString %>" SelectCommand="SELECT * FROM [tbl_Book]"></asp:SqlDataSource>
        </div>

        <br />
        <asp:Button ID="ButtonAddBook" runat="server" Text="Add Book" OnClick="ButtonAddBook_Click" ValidationGroup="group1" />

        <h1>Copy Book Information</h1>
        <table style="width: 100%; border-collapse: collapse">
            <tr>
                <td>Book Code</td>
                <td>
                    <asp:TextBox ID="TextBoxBookCode" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxBookCode" Display="Dynamic" ErrorMessage="Choose a book above" ValidationGroup="group2" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>Copy Number</td>
                <td>
                    <asp:TextBox ID="TextBoxCopyNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Copy Number can't be empty" ControlToValidate="TextBoxCopyNumber" ValidationGroup="group2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Sequence Number</td>
                <td>
                    <asp:TextBox ID="TextBoxSequenceNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Sequence number can't be empty" ControlToValidate="TextBoxSequenceNumber" ValidationGroup="group2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>Type</td>
                <td>
                    <asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Type can't be empty" ControlToValidate="TextBoxType" ValidationGroup="group2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>Price</td>
                <td>
                    <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Price can't be empty" ControlToValidate="TextBoxPrice" ValidationGroup="group2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
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
        <br />
        <asp:Button ID="ButtonAddCopy" runat="server" Text="Add Copy" OnClick="ButtonAddCopy_Click" ValidationGroup="group2" />

    </form>
</body>
</html>
