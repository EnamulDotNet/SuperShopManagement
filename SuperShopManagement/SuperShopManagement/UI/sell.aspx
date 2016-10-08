<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sell.aspx.cs" Inherits="SuperShopManagement.UI.sell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../SearchAutoComplete/jquery-1.10.0.min.js"></script>
    <script src="../SearchAutoComplete/jquery-ui.min.js"></script>
    <link href="../SearchAutoComplete/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
    $(function () {
        $("[id$=searchTextBox]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("sell.aspx/GetProductNames") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("[id$=ProductId]").val(i.item.val);
            },
            minLength: 1
        });
    });  
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

  
        

        
        <table>
            <tr>
                <td>
                    Product Name:
                </td>
                <td>
                    <asp:TextBox ID="searchTextBox" runat="server" />
                    <asp:HiddenField ID="ProductId" runat="server" />
                </td>
                <td align="right">
                    <asp:Button ID="searchButton" Text="Search" runat="server" OnClick="Submit" />
                </td>
                </tr>
                
                
            
            <tr>
                <td>
                    Product Id:
                </td>
                <td>
                    <asp:TextBox ID="productIdTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    Product Quantity:
                </td>
                <td>
                    <asp:TextBox ID="productQtyTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Product Price:
                </td>
                <td>
                    <asp:TextBox ID="productPriceTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Product Sell Qty:
                </td>
                <td>
                    <asp:TextBox ID="productSellQtyTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    
                </td>
                <td align="right">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
        
        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="false"
EmptyDataText="No records has been added.">
<Columns>
    <asp:BoundField DataField="ProductId" HeaderText="Product Id" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductQty" HeaderText="Product Quantity" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductTotalPrice" HeaderText="Product Total Price" ItemStyle-Width="120" />

</Columns>
</asp:GridView>


       

    </div>
    </form>
</body>
</html>
