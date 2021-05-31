<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="dbconnect.jsp" %>
    <%@ include file="navbar.jsp" %>
    <%!
        String add_bull_desc(String desc){
            String[] desc_list = desc.split("\\|", -2);
                String new_Desc = "&bull; " + desc_list[0];
                for (int i = 1; i < desc_list.length; i++) {
                    new_Desc += "<br>&bull; " + desc_list[i];
                }

             return new_Desc;
        }
    %>
    <title>Home Page</title>
    <link rel="stylesheet" href="./css/index.css">
    <script>
        function myFunc(){
            document.getElementById("message").style.display = "none";
            document.getElementById("message").style.content = "";
            return false;
        }
    </script>
</head>
<body onload="setTimeout(myFunc, 2000)">
    <%
        Statement stmt1=con.createStatement(); 
        ResultSet rs1=stmt1.executeQuery("select * from message_table");
        if(rs1.next()){
    %>
    <p id="message"><%= rs1.getString(1) %></p>
    <%
    Statement stmt2 = con.createStatement();
    int i2=stmt1.executeUpdate("delete from message_table");
        }
    %>
    <div class="container">
        <%
        try {
        
        Statement stmt=con.createStatement(); 
        ResultSet rs=stmt.executeQuery("select * from item");
        
        %>
            
        <%
            while(rs.next())
            {
                int discountPrice = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
                String imgName = rs.getString(1) + ".jpg";
                String img_path = "./image/";
        %>
        
        <div class="product">
            <div class="product-img">

                <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                <%
                    if(rs.getInt(5) > 0){
                        if(((String)session.getAttribute("email"))!=null){
                        
                %>
                <div class="product-form">
                    <form  method="post"  action="./buy_now.jsp">
                        <Input class="product-btn" type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                        <Input class="product-btn" type="submit" value ="Buy Now">
                    </form>
                    <form  method="post"  action="./add_to_cart.jsp">
                        <Input class="product-btn" type="Hidden" name="ID" value="<%= rs.getString(1) %>"> 
                        <Input class="product-btn" type="submit" value ="Add to Cart">
                    </form>
                   </div>
                   <% } else {
                       %> 
                       <div class="product-form">
                        <button class="product-btn" ><a href="./login.jsp" >Buy Now</a></button>
                        <button class="product-btn" ><a href="./login.jsp" >Add to Cart</a></button>
                     </div> 
                   <%
                        }
                     } else {
                %>
                   <p class="out">Out Of Stock</p>
                   <% } %>
            </div>
            <div class="product-des">
                <h2 class="product-name"><%= rs.getString(2) %></h2>
                <div class="price">
                    <h1><span>&#8377;</span><%= pretty_print_price(Integer.toString(discountPrice)) %></h1>
                    <div class="discount-price">
                    <span>&#8377;</span><strike><%= rs.getString(3) %></strike><span>&emsp;<%= rs.getString(6) %>% off</span>
                    </div>
                </div>
                
                <p class="description"><%= add_bull_desc(rs.getString(4)) %></p>

            </div>
        </div>

        <% } con.close(); 
    } 
    catch (Exception e) { 
    } %>
     
    </div>
    <div class="footer-wrapper">
        <%@ include file="footer.html" %>
    </div>
</body>
</html>