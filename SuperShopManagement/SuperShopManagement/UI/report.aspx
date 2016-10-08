<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="SuperShopManagement.UI.report" %>

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
                From date:
            </td>
            <td>
                <asp:TextBox ID="fromDateTextBox" runat="server"></asp:TextBox>
            </td>
            <td>
                
            </td>
            <td>
                To Date:
            </td>
            <td>
                <asp:TextBox ID="toDateTextBox" runat="server"></asp:TextBox>
            </td>
            <td>
                
            </td>
            <td>
                <asp:Button ID="showReportButton" runat="server" Text="Show Report" /> 
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
