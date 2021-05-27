<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<%!
    String get_order_id(String pid, String email)
    {
        String tme = java.time.LocalTime.now().toString();
        String new_pid = pid.substring(0,2);
        String new_email = email.substring(0,2);
        String order_id = "OD"+tme+new_pid+new_email;
        return order_id;
    }
%>
<%
    String email = (String)session.getAttribute("email");
    String pid = request.getParameter("ID");
    String payable = request.getParameter("payable");
    String final_price = request.getParameter("final_price");
    String payment_option = request.getParameter("payment_option");
    String quantity = request.getParameter("quantity") ;
    int qty = Integer.parseInt(quantity);
    String new_address = request.getParameter("address");
    String del_name = request.getParameter("del_name");
    String del_phone = request.getParameter("del_phone");
    String del_pincode = request.getParameter("del_pincode");
    String del_email = request.getParameter("del_email");
    Statement stmt = con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'");
    Statement stmt1 = con.createStatement(); 
    ResultSet rs1=stmt1.executeQuery("select * from item where product_id='" + pid + "'");
    Statement stmt2=con.createStatement();
    String sql = "update item set quantity=quantity-"+qty+" where product_id='" + pid + "'";
    int i=stmt2.executeUpdate(sql);
    rs.next();
    rs1.next();
    String pname = rs1.getString(2);
    String order_id = get_order_id(pid, email);
    String buy_date = java.time.LocalDate.now().toString();
    String buy_time = java.time.LocalTime.now().toString();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Tax Invoice</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TAX INVOICE</title>
    <link rel="stylesheet" href="./bill.css">
</head>

<body>
    <div class="container">
        <div class="col-2">

            <div class="bill-ship order-div">
                <h1>Bill To</h1>
                <div class="delivery-address-div">
                    <p class="label">Name </p>
                    <p><%= rs.getString("name") %></p>
                    <p class="label">Email </p>
                    <p><%= rs.getString("email") %></p>
                    <p class="label">Phone </p>
                    <p><%= rs.getString("phone") %></p>
                    <p class="label">Address</p>
                    <p><%= rs.getString("address") %></p>
                    <p class="label">Pincode</p>
                    <p><%= rs.getString("pincode") %></p>
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
                    <p><%= java.time.LocalDate.now() %></p>
                    <p class="label">Time </p>
                    <p><%= java.time.LocalTime.now() %></p>

                </div>
            </div>
            <div class="order-div">
                <h1>Order Details</h1>
                <div class="product-details-div">
                    <div class="product-details">
                        <h3><%= rs1.getString(2) %></h3>
                        <p>Price: <span>&#8377;</span><%= pretty_print_price(final_price) %></p>
                        <p>Quantity: <span><%= quantity %></span></p>
                        <p>Payable: <span><%= pretty_print_price(payable) %></span></p>
                        <p>Payment Method: <span><%= payment_option %></span></p>
                    </div>
                </div>
            </div>
        </div>
        <form class="print" action="./print.jsp" method="POST" target="_blank">
            <input type="hidden" name="name" value="<%= rs.getString("name") %>">
            <input type="hidden" name="email" value="<%= rs.getString("email") %>">
            <input type="hidden" name="phone" value="<%= rs.getString("phone") %>">
            <input type="hidden" name="address" value="<%= rs.getString("address") %>">
            <input type="hidden" name="pincode" value="<%= rs.getString("pincode") %>">
            <input type="hidden" name="del_name" value="<%= del_name %>">
            <input type="hidden" name="del_email" value="<%= del_email %>">
            <input type="hidden" name="del_phone" value="<%= del_phone %>">
            <input type="hidden" name="new_address" value="<%= new_address %>">
            <input type="hidden" name="del_pincode" value="<%= del_pincode %>">
            <input type="hidden" name="order_id" value="<%= order_id %>">
            <input type="hidden" name="buy_time" value="<%= buy_time %>">
            <input type="hidden" name="buy_date" value="<%= buy_date %>">
            <input type="hidden" name="pname" value="<%= pname %>">
            <input type="hidden" name="price" value="<%= final_price %>">
            <input type="hidden" name="quantity" value="<%= quantity %>">
            <input type="hidden" name="payable" value="<%= payable %>">
            <input type="hidden" name="payment_option" value="<%= payment_option %>">
            <input class="print-btn" type="submit" value="Print Bill">
        </form>
        <div class="msg-div">
            <h1>Thank You For Shopping With Us</h1>
            <a class="continue-btn" href="./index.jsp">Continue Shopping</a>
        </div>
        <%
        Statement stmt3=con.createStatement();
        String sql1 = "insert into orders values ('" + order_id + "', '" + buy_date + "', '" + email + "', '" + pid + "', " + quantity + ", " + payable + ", '" + del_name + "', '" + del_phone + "', '" + new_address + "', '" + del_pincode + "', '" + pname + "')";
        int i1=stmt3.executeUpdate(sql1);
    %>
    
    </div>
    
</body>
</html>
