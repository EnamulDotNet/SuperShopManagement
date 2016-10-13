<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sell.aspx.cs" Inherits="SuperShopManagement.UI.sell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
    <title>Bootstrap Templates</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    
    <link href="../design/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Juvenile Super Shop </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li><a href="catagory.aspx">Catagory Entry</a> </li>
                    <li><a href="entry.aspx">Products Entry</a> </li>
                    <li><a href="view.aspx">Products Edit/Delete</a> </li>
                    <li><a href="sell.aspx">Sell</a> </li>
                    <li><a href="report.aspx">Report</a> </li>

                </ul>

            </div>
        </div>
    </div>
    <div>

  
        
        <div class="ap" id="sellpage">
        
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
            </div>
        

        <br/>
        <br/>
            <div id="sellpage">
        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="false"
EmptyDataText="No records has been added.">
<Columns>
    <asp:BoundField DataField="ProductId" HeaderText="Product Id" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductQty" HeaderText="Product Quantity" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductTotalPrice" HeaderText="Product Total Price" ItemStyle-Width="120" />
    <asp:BoundField DataField="ProductStockQty" HeaderText="Product Stock Quantity" ItemStyle-Width="120" />

</Columns>
</asp:GridView>
                <br/>
                <asp:Button ID="sellButton" runat="server" Text="Sell" Width="90px" OnClick="sellButton_Click" /> 
            </div>
          
            
      

       

    </div>
    </form>
</body>
</html>
