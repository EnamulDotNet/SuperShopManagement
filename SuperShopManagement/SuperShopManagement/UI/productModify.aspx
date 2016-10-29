<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="productModify.aspx.cs" Inherits="SuperShopManagement.UI.productModify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        .productmodify {
            
            margin: 4% 17%;
           
            
            background-color: white;
        }
        .ase {
            width: 900px !important;

        }
        .save {
            background-color: lightskyblue;
        }
        .save:hover {
            background-color: lightblue;
        }
        
        td{
            padding: 5px;
            
        }
        .seabtn {
            background-color: peachpuff;
            color: white;
        }
        .seabtn:hover {
            background-color: darkgoldenrod;
        }
       
       
         </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="productmodify">
     

        <asp:TextBox CssClass="myclass" ID="searchTextBox" runat="server" Height="26px"></asp:TextBox>

        <asp:Button ID="searchButton" CssClass="seabtn" runat="server" Height="33px" OnClick="searchButton_Click" Text="Search" Width="72px" />
        <br/><br/>
       <asp:GridView ID="gv1" CssClass="ase" runat="server" AutoGenerateColumns ="False" AllowPaging="True" PageSize="10" OnPageIndexChanging="gv1_PageIndexChanging"
            onrowdatabound="gv1_RowDataBound" onrowdeleting="gv1_RowDeleting"
            onrowediting="gv1_RowEditing" DataKeyNames="ProductId" 
            onrowcommand="gv1_RowCommand" onrowupdating="gv1_RowUpdating"
            CellPadding="9"
            onrowcancelingedit="gv1_RowCancelingEdit" Width="503px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" >
        <Columns>
        <asp:TemplateField HeaderText="Sl. No." ItemStyle-HorizontalAlign="Left">
 
        <ItemTemplate >
        <%# Eval("ProductId") %> 
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="lblProductId" runat="server" Width="100px"  Text='<%#Eval("ProductId") %>' ></asp:Label>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:LinkButton ID="lnkinsert" runat="server" Text= "Insert" CommandName="Insert" ></asp:LinkButton>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
            <%#Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductName" runat="server" Width="100" Text='<%#Eval("ProductName") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductName" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductDescription") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductDescription" runat="server" Width="100px" Text='<%#Eval("ProductDescription") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductDescription" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Catagory" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("CatagoryName") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:DropDownList ID="ddlCatagory" runat="server" width ="100px">
                </asp:DropDownList>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:DropDownList ID="ddladdCatagory" runat="server" Width="150px">
                </asp:DropDownList>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductQty") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductQty" runat="server" width="100px" Text='<%#Eval("ProductQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductQty" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="  Buy Price" ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductBuyPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductBuyPrice" runat="server" Width="100px" Text='<%#Eval("ProductBuyPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductBuyPrice" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="  Sell Price  " ItemStyle-HorizontalAlign="Left">
            <ItemTemplate>
            <%#Eval("ProductSellPrice") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="txtProductSellPrice" runat="server" Width="100px" Text='<%#Eval("ProductSellPrice") %>'></asp:TextBox>
            </EditItemTemplate>
            <%--<FooterTemplate >
                <asp:TextBox ID="txtaddProductSellPrice" runat="server"></asp:TextBox>
            </FooterTemplate>--%>

<ItemStyle HorizontalAlign="Center
    "></ItemStyle>
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
 
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Height="50px" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
 
        </asp:GridView>
    </div>
    <script>
        $("#prodmodimenu").addClass("active");
    </script>
</asp:Content>
