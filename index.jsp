<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>
            Home Page
        </title>
    </head>
    <body>
        <%
        try {
        
        Statement stmt=con.createStatement(); 
        ResultSet rs=stmt.executeQuery("select * from item");
        
        %>
            <div class="container">
        <%
            while(rs.next())
            {
                int discountPrice = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
        %>
            <div class="card">
                <h1>
                    <%= rs.getString(2) %>
                </h1>
                <p>
                    <%= rs.getString(4) %>
                </p>
                <h2>
                    <span>&#8377;</span><%= discountPrice %>
                </h2> 
                <p>
                    <span>&#8377;</span><strike><%= rs.getString(3) %></strike>&emsp;<%= rs.getString(6) %>% off
                </p> 
                <%
                    if(rs.getInt(5) > 0){
                        if(((String)session.getAttribute("email"))!=null){
                %>
                <form method="post" id="myForm1" action="./buy_now.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                    <Input type="submit" value ="Buy Now">
                </form>
                <form method="post" id="myForm1" action="./add_to_cart.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                    <Input type="submit" value ="Add to Cart">
                </form>
                <%
                        } else {
                %>
                    <button style="display: block;"><a href="./login.jsp" style="text-decoration: none; color: black;">Buy Now</a></button>
                    <button style="display: block;"><a href="./login.jsp" style="text-decoration: none; color: black;">Add to Cart</a></button>
                <% 
                        }
                    } else { %>
                    <p>Out Of Stock</p>
                <% } %>
                <hr>
            </div>
        <%
            }
        %> 
    </div>
		<%	con.close(); 
        } 
	    catch (Exception e) { 
		}
        %>

    <div class="footer-wrapper">
        <%@ include file="footer.html" %>
    </div>
    </body>
</html>