<%@ include file="admin_navbar.jsp" %>
<%@ include file="../dbconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../css/admin_index.css">
    <title>Admin Panel</title>
</head>

<body>
    <div class="container">
        <%
        if(!(((String)session.getAttribute("admin_email"))==null))
        {
        Statement stmt=con.createStatement(); 
        ResultSet rs=stmt.executeQuery("select count(*) from Users");
        rs.next();
        int numberOfUser = Integer.parseInt(rs.getString(1));
        ResultSet rs1=stmt.executeQuery("select count(*) from item");
        rs1.next();
        int numberOfProducts = Integer.parseInt(rs1.getString(1));
        ResultSet rs2=stmt.executeQuery("select count(distinct(category)) from item");
        rs2.next();
        int numberOfCategories = Integer.parseInt(rs2.getString(1));
        %>
        <h1 class="title">Admin Panel</h1>
        <div class="dash">
            <div class="box">
                <div class="icon"><img src="../image/team.png" alt="users"></div>
                <div class="number"><%= numberOfUser%></div>
                <div class="box-title">Users</div>
            </div>
            <div class="box">
                <div class="icon"><img src="../image/catagory.png" alt="users"></div>
                <div class="number"><%= numberOfCategories %></div>
                <div class="box-title">categories</div>
            </div>
            <div class="box">
                <div class="icon"><img src="../image/products.png" alt="users"></div>
                <div class="number"><%=numberOfProducts%></div>
                <div class="box-title">Products</div>
            </div>
        </div>
        <div class="order-div">
            <h1 class="title">Orders</h1>
            <%
            Statement stmt3=con.createStatement(); 
            ResultSet rs3=stmt3.executeQuery("select * from orders");
            int count = 0;
            while(count < 10 && rs3.next())
            {
                String imgName = rs3.getString("product_id") + ".jpg";
                String img_path = "../image/";
            %>
            <div class="my-order">
                <div class="my-order-details">
                    <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                    <div class="context">
                        <h3><%= rs3.getString("product_name") %></h3>
                        <p>Order id : <span><%= rs3.getString("order_id") %></span></p>
                        <p>Quantity : <span><%= rs3.getString("quantity") %></span></p>
                        <p>Date : <span><%= rs3.getString("buy_date") %></span></p>
                        <p>Payment Method : <span><%= rs3.getString("payment_method") %></span></p>
                    </div>
                </div>
                <div class="price-div">
                    <h3><span>&#8377;</span><%= rs3.getString("total_payable") %></h3>
                    <form action="./admin_print.jsp" target="_blank">
                        <input type="hidden" name="order_id" value="<%= rs3.getString("order_id") %>">
                        <input type="hidden" name="email" value="<%= rs3.getString("user_email") %>">
                        <button class="print-btn">Print</button>
                    </form>

                </div>
            </div>
            <% 
                count++;
            } %>
        </div>

    </div>
    <% }else{ %>
    <h1>PLEASE <a href="./admin_login.jsp">LOGIN</a> TO CONTINUE</h1>
    <% } %>
</body>

</html>