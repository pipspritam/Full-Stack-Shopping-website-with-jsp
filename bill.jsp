<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<%
    String name = (String)session.getAttribute("email");
    String pid = request.getParameter("ID");
    String payable = request.getParameter("payable");
    String payment_option = request.getParameter("payment_option");
    String quantity = request.getParameter("quantity") ;
    String new_address = request.getParameter("address");
    Statement stmt = con.createStatement(); 
    ResultSet rs=stmt.executeQuery("select * from users");
    Statement stmt1 = con.createStatement(); 
    ResultSet rs1=stmt1.executeQuery("select * from item where product_id='" + pid + "'");
    rs.next();
    rs1.next();
%>
<html>
    <body>
        <h1>TAX INVOICE </h1>
        <p>Date: <%= java.time.LocalDate.now() %></p>
        <p>Time: <%= java.time.LocalTime.now() %></p>
        <h1>Bill To</h1>
        <p><strong><%= rs.getString("name") %></strong></p>
        <p><%= rs.getString("address") %></p>
        <p>Phone: <%= rs.getString("phone") %></p>
        <p>Email: <%= rs.getString("email") %></p>
        <h1>Ship To</h1>
        <p><strong><%= rs.getString("name") %></strong></p>
        <p><%= new_address %></p>
        <p>Phone: <%= rs.getString("phone") %></p>
        <h1>Payment Details</h1>
        <h3>Name: <%= rs1.getString(2) %></h3>
        <p>Qty: <%= quantity %></p>
        <p>Payable: <%= payable %></p>
        <p>Payment Method : <%= payment_option %></p>
    </body>
    </body>
</html>