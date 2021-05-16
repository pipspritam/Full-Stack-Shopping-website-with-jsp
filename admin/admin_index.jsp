<%@ include file="admin_navbar.jsp" %>
<%@ include file="../dbconnect.jsp" %>
<html>
    <head>
        <title>Admin index</title>
    </head>
    <body>
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
        <h1><center>Admin Panel</center></h1>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Users: <%= numberOfUser%></h1>
                        
                </div>
                <div class="col">
                    <h1>Categories: <%= numberOfCategories %></h1>
                </div>
                <div class="col">
                    <h1>Products: <%=numberOfProducts%></h1>
                </div>
            </div>
        </div>
        <% } %>
    </body>
</html>