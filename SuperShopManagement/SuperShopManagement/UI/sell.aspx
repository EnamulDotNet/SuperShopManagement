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
        $("[id$=txtSearch]").autocomplete({
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

    <asp:TextBox ID="txtSearch" runat="server" />
<asp:HiddenField ID="ProductId" runat="server" />
        <asp:TextBox ID="qtyTextBox" runat="server" />
<asp:Button ID="Button1" Text="Add" runat="server" OnClick="Submit" />
        
        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="false"
EmptyDataText="No records has been added.">
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductQty" HeaderText="Product Quantity" ItemStyle-Width="120" />
</Columns>
</asp:GridView>

    </div>
    </form>
</body>
</html>
