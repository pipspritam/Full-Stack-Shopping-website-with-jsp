<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="./css/wishlist.css">

    <title>Document</title>
</head>
<%
    String email = (String)session.getAttribute("email");
    Statement stmt1=con.createStatement(); 
    Statement stmt2=con.createStatement(); 
    ResultSet rs1=stmt1.executeQuery("select * from wishlist where email = '" + email + "'");
    boolean flag = false;
    
%>
<body>
    <div class="container">
        <div class="box">
            <h2>My Wishlist</h2>

<%

while(rs1.next())
    {
        flag = true;
        ResultSet rs2=stmt2.executeQuery("select * from item where product_id = '" + rs1.getString(2) + "'");
        rs2.next();
        int discountPrice = (rs2.getInt(3)*(100 - rs2.getInt(6)))/100;
                String imgName = rs2.getString(1) + ".jpg";
                String img_path = "./image/";
                
%>
            <form class="item" method="POST">
                <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                <div class="details">
                    <h3><%= rs2.getString("product_name") %></h3>
                    <div class="price">
                        <h1><span>&#8377;</span><%=discountPrice %></h1>
                        <strike><span>&#8377;</span><%= rs2.getInt(3) %></strike>
                        <p><%= rs2.getInt(6) %>% Off</p>
                    </div>

                    <div class="btn-div">
                        
                        <input type="hidden" name="ID" value="<%= rs1.getString(2) %>">
                        <button formaction="./buy_now.jsp">Buy Now</button>
                        <button formaction="./add_to_cart.jsp">Add To Cart</button>

                    </div>

                </div>
                <button class="delete fas fa-trash" formaction="./remove_from_wishlist.jsp">
                </button>
            </form>
            <%
    }
    if(!flag)
    {
%>
    <h1>Wishlist is empty!</h1>
<%
    }
%>
        </div>
    </div>
</body>

</html>