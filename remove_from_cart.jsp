<%@ include file="dbconnect.jsp" %>
<%
    String pid = request.getParameter("ID");
    try { 
        PreparedStatement ps=con.prepareStatement("delete from cart where product_id='"+pid+"'");
        int i=ps.executeUpdate();
        con.close();
        response.sendRedirect("cart.jsp");
    } catch (Exception e) {}
%>