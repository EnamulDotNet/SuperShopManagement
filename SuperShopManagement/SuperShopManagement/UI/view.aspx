<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SuperShopManagement.UI.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" AllowCustomPaging="True"
            onrowdatabound="gv1_RowDataBound" onrowdeleting="gv1_RowDeleting"
            onrowediting="gv1_RowEditing" DataKeyNames="ProductId" ShowFooter="True"
            onrowcommand="gv1_RowCommand" onrowupdating="gv1_RowUpdating"
            CellPadding="4" GridLines="None"
            onrowcancelingedit="gv1_RowCancelingEdit" ForeColor="#333333" >
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns >
        <asp:TemplateField HeaderText="Sl. No." ItemStyle-HorizontalAlign="Center">
 
        <ItemTemplate>
        <%# Eval("ProductId") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>'></asp:Label>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:LinkButton ID="lnkinsert" runat="server" Text= "Insert" CommandName="Insert" ></asp:LinkButton>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Name" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductName" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductName" runat="server"></asp:TextBox>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Product Description" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductDescription") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductDescription" runat="server" Text='<%#Eval("ProductDescription") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductDescription" runat="server"></asp:TextBox>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Catagory" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("CatagoryName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:DropDownList ID="ddlCatagory" runat="server" width ="150px">
                </asp:DropDownList>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:DropDownList ID="ddladdCatagory" runat="server" Width="150px">
                </asp:DropDownList>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Product Qty" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductQty") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductQty" runat="server" Text='<%#Eval("ProductQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductQty" runat="server"></asp:TextBox>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Product Buy Price" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductBuyPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductBuyPrice" runat="server" Text='<%#Eval("ProductBuyPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductBuyPrice" runat="server"></asp:TextBox>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Sell Price" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductSellPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductSellPrice" runat="server" Text='<%#Eval("ProductSellPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductSellPrice" runat="server"></asp:TextBox>
            </FooterTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
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
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
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
