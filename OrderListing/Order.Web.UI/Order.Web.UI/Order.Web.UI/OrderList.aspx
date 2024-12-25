<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Order.Web.UI.OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container row col-md-12">
        <h2>Order Data</h2>
        <a class="btn btn-sm btn-blue" onclick="getOrders();">Load all data</a>
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
            $.getJSON("https://localhost:44350/api/Orders/GetOrders",
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
                 "ajax": getOrders(),
       
                "paging": true, "ordering": true, "searching": true, "aaSorting": [], "sDom": 'Rfrtlip'
            });
        });
    </script>
</asp:Content>
