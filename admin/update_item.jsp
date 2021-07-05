<%@ include file="../dbconnect.jsp" %>
<%@ include file="admin_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="stylesheet" href="../css/add_item.css">
    <title>Update Product Details</title>
</head>
<body>
    <div class="container box">
        <h1>Update Product Details</h1>
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
                <div class="gap">
        <%
            while(rs.next())
            {
                int discountPrice = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
        %>
        
            <div class="box col-2">
                <p class="label">Product Id</p>
                <p><%= rs.getString(1) %></p>
                <p class="label">Product Name</p>
                <p><%= rs.getString(2) %></p>
                <p class="label">MRP</p>
                <p><span>&#8377;</span><%= pretty_print_price(Integer.toString(rs.getInt(3))) %></p>
                <p class="label">Discounted Price</p>
                <p><span>&#8377;</span><%= pretty_print_price(Integer.toString(discountPrice)) %></p>
                <p class="label">Quantity</p>
                <p><%= rs.getInt(5) %></p>
                <form method="post" id="myForm1" action="./process_update_item.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                        <input class="btn" type="submit" value="Update Product">
                </form>
                <form method="post" id="myForm2" action="./process_delete_item.jsp">
                    <Input type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                        <input class="btn" type="submit" value="Delete Product">
                </form>
                
                
            </div> 
            
        
        <%
            }} else {
        %>
    </div>
            <h1>NO ITEM AVAILABLE!</h1>
            <%	} con.close(); 
        } 
	    catch (Exception e) { 
		}
        %>
    </div>
</body>

</html>