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
        <% } %>

        <div class="order-div">
            <h1 class="title">Orders</h1>

            <div class="my-order">
                <div class="my-order-details">
                    <img src="product-1.jpg" alt="">
                    <div class="context">
                        <h3>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consequatur dolor nihil sint
                            deleniti
                            nisi sed.</h3>
                        <p>Order id : <span>12313131</span></p>
                        <p>Quantity : <span>1</span></p>
                        <p>Date : <span>12/123/13</span></p>
                        <p>Payment Method : <span>card</span></p>
                    </div>
                </div>
                <div class="price-div">
                    <h3><span>&#8377;</span>43252</h3>
                    <form action="">
                        <button class="print-btn">Print</button>
                    </form>

                </div>
            </div>
        </div>

    </div>
</body>

</html>