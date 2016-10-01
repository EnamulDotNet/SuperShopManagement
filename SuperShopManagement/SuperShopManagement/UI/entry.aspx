<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entry.aspx.cs" Inherits="SuperShopManagement.UI.entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                Product Name 
            </td>
            <td>
                <asp:TextBox ID="productNameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Catagory 
            </td>
            <td>
                <asp:DropDownList ID="catagoryDropdown" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Product Description 
            </td>
            <td>
                <asp:TextBox ID="productDescriptionTextBox" runat="server" TextMode="MultiLine" Width="117px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Quantity 
            </td>
            <td>
                <asp:TextBox ID="productQtyTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Buy Price  
            </td>
            <td>
                <asp:TextBox ID="productBuyPriceTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Sell Price 
            </td>
            <td>
                <asp:TextBox ID="productSellPriceTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="right">
                <asp:Button runat="server" ID="saveButton" Text="Save" OnClick="saveButton_Click"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="saveProductLabel" runat="server" Text=""></asp:Label>
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>
