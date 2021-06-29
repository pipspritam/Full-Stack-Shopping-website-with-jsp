<%@ include file="dbconnect.jsp"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./css/account.css">
    <title>Account Details</title>
</head>

<body>
    <div class="container">
        <div class="box">
            <h2>Account Details</h2>
            <% 
            Statement stmt=con.createStatement();
            String email=(String)session.getAttribute("email");
            ResultSet rs=stmt.executeQuery("select * from users where email='"+email+ "'");
            if(rs.next())
            {
                %>
            <div class="details col-2">
                <p class="label">Name</p>
                <p><%=rs.getString("name")%></p>
                <p class="label">Email</p>
                <p><%=rs.getString("email")%></p>
                <p class="label">Phone</p>
                <p><%=rs.getString("phone")%></p>
                <p class="label">Pincode</p>
                <p><%=rs.getString("pincode")%></p>
                <p class="label">Address</p>
                <p><%=rs.getString("address")%></p>
            </div>
            <a href="edit_account.jsp" class="edit-btn">Edit Details</a>
        </div>
        <% } %>
    </div>

</body>
</html>