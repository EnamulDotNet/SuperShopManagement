<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SuperShopManagement.UI.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False"
            onrowdatabound="gv1_RowDataBound" onrowdeleting="gv1_RowDeleting"
            onrowediting="gv1_RowEditing" DataKeyNames="ProductId" ShowFooter="True"
            onrowcommand="gv1_RowCommand" onrowupdating="gv1_RowUpdating"
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1"
            onrowcancelingedit="gv1_RowCancelingEdit" >
        <Columns >
        <asp:TemplateField HeaderText="ProductId">
 
        <ItemTemplate>
        <%# Eval("ProductId") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>'></asp:Label>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:LinkButton ID="lnkinsert" runat="server" Text= "Insert" CommandName="Insert" ></asp:LinkButton>
            </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
            <%#Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductName" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductName" runat="server"></asp:TextBox>
            </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Product Description">
            <ItemTemplate>
            <%#Eval("ProductDescription") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductDescription" runat="server" Text='<%#Eval("ProductDescription") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductDescription" runat="server"></asp:TextBox>
            </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Catagory">
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
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Product Qty">
            <ItemTemplate>
            <%#Eval("ProductQty") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductQty" runat="server" Text='<%#Eval("ProductQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductQty" runat="server"></asp:TextBox>
            </FooterTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Product Buy Price">
            <ItemTemplate>
            <%#Eval("ProductBuyPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductBuyPrice" runat="server" Text='<%#Eval("ProductBuyPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductBuyPrice" runat="server"></asp:TextBox>
            </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Sell Price">
            <ItemTemplate>
            <%#Eval("ProductSellPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductSellPrice" runat="server" Text='<%#Eval("ProductSellPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate >
                <asp:TextBox ID="txtaddProductSellPrice" runat="server"></asp:TextBox>
            </FooterTemplate>
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
 
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
 
        </asp:GridView>
    </div>
    </form>
</body>
</html>
