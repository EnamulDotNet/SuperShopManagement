﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="productEntry.aspx.cs" Inherits="SuperShopManagement.UI.productEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        .productentry {
            
            margin: 4% 27%;
            width: 34%;
            
            background-color: white;
        }
        .save {
            background-color: peachpuff;
            color: blue;
        }
        .save:hover {
            background-color: sandybrown;
        }
        
        td{
            padding: 6px;
            
        }
        .savebtn {
            background-color: peachpuff;
            color: blue;
        }
        .savebtn:hover {
            background-color: sandybrown;
        }
        
       
         </style>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../SearchAutoComplete/jquery-1.10.0.min.js"></script>
    <script src="../SearchAutoComplete/jquery-ui.min.js"></script>
    <link href="../SearchAutoComplete/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("[id$=productNameTextBox]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("productsell.aspx/GetProductNames") %>',
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <div class="productentry" id="formt">
         <fieldset>
            <legend>Product Entry</legend>
        
                <table class="">
                    <tr>
                        <td>
                            Name 
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productNameTextBox"  runat="server" Width="200px" Height="26px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="productNameTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Catagory 
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="catagoryDropdown"  runat="server" Height="30px" Width="205px"></asp:DropDownList>
                
                
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="catagoryDropdown" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                
                
                        </td>
            
                    </tr>
                    <tr>
                        <td>
                            Description: 
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productDescriptionTextBox" runat="server" TextMode="MultiLine" Width="200px" Height="47px" Placeholder="(Optional)"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Supplier:
                        </td>
                        <td>
                           
                             <asp:DropDownList runat="server" ID="supplierDropdown" Height="30px" Width="205px"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="supplierDropdown" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                       
                             </td>
                    </tr>
                    <tr>
                        <td>
                           Buy Qty:
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productQtyTextBox" runat="server" Height="26px" Width="200px"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="productQtyTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                           
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Positive value only!" ControlToValidate="productQtyTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>


                        </td>
                    </tr>
                    <tr>
                        <td>
                         Buy Price Per Unit:
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productBuyPriceTextBox" runat="server" Height="26px" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="productBuyPriceTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Positive value only!" ControlToValidate="productBuyPriceTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                       
                             </td>
                    </tr>
                    <tr>
                        <td>
                            Sell Price Per Unit:
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productSellPriceTextBox" runat="server" Height="26px" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="productSellPriceTextBox" ErrorMessage="Required!" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Positive value only!" ControlToValidate="productSellPriceTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                       
                             </td>
                    </tr>
                    <tr>
                        <td>
                            VAT (%):
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="taxTextBox" Height="26px" Width="200px" Placeholder="(Optional)"></asp:TextBox>
                           
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Positive value only!" ControlToValidate="taxTextBox" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td class="auto-style1">
                            <asp:Button runat="server" ID="resetButton" CssClass="savebtn" Text="Reset" Height="40px" Width="90px" OnClick="resetButton_Click" CausesValidation="False"/>                           
                            &nbsp;&nbsp;
                            
                            <asp:Button runat="server" ID="saveButton" CssClass="savebtn" Text="Save" OnClick="saveButton_Click" Height="40px" Width="90px"/>                           
                        
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="auto-style1">
                            <asp:Label ID="saveProductLabel"  runat="server" Text=""></asp:Label>
                            <br />
                        </td>
                    </tr>

                </table>
            </fieldset>
    </div>

        <script>
        $("#prodentrmenu").addClass("active");
    </script>
        
</asp:Content>
