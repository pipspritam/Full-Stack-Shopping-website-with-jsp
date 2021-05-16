<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<html>
    <head>
        <title>
            Buy Now
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
    %>
        <h1>
            ORDER DETAILS
        </h1>
        <div class="card">
            <p>
                <%= rs.getString(2) %>
            </p>
            <p>
                Price:  <span>&#8377;</span><%= rs.getString(3) %>
            </p>
            <p>
                Discount Price: <span>&#8377;</span> <%= final_price %>
            </p>
            <form action="./process_buy_now.jsp" method="POST">
                <input type="hidden" name="ID" value="<%= id %>">
                <label for="qunatity">Quantity: </label>
                <input type="text" name="quantity" id="quantity" value="1"> <br>
                <label for="address">Delivery Address: </label> 
                <input type="text" name="address" id="address" value="<%= rs1.getString(5) %>"> <br>
                <input type="submit" value="PROCESS ORDER">
            </form>
        </div>
    <%  
        con.close();
        }
	    catch (Exception e) { 
		}
    %>
    </body>
</html>