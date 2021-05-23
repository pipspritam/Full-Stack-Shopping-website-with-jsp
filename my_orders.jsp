<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<html>
    <head>
        <title>
            My Orders
        </title>
    </head>
    <body>
        <h1>My Orders</h1>
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
            while(rs.next()){
                flag = true;                

%>
    <p><strong> Product Name:</strong> <%= rs.getString("product_name") %></p>
    <p><strong> Quantity:</strong> <%= rs.getString("quantity") %></p>
    <p><strong> Date:</strong> <%= rs.getString("buy_date") %></p>
    <p><strong> Total Paid:</strong> <%= pretty_print_price(Integer.toString(rs.getInt("total_payable"))) %></p> <hr>
<%
            }
        }catch(Exception e){}
    }
%>
</body>
</html>