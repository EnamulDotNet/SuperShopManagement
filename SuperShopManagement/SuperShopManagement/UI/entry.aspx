<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entry.aspx.cs" Inherits="SuperShopManagement.UI.entry" %>

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
    <title>Product Entry</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    
    <link href="../design/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
                            <asp:Button ID="logoutButton" runat="server" BackColor="#0099FF" OnClick="logoutButton_Click" Text="Log Out" />

    <div class="col-md-6 col-md-offset-3 ap">
        <fieldset>
            <legend>Product Entry</legend>
        
                <table class="">
                    <tr>
                        <td>
                            Product Name 
                        </td>
                        <td>
                            <asp:TextBox ID="productNameTextBox"  runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Product Catagory 
                        </td>
                        <td>
                            <asp:DropDownList ID="catagoryDropdown"  runat="server"></asp:DropDownList>
                
                
                        </td>
            
                    </tr>
                    <tr>
                        <td>
                            Product Description 
                        </td>
                        <td>
                            <asp:TextBox ID="productDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                            <asp:Button runat="server" ID="saveButton" Class="pull-right" ForeColor="white" Text="Save" OnClick="saveButton_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="saveProductLabel"  runat="server" Text=""></asp:Label>
                            <br />
                        </td>
                    </tr>

                </table>
            </fieldset>
    </div>
    </form>
</body>
</html>
