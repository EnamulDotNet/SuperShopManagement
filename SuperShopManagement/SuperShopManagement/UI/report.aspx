<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="SuperShopManagement.UI.report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
       body {
           background-image: url("b18.png");
       } 
    </style>
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
    <title>Sell Report</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    
    <link href="../design/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../design/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../DateTimePeaker/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../DateTimePeaker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Juvenile Super Shop </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li><a href="catagory.aspx">Catagory Entry</a> </li>
                    <li><a href="entry.aspx">Products Entry</a> </li>
                    <li><a href="view.aspx">Products Edit/Delete</a> </li>
                    <li><a href="sell.aspx">Sell</a> </li>
                    <li><a href="report.aspx">Report</a> </li>

                </ul>

            </div>
        </div>
    </div>
                            <asp:Button ID="logoutButton" runat="server" BackColor="#0099FF" OnClick="logoutButton_Click" Text="Log Out" />

        <div class="ap">
        <div id="ddd">
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
            </div>
            </div>
        <div id="ddd">
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
        </div>
    
        <script src="../DateTimePeaker/js/moment.min.js"></script>
<!--<script src="js/bn.min.js"></script> remove comment to use bangla font-->
        <script src="../DateTimePeaker/js/jquery-2.2.0.min.js"></script>
        <script src="../DateTimePeaker/js/bootstrap.min.js"></script>
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
            $('#timepicker').datetimepicker({
	   //	format: 'HH:mm', //for 24 hour
                format: 'LT',	//12 hour am/pm
                defaultDate: 'moment', //auto select current time.
                showClear: true,
                showClose: true,
                showTodayButton: true,
                toolbarPlacement: 'bottom'
            });
            $('#time').on('click', function () {
                $("#timelogo").trigger('click');
            });
        });
    </script>
        <script type="text/javascript">
        $(document).ready(function () {
            $('#datepicker1').datetimepicker({
                format: 'DD-MM-YYYY',
                defaultDate: 'moment', //auto select current date
                showClear: true,
                showClose: true,
                showTodayButton: true,
                toolbarPlacement: 'bottom'
            });
            $('#toDate').on('click', function () {
                $("#datelogo1").trigger('click');
            });
            $('#timepicker').datetimepicker({
	   //	format: 'HH:mm', //for 24 hour
                format: 'LT',	//12 hour am/pm
                defaultDate: 'moment', //auto select current time.
                showClear: true,
                showClose: true,
                showTodayButton: true,
                toolbarPlacement: 'bottom'
            });
            $('#time').on('click', function () {
                $("#timelogo").trigger('click');
            });
        });
    </script>
        <asp:Button ID="showReportButton" runat="server" Text="Show Report" OnClick="showReportButton_Click" />
        
        <br/><br/><br/><br/>
        <div >
        <asp:GridView ID="reportGridview" runat="server" CssClass="Grid" AutoGenerateColumns="False" ShowFooter="True"
EmptyDataText="No sell records has been found." CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="SaleQuantity" HeaderText="Sell Quantity" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ItemStyle-Width="120" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" >

<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
    </asp:BoundField>

</Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
            </div>
    </form>
</body>
</html>
