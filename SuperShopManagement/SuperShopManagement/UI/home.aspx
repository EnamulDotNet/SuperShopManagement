<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="SuperShopManagement.UI.home" %>

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
                    <a href="catagory.aspx">catagory Entry</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="entry.aspx">Product Entry</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="view.aspx">Product View</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="sell.aspx">Product Sell</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="report.aspx">Sell Report</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td>
                    <asp:Button ID="logoutButton" runat="server" Text="Log Out" OnClick="logoutButton_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
