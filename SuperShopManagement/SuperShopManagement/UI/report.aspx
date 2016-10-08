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
        <div>
           <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="false"
EmptyDataText="No records has been added.">
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductQty" HeaderText="Product Quantity" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductSellAmount" HeaderText="Product Sell Amount" ItemStyle-Width="120" />

</Columns>
</asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
