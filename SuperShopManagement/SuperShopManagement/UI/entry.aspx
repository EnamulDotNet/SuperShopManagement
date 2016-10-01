<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entry.aspx.cs" Inherits="SuperShopManagement.UI.entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 128px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                Product Name 
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="productNameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Catagory 
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="catagoryDropdown" runat="server"></asp:DropDownList>
                <br />
                <asp:LinkButton ID="catagoryAddLinkButton" runat="server">Add new catagory</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                Product Description 
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="productDescriptionTextBox" runat="server" TextMode="MultiLine" Width="117px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Quantity 
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="productQtyTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Buy Price  
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="productBuyPriceTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Sell Price 
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="productSellPriceTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="right" class="auto-style1">
                <asp:Button runat="server" ID="saveButton" Text="Save" OnClick="saveButton_Click"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">
                <asp:Label ID="saveProductLabel" runat="server" Text=""></asp:Label>
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>
