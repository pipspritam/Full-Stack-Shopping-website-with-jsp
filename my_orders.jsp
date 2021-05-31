<!DOCTYPE html>
<html lang="en">
<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="./css/my_orders.css">
    <title>MY ORDER</title>
</head>

<body>
    <%
    if(((String)session.getAttribute("email"))==null){
        response.sendRedirect("login.jsp");
    }
    else{
        String email = (String)session.getAttribute("email");
        boolean flag = false;
        try{
            Statement stmt=con.createStatement(); 
            ResultSet rs=stmt.executeQuery("select * from orders where user_email='" + email + "' order by buy_date desc");
            %>
            <div class="container">
            <h1>My Orders</h1>
            <%
            while(rs.next()){
                flag = true;
                String imgName = rs.getString(4) + ".jpg";
                String img_path = "./image/";        

%>
    
        <div class="my-order">
            <div class="my-order-details">
                <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                <div class="context">
                    <h3><%= rs.getString("product_name") %></h3>
                    <p>Order id : <span><%= rs.getString("order_id") %></span></p>
                    <p>Quantity : <span><%= rs.getString("quantity") %></span></p>
                    <p>Date : <span><%= rs.getString("buy_date") %></span></p>
                </div>
            </div>
            <div class="price-div">
                <h3><span>&#8377;</span><%= pretty_print_price(Integer.toString(rs.getInt("total_payable"))) %></h3>
                <form class="print" action="./print.jsp" method="POST" target="_blank">
                    <input type="hidden" name="order_id" value="<%= rs.getString("order_id") %>">
                    <input class="print-btn" type="submit" value="Print Bill">
                </form>
            </div>
        </div>

    
    <%
            }
            if(flag==false)
            {
                %>
                <div class="msg-div">
                    <h3>No Order Yet</h3>
                <a class="continue-btn" href="./index.jsp">Continue Shopping</a>

                </div>
                
                <%
            }
        }catch(Exception e){}
    }
%>
</div>
</body>

</html>