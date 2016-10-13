<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catagory.aspx.cs" Inherits="SuperShopManagement.UI.catagory" %>

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
    <div class="ap col-md-6 col-md-offset-3">
        <fieldset>
            <legend>Catagory Entry</legend>
            <table>
                <tr>
                    <td>
                        Catagory:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="catagoryNameTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="catagorydescriptionTextBox" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td align="right">
                        <asp:Button ID="catagorySaveButton" runat="server" Text="Save" OnClick="catagorySaveButton_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    
    </div>
     <div class="col-md-6 col-md-offset-3">
    
    <asp:GridView ID="catagoryGridView" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="CatagoryId" HeaderText="Catagory Id"/>
            <asp:BoundField DataField="catagoryName" HeaderText="Catagory Name"/>
            <asp:BoundField DataField="CatagoryDescription" HeaderText="Catagory Description"/>
        </Columns>
    </asp:GridView>
         </div>

        </form>
</body>
</html>
