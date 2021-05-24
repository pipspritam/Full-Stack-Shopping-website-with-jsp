<%@ include file="dbconnect.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String pincode = request.getParameter("pincode");
    String del_name = request.getParameter("del_name");
    String del_email = request.getParameter("del_email");
    String del_phone = request.getParameter("del_phone");
    String del_pincode = request.getParameter("del_pincode");
    String new_address = request.getParameter("new_address");
    String order_id = request.getParameter("order_id");
    String buy_date = request.getParameter("buy_date");
    String buy_time = request.getParameter("buy_time");
    String pname = request.getParameter("pname");
    String quantity = request.getParameter("quantity");
    String price = request.getParameter("price");
    String payable = request.getParameter("payable");
    String payment_option = request.getParameter("payment_option");
%>
<html>
    <head>
        <link rel="stylesheet" href="final_buy_now.css">
    </head>
    <body onload="window.print()">
        <div class="container">
            <div class="col-2">
                <div class="bill-ship order-div">
                    <h1>Bill To</h1>
                    <div class="delivery-address-div">
                        <p class="label">Name </p>
                        <p><%= name %></p>
                        <p class="label">Email </p>
                        <p><%= email %></p>
                        <p class="label">Phone </p>
                        <p><%= phone %></p>
                        <p class="label">Address</p>
                        <p><%= address %></p>
                        <p class="label">Pincode</p>
                        <p><%= pincode %></p>
                    </div>
                </div>
                <div class="bill-ship order-div">
                    <h1>Ship To</h1>
                    <div class="delivery-address-div">
                        <p class="label">Name </p>
                        <p><%= del_name%></p>
                        <p class="label">Email </p>
                        <p><%= del_email %></p>
                        <p class="label">Phone </p>
                        <p><%= del_phone %></p>
                        <p class="label">Address</p>
                        <p><%= new_address %></p>
                        <p class="label">Pincode</p>
                        <p><%= del_pincode%></p>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="tax-invoice order-div">
                    <h1>Tax Invoice</h1>
                    <div class="delivery-address-div">
                        <p class="label">Order Id</p>
                        <p><%= order_id %></p>
                        <p class="label">Date </p>
                        <p><%= buy_date %></p>
                        <p class="label">Time </p>
                        <p><%= buy_time %></p>
    
                    </div>
                </div>
                <div class="order-div">
                    <h1>Order Details</h1>
                    <div class="product-details-div">
                        <div class="product-details">
                            <h3><%= pname %></h3>
                            <p>Price: <span>&#8377;</span><%= pretty_print_price(price) %></p>
                            <p>Quantity: <span><%= quantity %></span></p>
                            <p>Payable: <span><%= pretty_print_price(payable) %></span></p>
                            <p>Payment Method: <span><%= payment_option %></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>