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
%>
<html>
    <body>
        <h1>TAX INVOICE </h1>
        <h3><strong>Order Id: </strong><%= order_id %></h3>
        <p>Date: <%= java.time.LocalDate.now() %></p>
        <p>Time: <%= java.time.LocalTime.now() %></p>
        <h1>Bill To</h1>
        <p><strong><%= rs.getString("name") %></strong></p>
        <p>Email: <%= rs.getString("email") %></p>
        <p>Phone: <%= rs.getString("phone") %></p>
        <p>Address: <%= rs.getString("address") %></p>
        <p>Pincode: <%= rs.getString("pincode") %></p>
        <h1>Ship To</h1>
        <p><strong><%= del_name%></strong></p>
        <p>Email: <%= del_email %></p>
        <p>Phone: <%= del_phone %></p>
        <p><%= new_address %></p>
        <p>Pincode: <%= del_pincode%></p>
        <h1>Payment Details</h1>
        <h3>Name: <%= rs1.getString(2) %></h3>
        <p>Qty: <%= quantity %></p>
        <p>Payable: <%= payable %></p>
        <p>Payment Method : <%= payment_option %></p>
        <br><br>
        <p>Thank You For Shopping With Us</p>
        <p><a href="./index.jsp" >Continue Shopping</a></p>
    </body>
</html>
<%
    Statement stmt3=con.createStatement();
    String sql1 = "insert into orders values ('" + order_id + "', '" + buy_date + "', '" + email + "', '" + pid + "', " + quantity + ", " + payable + ", '" + del_name + "', '" + del_phone + "', '" + new_address + "', '" + del_pincode + "', '" + pname + "')";
    int i1=stmt3.executeUpdate(sql1);
%>