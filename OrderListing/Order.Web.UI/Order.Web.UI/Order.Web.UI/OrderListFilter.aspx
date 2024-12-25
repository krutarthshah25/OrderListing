<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderListFilter.aspx.cs" Inherits="Order.Web.UI.OrderListFilter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container row col-md-12">
        <h2>Order Data(Filtered)</h2>
        <div class="row">
            <div class="col-md-3">
                <label>CusomerId</label>
                <asp:TextBox ID="txtCustomerId" ClientIDMode="Static" TextMode="Number" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label>From Date</label>
                <asp:TextBox ID="txtFromDate" ClientIDMode="Static" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label>To Date</label>
                <asp:TextBox ID="txtToDate" ClientIDMode="Static" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <a class="btn btn-sm btn-blue" onclick="getOrders();">Search</a>
            </div>
        </div>
        <table id="example" class="table table-bordered" style="width: 100%">
            <thead>
                <tr>
                    <th>OrderID</th>
                    <th>CustomerId</th>
                    <th>OrderDate</th>
                    <th>TotalAmount
                    </th>
                </tr>
            </thead>
            <tbody id="orderdata">
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        function getOrders() {
            var cid = document.getElementById("<%=txtCustomerId.ClientID %>").value;
            var fromdate = document.getElementById("<%=txtFromDate.ClientID %>").value;
            var todate = document.getElementById("<%=txtToDate.ClientID %>").value;
            $.getJSON("https://localhost:44350/api/Orders/GetOrdersFitered?CustomerId=" + cid + "&FromDate=" + fromdate + "&ToDate=" + todate,
                function (Data) {
                    $('#orderdata').empty();
                    var row = '';
                    $.each(Data, function (key, val) {
                        row += '<tr><td>' + val.OrderId + "</td><td>" + val.CustomerId + "</td><td>" + val.OrderDate + "</td><td>" + val.TotalAmount + "</td></tr>";
                        //$('<tr>', { text: row },'</tr>')  
                        //.appendTo($('#orderdata'));  
                    });
                    document.getElementById("orderdata").innerHTML = row;
                });
        }

        $(document).ready(function () {

            $('#example').DataTable({

                "paging": true, "ordering": true, "searching": true, "aaSorting": [], "sDom": 'Rfrtlip'
            });
        });
    </script>
</asp:Content>
