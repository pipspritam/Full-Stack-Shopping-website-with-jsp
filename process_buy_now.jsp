<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<html>
    <head>
        <title>
            Order Details
        </title>
    </head>
    <body>
    <%
        String id = request.getParameter("ID");
        try{
            Statement stmt=con.createStatement(); 
            Statement stmt1=con.createStatement(); 
            ResultSet rs=stmt.executeQuery("select * from item where product_id = '" + id + "'");
            ResultSet rs1=stmt1.executeQuery("select * from users where email = '" + (String)session.getAttribute("email") + "'");
            rs.next();
            rs1.next();
            int final_price = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
            int qty = Integer.parseInt(request.getParameter("quantity"));
            String addr = request.getParameter("address");
            String pname = rs.getString(2);
    %>
        <h1>
            ORDER DETAILS
        </h1>
        <p>
            <%= pname %>
        </p>
        <p>
            Price per item: <%= final_price %>
        </p>
        <p>
            Quantity: <%= qty %>
        </p>
        <p>
            Toyal Payable: <%= qty*final_price %>
        </p>
        <p>
            Delivery Details
            <strong><%= rs1.getString("name") %></strong> <%= addr %>
        </p>
        <form action="./payment.jsp">
            <input type="hidden" name="payable" value="<%= qty*final_price %>">
            <input type="hidden" name="address" value="<%= addr %>">
            <input type="hidden" name="ID" value="<%= id %>">
            <input type="hidden" name="quantity" value="<%= qty %>">
            <input type="hidden" name="final_price" value="<%= final_price %>">
            <input type="hidden" name="pname" value="<%= pname %>">
            <input type="submit" value="GO TO PAYMENT">
        </form>
    <%
    con.close();
    }
    catch (Exception e) { 
        out.print("error");
    }
    %>
    </body>
</html>