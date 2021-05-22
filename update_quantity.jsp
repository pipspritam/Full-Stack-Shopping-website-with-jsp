<%@ include file="dbconnect.jsp" %>
<%
    try{
        String pid = request.getParameter("ID");
        String email = (String)session.getAttribute("email");
        Statement stmt=con.createStatement();
        ResultSet rs = stmt.executeQuery("select quantity from cart where product_id='" + pid + "' and email = '" + email + "'");
        rs.next();
        if((Integer.parseInt(rs.getString("quantity")))<9)
        {
            int i=stmt.executeUpdate("update cart set quantity=quantity+1 where product_id='" + pid + "' and email='" + email + "'");
        }
        response.sendRedirect("cart.jsp");
    } catch (Exception e){
        out.print("Exception");
    }
%>