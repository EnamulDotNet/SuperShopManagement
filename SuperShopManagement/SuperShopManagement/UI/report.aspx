<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="SuperShopManagement.UI.report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" name="viewport" content="width=device-width" />
    <title></title>
    <link href="../DateTimePeaker/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../DateTimePeaker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
</head>
<body  style="margin:5%">
    <form id="form1" runat="server">
   <div class="container" >
        <div class="row">
            <div class='col-sm-4'>
		<label>From Date</label>
                <div class="form-group">
                    <div class='input-group date' id='datepicker'>
                        <input type='text' class="form-control" id="fromDate" placeholder="dd-mm-yyyy" runat="server"/>
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
                        <input type='text' class="form-control" id="toDate" placeholder="dd-mm-yyyy" runat="server"/>
                        <span class="input-group-addon" id="datelogo1">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
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
        
        <asp:GridView ID="reportGridview" runat="server" CssClass="Grid" AutoGenerateColumns="false" ShowFooter="true"
EmptyDataText="No sell records has been found.">
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center"/>
    <asp:BoundField DataField="SaleQuantity" HeaderText="Sell Quantity" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ItemStyle-Width="120" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

</Columns>
</asp:GridView>
    </form>
</body>
</html>
