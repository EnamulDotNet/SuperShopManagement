<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SuperShopManagement.UI.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>
        <asp:TextBox ID="searchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="searchButton" runat="server" Text="Search" />
        <asp:GridView ID="productGridView" runat="server" OnRowDataBound="productGridView_RowDataBound"></asp:GridView>
        
    </div>
    </form>
</body>
</html>
