<html>
        <head>
<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<%
    try{
        String email = (String)session.getAttribute("email");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select product_name, price, discount, price, item.quantity, cart.quantity  from item, cart where cart.product_id=item.product_id and cart.email='"+email+"'");
        boolean flag = false;
%>
    
            <title>
                My Cart
            </title>
        </head>
        <body>
            <div style="height: 100vh;">
            <h1>
                My Cart
            </h1>
<%
        while(rs.next()){
            flag = true;
            int final_price = (rs.getInt(4)*(100 - rs.getInt(3)))/100;
%>
        <div class="card">
            <p>
                <%= rs.getString(1) %>
            </p>
            <p>
                Price:  <span>&#8377;</span><%= rs.getString(2) %>
            </p>
            <p>
                Discount Price: <span>&#8377;</span> <%= final_price %>
            </p>
    <%
            if(Integer.parseInt(rs.getString(5)) > 0){
    %>
            <p>
                Quantity: <%= rs.getInt(6) %>
            </p>
            <form action="#">
                <input type="submit" value="remove" >
            </form>
    <%
            } else {
    %>
            <p>
                Out of Stock
            </p>
    <%
            }
    %>
            
        </div> <hr>

<%
        }
        if(flag){
%>
        <form action="#">
            <input type="submit" value="Place Order" >
        </form>
<%
    }if(flag == false){
%>
        <p>Oops your cart is empty!</p>
        <p>Continue shopping <a href="./index.jsp">Shop Now</a></p>

<%
    }
    } catch (Exception e){
    }

%>
</div>
<div >
    <%@ include file="footer.html" %>
</div>
</body>
</html>
