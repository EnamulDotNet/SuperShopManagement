<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLogin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SuperShopManagement.UI.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Log in
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <style type="text/css">
       
         .admin {
            
             margin: 5% 30%;
             width: 32%;
            
             background-color: white;
         }
        .lgbtn {
            color: blue;
            background-color: peachpuff;
        }
        .lgbtn:hover {
            color: white;
            background-color: sandybrown;
        }
        
        td{
            padding: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="admin">
            <fieldset>
                <legend>Admin Panel</legend>
                <table>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            
                            <asp:TextBox runat="server" ID="usernameTextBox" Height="26px" Width="185px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="usernameTextBox" ErrorMessage="Required!"  Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="usernameTextBox" ErrorMessage="Must be 4-12 Characters long!" ValidationExpression="[a-zA-Z]{4,12}"  Display="Dynamic" ForeColor="red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="passwordTextBox" TextMode="Password" Height="26px" Width="185px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Required!" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            
                        </td>
                        <td align="right">
                            <asp:Button runat="server" ID="loginButton" Text="Log In" CssClass="lgbtn" OnClick="loginButton_Click" Height="40px" Width="79px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Label runat="server" ID="loginStatusLabel" Text="Incorrect username/password!" Visible="False" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    <script>
        $("#homeMenu").addClass("active");
    </script>
</asp:Content>
