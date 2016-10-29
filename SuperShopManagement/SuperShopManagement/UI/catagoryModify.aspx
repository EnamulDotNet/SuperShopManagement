<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="catagoryModify.aspx.cs" Inherits="SuperShopManagement.UI.catagoryModify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Catagory Modify
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        .catagory {
            
            margin: 4% 24%;
            width: 32%;
            
            background-color: white;
        }
        .save {
            background-color: lightskyblue;
        }
        .save:hover {
            background-color: lightblue;
        }
        
        td{
            padding: 6px;
            text-align: center;
        }
        .MyLinkButtons {
            background-color: lightsalmon;
            color: white;
        }
        .MyLinkButtons:hover {
            background-color: darkgoldenrod;
        }
        .seabtn {
            background-color: peachpuff;
            color: blue;
        }
        .seabtn:hover {
            background-color: darkgoldenrod;
           
        }
       
       
         </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="catagory">
        <asp:TextBox CssClass="myclass" ID="searchTextBox" runat="server" Height="26px"></asp:TextBox>

        <asp:Button ID="searchButton" CssClass="seabtn" runat="server" Height="33px" OnClick="searchButton_Click" Text="Search" Width="72px" />
        <br/><br/>
    <asp:gridview runat="server" ID="catGridView" AutoGenerateColumns="False" AllowPaging="True"
         OnPageIndexChanging="OnPageIndexChanging" PageSize="10" DataKeyNames="CatagoryId" 
        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating"
        OnRowDataBound="GridView1_RowDataBound" Width="661px" CellPadding="10" ForeColor="Black" GridLines="Both" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField ItemStyle-Width="150px" DataField="CatagoryId" ReadOnly="True" HeaderText="ID" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField ItemStyle-Width="150px" DataField="CatagoryName" HeaderText="Catagory" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            
            <asp:TemplateField HeaderText="Unit">
                <ItemTemplate>
                    <%#Eval("MeasurementName") %>
                    <%--<asp:Label ID="lbllocation" runat="server" Text='<%#Bind("MeasurementName") %>'></asp:Label>--%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlUnit" runat="server" Width="150px"></asp:DropDownList>
                    <asp:Label ID="lblloc" runat="server" Text='<%#Bind("MeasurementName") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField ItemStyle-Width="150px" DataField="CatagoryDescription" HeaderText="Description" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField ItemStyle-Width="150px" DataField="CreateDate" ReadOnly="True" HeaderText="Date" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:CommandField ItemStyle-Width="300px" ButtonType="Button" HeaderText="Action" DeleteText="Remove" EditText="Modify" ShowEditButton="True" ShowDeleteButton="True" ><ControlStyle CssClass="MyLinkButtons" />


<ItemStyle Width="600px"></ItemStyle>


            </asp:CommandField>

        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        <RowStyle Height="20px" />
    </asp:gridview>
        <br/>
        <asp:Label ID="catagoryModifyStatusLabel" runat="server" Text=""></asp:Label>
        </div>
    <script>
        $("#catamodimenu").addClass("active");
    </script>
    
</asp:Content>
