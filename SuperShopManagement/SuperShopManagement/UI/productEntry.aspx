<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="productEntry.aspx.cs" Inherits="SuperShopManagement.UI.productEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
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
    <script src="../AutoComplete/jquery.js"></script>
    <script src="../AutoComplete/jquery-ui.js"></script>
    <link href="../AutoComplete/jquery-ui.css" rel="stylesheet" />

 <script type="text/javascript">
     function jScript() {
         $("#productNameTextBox").autocomplete({
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
    
    
    <div class="productentry" id="formt">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            
                 <ContentTemplate>
                     <script type="text/javascript">
                Sys.Application.add_load(jScript);
            </script> 
                     

         <fieldset>
            <legend>Product Entry</legend>
             
                <table class="">
                    <tr>
                        <td>
                            Name 
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="productNameTextBox" ClientIDMode="Static" runat="server" Width="200px" Height="26px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="productNameTextBox" ErrorMessage="Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Catagory 
                        </td>
                        <td class="auto-style1">
                            
                            <asp:DropDownList ID="catagoryDropdown"  runat="server" Height="30px" Width="205px" AutoPostBack="True" OnSelectedIndexChanged="OnChangeItem"></asp:DropDownList>
                
                
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
                        <td>
                            
                            <asp:Label runat="server" ID="lblQtyUnit" Text="" ></asp:Label>
                            
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
                     </ContentTemplate>
            
                 </asp:UpdatePanel>
    </div>

        <script>
        $("#prodentrmenu").addClass("active");
    </script>
        
</asp:Content>
