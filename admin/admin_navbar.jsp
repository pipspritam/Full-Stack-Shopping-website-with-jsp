<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="../css/admin_navbar.css">
</head>

<body>
    <nav class="navbar">
        <a href="./admin_index.jsp" class="logo"><i class="fab fa-pied-piper-alt"></i>
            <h2>Pied Piper - Admin Panel</h2>
        </a>

        <ul class="menu">
            <%
            if(((String)session.getAttribute("admin_email"))==null){

                %>
            <li><a href="./admin_login.jsp">Add Item</a></li>
            <li><a href="./admin_login.jsp">Update Item</a></li>
            <li><a class="logout" href="./admin_login.jsp">Login</a></li>
            <%

            }
            else {
                %>
                <li><a href="./add_item.jsp">Add Item</a></li>
            <li><a href="./update_item.jsp">Update Item</a></li>
            <li><a class="logout" href="./admin_logout.jsp">logout</a></li>
            <%
            }

            %>

        </ul>

    </nav>


</body>

</html>