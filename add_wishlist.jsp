<%@ include file="dbconnect.jsp" %>
<%
    String email = (String)session.getAttribute("email");
    String pid = request.getParameter("pid");
    Statement stmt = con.createStatement();
    Statement stmt2 = con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from wishlist where email = '" + email + "' and product_id = '" + pid + "'");
    if(!rs.next())
    {
        int i=stmt.executeUpdate("insert into wishlist values ('"+email+"','"+pid+"')");
    }
    response.sendRedirect("./index.jsp");
%>