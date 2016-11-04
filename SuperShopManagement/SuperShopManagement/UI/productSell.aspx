<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="productSell.aspx.cs" Inherits="SuperShopManagement.UI.productSell" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Product Sell
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
     <style type="text/css">
        .sellpage {
            
            margin: 4% 27%;
            width: 32%;
            
            background-color: white;
        }
        .searbtn {
            background-color: peachpuff;
            color: blue;
        }
        .searbtn:hover {
            background-color: sandybrown;
        }
        
        td{
            padding: 6px;
            text-align: center;
            
        }
        .btn {
            float: right;
            background-color: peachpuff;
            color: blue;
            
        }
        .btn:hover {
            background-color: sandybrown;
        }
        .sellbtn {
            float: left;
            background-color: peachpuff;
            color: blue;

        }
        .sellbtn:hover {
            background-color: sandybrown;
        }

        .tolslprc {
            float: right;
            font-weight: bold;
            margin-right: 46px;
        }
        .rettk {
            float: right;
            text-align: right;
        }
       
         </style>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../SearchAutoComplete/jquery-1.10.0.min.js"></script>
    <script src="../SearchAutoComplete/jquery-ui.min.js"></script>
    <link href="../SearchAutoComplete/jquery-ui.css" rel="stylesheet" />
    <%--<script>
        $(function () {
            $('#txtCategoryName').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../WebService/CheckExistingCategory.asmx/CheckCategory",
                        data: "{'categoryName': '" + request.term + "'}",
                        type: "POST",
                        dataType: "Json",
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert('Not Match');
                        }
                    });
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(function () {
            $("[id$=searchTextBox]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("productSell.aspx/GetProductNames") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d,
                                function(item) {
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
    

   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="sellpage">
        
        <table>
            <tr>
                <td>
                    Product Name:
                </td>
                <td>
                    
                    <asp:TextBox ID="searchTextBox" runat="server" Height="26px" ClientIDMode="Static" AutoPostBack="True" OnTextChanged="searchTextBox_TextChanged" />
                    <asp:HiddenField ID="ProductId" runat="server" />
                    

                
                </td>
                
                <td>
                   
                    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" CausesValidation="False" Height="35px" Width="67px" CssClass="searbtn"/>

               
                     </td>
                <td>
                    
                </td>
                </tr>
                
                
            
            <tr>
                <td>
                    Product Id:
                </td>
                <td>
                    <asp:TextBox ID="productIdTextBox" runat="server" ReadOnly="True" BackColor="#E1E1E1" Height="26px"></asp:TextBox>
               
                     </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productIdTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            
            <tr>
                <td>
                    Product Quantity:
                </td>
                <td>
                    <asp:TextBox ID="productQtyTextBox" runat="server" ReadOnly="True" BackColor="#E1E1E1" Height="26px"></asp:TextBox>
               
                     </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productQtyTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Product Price:
                </td>
                <td>
                    <asp:TextBox ID="productPriceTextBox" runat="server" ReadOnly="True" BackColor="#E1E1E1" Height="26px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productPriceTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Product Sell Qty:
                </td>
                <td>
                    <asp:TextBox ID="productSellQtyTextBox" runat="server" Height="26px" OnTextChanged="productSellQtyTextBox_TextChanged"></asp:TextBox>

                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productSellQtyTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Positive value only!" ControlToValidate="productSellQtyTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    
                </td>
            </tr>
            
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="btnAdd" CssClass="btn" runat="server" Text="Add" OnClick="btnAdd_Click" Height="33px" Width="71px" />
                    <br />
                    <br />
                    <asp:Label ID="sellqtyLabel" runat="server" ForeColor="#FF3300"></asp:Label>
                    
                     </td>
            </tr>
        </table>
           
        

        <br/>
        <br/>
            
        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="false" OnRowDataBound="GridView1_OnRowDataBound" ShowFooter="True"
EmptyDataText="No records has been added.">
<Columns>
    <asp:BoundField DataField="ProductId" HeaderText="Product Id" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="ProductQty" HeaderText="Product Quantity" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="ProductTotalPrice" HeaderText="Product Total Price" ItemStyle-Width="120" DataFormatString="{0:N2}" >
<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="ProductStockQty" HeaderText="Product Stock Quantity" ItemStyle-Width="120" Visible="False">

<ItemStyle Width="120px"></ItemStyle>
    </asp:BoundField>

</Columns>
</asp:GridView>
                <br/>
        <asp:Button ID="sellButton" CssClass="sellbtn" runat="server" Text="Sell" Width="101px" OnClick="sellButton_Click" Height="33px" CausesValidation="False" /> 
        <asp:Label ID="sellStatus" runat="server" Text=""></asp:Label>

        <div class="rettk">
        <table>
            <tr>
                <td>
        <asp:Label ID="givenAmountLabel" runat="server" Text="Given Amount"></asp:Label>
                    
                </td>
                <td>
        <asp:TextBox ID="givenAmountTextBox" runat="server" Width="70px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator22" runat="server" ErrorMessage="Invalid!" ControlToValidate="givenAmountTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                    TK.
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="returnLabel" runat="server" Text="Return:"></asp:Label>
                    
                </td>
                <td>
                    <asp:TextBox ID="returnTextBox" runat="server" ReadOnly="True"  Width="70" BackColor="#CCCCCC" ForeColor="Blue"></asp:TextBox>
                    TK.
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td align="left">
        <asp:Button ID="returnButton" runat="server" Text="Return" OnClick="returnButton_Click" BackColor="#FF9999" Height="40px" Width="99px" CausesValidation="False"/>
                    
                </td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="moremoneyLabel" runat="server" Text="" ForeColor="red"></asp:Label>
                </td>
            </tr>
        </table>
        </div>
                
    </div>
        <script>
            $("#prodsellmenu").addClass("active");
        </script>  
    <script type="text/javascript">
        $("#searchTextBox").keypress(function (event) {
            if (event.keyCode === 13) {
                $('#searchButton').click();
            }
        });
    </script>
</asp:Content>
