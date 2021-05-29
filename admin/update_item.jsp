<%@ include file="../dbconnect.jsp" %>
<%@ include file="admin_navbar.jsp" %>
<html>
    <head>
        
        <title>
            Update Item
        </title>
    </head>
    <body>
        <%
        try {
            Statement stmt=con.createStatement();
            ResultSet rs1=stmt.executeQuery("select count(*) from item");
            rs1.next();
            int numberOfProducts = Integer.parseInt(rs1.getString(1));
            ResultSet rs=stmt.executeQuery("select * from item");

            if(numberOfProducts > 0){
        %>
            <div class="container">
        <%
            while(rs.next())
            {
                int discountPrice = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
        %>
            <div class="card">
                <h1> Product ID: 
                    <%= rs.getString(1) %>
                </h1>
                <h1> Product Name
                    <%= rs.getString(2) %>
                </h1>
                <h2> MRP: 
                    <span>&#8377;</span><%= pretty_print_price(Integer.toString(rs.getInt(3))) %>
                </h2> 
                <h2> Discounted Price: 
                    <span>&#8377;</span><%= pretty_print_price(Integer.toString(discountPrice)) %>
                </h2> 
                <h2> Quantity: 
                    <%= rs.getInt(5) %>
                </h2> 
                <form method="post" id="myForm1" action="./process_update_item.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                    <Input type="submit" value ="Update Product">
                </form>
                <form method="post" id="myForm2" action="./process_delete_item.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                    <Input type="submit" value ="Delete Product">
                </form>
                <hr>
            </div>
        <%
            }} else {
        %>
            <h1>NO ITEM AVAILABLE!</h1>
    </div>
		<%	} con.close(); 
        } 
	    catch (Exception e) { 
		}
        %>
    </body>
</html>