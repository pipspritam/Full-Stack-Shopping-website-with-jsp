<%@ include file="dbconnect.jsp" %>
<%
    try{
        Statement stmt1 = con.createStatement();
        int i2=stmt1.executeUpdate("insert into message_table values ('item added to cart')");
        String pid = request.getParameter("ID");
        String email = (String)session.getAttribute("email");
        Statement stmt=con.createStatement();
        ResultSet rs = stmt.executeQuery("select product_id, email from cart where product_id='" + pid + "' and email = '" + email + "'");
        if(rs.next())
        {
            int i=stmt.executeUpdate("update cart set quantity=quantity+1 where product_id='" + pid + "' and email='" + email + "'");
        }
        else{
            int i=stmt.executeUpdate("insert into cart values ('"+pid+"','"+email+"', 1)");
        }
        
        response.sendRedirect("index.jsp?message="+"Item added to cart");
    } catch (Exception e){
    }
%>