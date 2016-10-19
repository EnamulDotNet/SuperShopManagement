<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SuperShopManagement.UI.view" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
       body {
           background-image: url("b18.png");
           margin-left: 500px;
       }
       #gv1 {
           width: 80%;
       } 
       .myclass {
           margin-left: 4%;
       }
       
    </style>
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
    <title>Product View</title>
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

    <div>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox CssClass="myclass" ID="searchTextBox" runat="server" Height="26px"></asp:TextBox>
&nbsp;
        <asp:Button ID="searchButton" runat="server" Height="29px" OnClick="searchButton_Click" Text="Search" />
       <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv1_PageIndexChanging"
            onrowdatabound="gv1_RowDataBound" onrowdeleting="gv1_RowDeleting"
            onrowediting="gv1_RowEditing" DataKeyNames="ProductId" 
            onrowcommand="gv1_RowCommand" onrowupdating="gv1_RowUpdating"
            CellPadding="4" GridLines="None"
            onrowcancelingedit="gv1_RowCancelingEdit" ForeColor="#333333" >
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns >
        <asp:TemplateField HeaderText="Sl. No.">
 
        <ItemTemplate>
        <%# Eval("ProductId") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>'></asp:Label>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:LinkButton ID="lnkinsert" runat="server" Text= "Insert" CommandName="Insert" ></asp:LinkButton>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductName" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductName" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductDescription") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductDescription" runat="server" Text='<%#Eval("ProductDescription") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductDescription" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Catagory" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("CatagoryName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:DropDownList ID="ddlCatagory" runat="server" width ="150px">
                </asp:DropDownList>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:DropDownList ID="ddladdCatagory" runat="server" Width="150px">
                </asp:DropDownList>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductQty") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductQty" runat="server" Text='<%#Eval("ProductQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductQty" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="  Buy Price" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductBuyPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductBuyPrice" runat="server" Text='<%#Eval("ProductBuyPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductBuyPrice" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="  Sell Price  " ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductSellPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductSellPrice" runat="server" Text='<%#Eval("ProductSellPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductSellPrice" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton ="true" ControlStyle-ForeColor ="Blue " >
<ControlStyle ForeColor="Blue"></ControlStyle>
            </asp:CommandField>
            <asp:TemplateField>
            <ItemTemplate>
            <asp:LinkButton CommandName ="Delete" CommandArgument ='<%#Eval("ProductId") %>' runat="server" ID ="lnkdelete" Text="Delete" ></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            </Columns>
 
            <EditRowStyle BackColor="#999999" />
 
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
 
        </asp:GridView>
    </div>
    </form>
</body>
</html>
