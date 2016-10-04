<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SuperShopManagement.UI.index" %>

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
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="userNameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td align="right"> 
                    <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click"/>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Label ID="loginStatusLabel" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
