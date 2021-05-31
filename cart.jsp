<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="dbconnect.jsp" %>
    <%@ include file="navbar.jsp" %>
    <title>CART</title>
    <link rel="stylesheet" href="./css/cart.css">
</head>
<body>
    <%
    try{
        String email = (String)session.getAttribute("email");
        if(email==null){
            %>
            <div class="w-login">

                <h3>Missing Cart items?</h3>
                <h4>Login to see the items you added previously</h4>
                <a  href="./login.jsp">Login Now</a>
            </div>
                
            <%
        }
        else {
        Statement stmt=con.createStatement();
        
        ResultSet rs=stmt.executeQuery("select product_name, price, discount,  item.quantity, cart.quantity,cart.product_id from item, cart where cart.product_id=item.product_id and cart.email='"+email+"'");
        boolean flag = false;
        boolean out_of_stock = false;
        int total_payable = 0;
        
%>
    <div class="container">
        <div class="cart-div">
            <form action="./place_order.jsp" method="post">
            <div class="cart-box">
                <h2>My Cart</h2>
                <%
        while(rs.next()){
            flag = true;
            int final_price = (rs.getInt(2)*(100 - rs.getInt(3)))/100;
            total_payable += (final_price * rs.getInt(5));
            String imgName = rs.getString(6) + ".jpg";
            String img_path = "./image/";
            
                
%>
            <form>
                <input type="hidden" name="ID" value="<%= rs.getString(6) %>">
                <div class="cart-product">
                    <div class="c-product-img">
                        <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                    </div>
                    <div class="c-product-details">
                        <h4><%= rs.getString(1) %></h4>
                        <h3><span>&#8377;</span><%= pretty_print_price(Integer.toString(final_price)) %></h3>
                    </div>
                    <%
                        if(rs.getInt(5) <= rs.getInt(4)){
                    %>
                    <div class="quantity-btn">
                    <button formaction="./update_quantity_neg.jsp">-</button>
                    <input type="number"  value="<%= rs.getInt(5) %>" min="1" max="9">
                    <button formaction="./update_quantity.jsp">+</button>
                    </div>
                    <%
                    } else {
                        out_of_stock = true;
                    %>
                    <p>OUT OF STOCK</p>
                    <%
                    }
                    %>
                    <button class="button" formaction="./remove_from_cart.jsp">REMOVE</button>
                
                </div>
            </form>
                <%
        }
        
%>
<%
        
        if(flag){
%>           
                <div class="order-div">
                <%
                    if(!out_of_stock){
                %>
                    <input type="submit" value="PLACE ORDER">
                <%
                    } else {
                %>
                    <p>Cannot place order</p>
                <%
                    }
                %>
                </div>
            </div>
            <%
                    if(!out_of_stock){
            %>
            <div class="price-details-div">
                <h2>PRICE DETAILS</h2>
                <div class="cart-price">
                    
                    <p>Price</p>
                    <p><span>&#8377;</span><%= pretty_print_price(Integer.toString(total_payable)) %></p>
                    <p>Delivery Charge</p>
                    <p class="green">FREE</p>
                    <hr>
                    <h4>Total Amount</h4>
                    <h4><span>&#8377;</span><%= pretty_print_price(Integer.toString(total_payable)) %></h4>
                </div>
            </div>
            <%
                    } 
                %>
        </form>
        </div>
        
    </div>
    <%
}if(flag == false){
    %>


    <div class="empty-cart">
        <img src="./image/emptycart.png" alt="empty cart">
        <p>Oops your cart is empty!</p>
        <a href="./index.jsp">Continue shopping</a>
    </div>
    

    <%
}
        }
    con.close();
    
    } catch (Exception e){
    }

%>
    
</body>
</html>