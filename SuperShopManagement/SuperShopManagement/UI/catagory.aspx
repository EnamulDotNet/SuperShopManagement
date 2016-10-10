<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catagory.aspx.cs" Inherits="SuperShopManagement.UI.catagory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <fieldset>
            <table>
                <tr>
                    <td>
                        Catagory:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="catagoryNameTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="catagorydescriptionTextBox" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td align="right">
                        <asp:Button ID="catagorySaveButton" runat="server" Text="Save" OnClick="catagorySaveButton_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    
    </div>
    
    <asp:GridView ID="catagoryGridView" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="CatagoryId" HeaderText="Catagory Id"/>
            <asp:BoundField DataField="catagoryName" HeaderText="Catagory Name"/>
            <asp:BoundField DataField="CatagoryDescription" HeaderText="Catagory Description"/>
        </Columns>
    </asp:GridView>
        </form>
</body>
</html>
