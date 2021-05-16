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
            ResultSet rs=stmt.executeQuery("select * from item where product_id = '" + id + "'");
            rs.next();
            int final_price = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
    %>
        <h1>
            order summary
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
            <p>
                Quantity: 1 
            </p>
        </div>
    <%  }
	    catch (Exception e) { 
		}
    %>
    </body>
</html>