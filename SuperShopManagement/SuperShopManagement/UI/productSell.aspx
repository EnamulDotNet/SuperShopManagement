<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="productSell.aspx.cs" Inherits="SuperShopManagement.UI.productSell" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Product Sell
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
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
            
            
        }
        .btn {
            float: left;
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
     <script src="../AutoComplete/jquery.js"></script>
    <script src="../AutoComplete/jquery-ui.js"></script>
    <link href="../AutoComplete/jquery-ui.css" rel="stylesheet" />

 <script type="text/javascript">
     function jScript() {
         $("#searchTextBox").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: "../ui/productSell.aspx/GetProductNames",
                     
                     data: "{'prefix': '" + request.term + "'}",
                     type: "POST",
                     dataType: "Json",
                     contentType: "application/json;charset=utf-8",
                     success: function (data) {
                         response(data.d);
                     },
                     error: function () {
                         alert("url error!");
                     }
                 }); 
             }
             
         });
         
     }

</script>

 

   

   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="sellpage">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>
               <script type="text/javascript">
                Sys.Application.add_load(jScript);
            </script> 
         
        <table>
            <tr>
                <td>
                    Product Name:
                </td>
                <td>
                    
                    <asp:TextBox ID="searchTextBox" ClientIDMode="Static" runat="server" Height="26px"/>
                    
                    
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
               
                    
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productIdTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            
            <tr>
                <td>
                    Product Quantity:
                </td>
                <td>
                    <asp:TextBox ID="productQtyTextBox" runat="server" ReadOnly="True" BackColor="#E1E1E1" Height="26px"></asp:TextBox>
               
                  
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productQtyTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Product Price:
                </td>
                <td>
                    <asp:TextBox ID="productPriceTextBox" runat="server" ReadOnly="True" BackColor="#E1E1E1" Height="26px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productPriceTextBox" ErrorMessage="Empty!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Product Sell Qty:
                </td>
                <td>
                    <asp:TextBox ID="productSellQtyTextBox" runat="server" Height="26px" OnTextChanged="productSellQtyTextBox_TextChanged"></asp:TextBox>

                
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="productSellQtyTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Positive value only!" ControlToValidate="productSellQtyTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    
               
                    <asp:Label runat="server" ID="lblSellUnit" Text=""></asp:Label>
                </td>
            </tr>
            
            <tr>
               <td></td>
                
                <td>
                    <asp:Button ID="btnAdd" CssClass="btn" runat="server" Text="Add" OnClick="btnAdd_Click" Height="33px" Width="71px" />
                    <br />
                    <br />
                    <asp:Label ID="sellqtyLabel" runat="server" ForeColor="#FF3300"></asp:Label>
                    
                     </td>
            </tr>
        </table>
            </ContentTemplate>
            <Triggers>
     <asp:PostBackTrigger  ControlID="btnAdd"/> 
    </Triggers>
        </asp:UpdatePanel>
        

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
    <%--<script type="text/javascript">
        $("#searchTextBox").keypress(function (event) {
            if (event.keyCode === 13) {
                $('#searchButton').click();
            }
        });
    </script>--%>

</asp:Content>
