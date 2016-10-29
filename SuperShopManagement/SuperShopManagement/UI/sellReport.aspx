<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="sellReport.aspx.cs" Inherits="SuperShopManagement.UI.sellReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Sell Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
    <meta charset="UTF-8" name="viewport" content="width=device-width" />
    <link href="../DateTimePeaker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="../DateTimePeaker/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .report {
            
            margin: 4% 27%;
            width: 400px;
            
            background-color: white;
        }
        .gv {
            margin-left: 20%;
            

        }
        .Grid {
            width: 650px !important;
        }
        
        td{
            padding: 5px;
            text-align:center;
        }
        
    th
    {
        text-align:center;
    }
    
        .shwbtn {
            margin-left: 69%;
            height: 40px;
            background-color: peachpuff;
            color: blue;
        }
        .shwbtn:hover {
            background-color: sandybrown;
        }
       
       
         </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="report">
    
   <div class="container" >
        <div class="row">
            <div class='col-sm-4'>
		<label>From Date</label>
                <div class="form-group">
                    <div class='input-group date' id='datepicker'>
                        <input type='text' class="form-control asd" id="fromDate" placeholder="dd-mm-yyyy" runat="server"/>
                        <span class="input-group-addon" id="datelogo">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
            
    
         <div class="container" >
        <div class="row">
            <div class='col-sm-4'>
		<label>To Date</label>
                <div class="form-group">
                    <div class='input-group date' id='datepicker1'>
                        <input type='text' class="form-control asd" id="toDate" placeholder="dd-mm-yyyy" runat="server"/>
                        <span class="input-group-addon" id="datelogo1">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    
     <asp:Button ID="showReportButton" CssClass="shwbtn" runat="server" Text="Show Report" OnClick="showReportButton_Click" />
        </div>
        
        <div  class="gv">
        <asp:GridView ID="reportGridview" runat="server" CssClass="Grid" AutoGenerateColumns="False" ShowFooter="True"
EmptyDataText="No sell records has been found." CellPadding="9" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="110" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" Width="120px" ></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="SaleQuantity" HeaderText="Sell Quantity" ItemStyle-Width="110" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ItemStyle-Width="110" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" >

<ItemStyle HorizontalAlign="Right" Width="110px"></ItemStyle>
    </asp:BoundField>

</Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Height="35px" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
            </div>
    
    
    
    
    
    
    
    
    
    
    

    <script src="../DateTimePeaker/js/bn.min.js"></script>
    <script src="../DateTimePeaker/js/bootstrap.min.js"></script>
    <script src="../DateTimePeaker/js/jquery-2.2.0.min.js"></script>
    <script src="../DateTimePeaker/js/moment.min.js"></script>
    <script src="../DateTimePeaker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#datepicker').datetimepicker({
                format: 'DD-MM-YYYY',
                defaultDate: 'moment', //auto select current date
                showClear: true,
                showClose: true,
                showTodayButton: true,
                toolbarPlacement: 'bottom'
            });
            $('#fromDate').on('click', function () {
                $("#datelogo").trigger('click');
            });
            $(document).ready(function () {
                $('#datepicker1').datetimepicker({
                    format: 'DD-MM-YYYY',
                    defaultDate: 'moment', //auto select current date
                    showClear: true,
                    showClose: true,
                    showTodayButton: true,
                    toolbarPlacement: 'bottom'
                });
                $('#todate').on('click', function () {
                    $("#datelogo1").trigger('click');
                });

            });
            
        });
    </script>
    
    <script>
        $("#sellrepomenu").addClass("active");
    </script>
</asp:Content>
