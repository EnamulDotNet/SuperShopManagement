<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="catagory.aspx.cs" Inherits="SuperShopManagement.UI.catagory1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Catagory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
     <style type="text/css">
        .catagory {
            
            margin: 5% 30%;
            width: 32%;
            
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
            padding: 15px;
            
        }
        
       
         .auto-style1 {
             width: 128px;
         }
      
       
         .auto-style2 {
             width: 176px;
         }
      
       
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="catagory">
    <fieldset>
            <legend>Catagory Entry</legend>
            <table>
                <tr>
                    <td class="auto-style1">
                        Catagory:
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="catagoryNameTextBox" Height="26px" Width="170px"></asp:TextBox>
                        
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="catagoryNameTextBox" ErrorMessage="Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        Measurement Unit:
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList runat="server" ID="catagoryMeasurementDropdownList" Height="31px" Width="173px"/>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="catagoryMeasurementDropdownList" ErrorMessage="Required!" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        Description: </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="catagorydescriptionTextBox" TextMode="MultiLine" placeholder="(optional)" Width="170px" Height="44px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        
                    </td>
                    <td align="right" class="auto-style2">
                        <asp:Button ID="catagorySaveButton" runat="server" Text="Save" OnClick="catagorySaveButton_Click" CssClass="save" Height="32px" Width="84px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <asp:Label runat="server" ID="catagorySaveStatusLabel" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        </div>
    <script>
        $("#catamenu").addClass("active");
    </script>
</asp:Content>
