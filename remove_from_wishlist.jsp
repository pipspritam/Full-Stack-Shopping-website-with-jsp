<%@ include file="dbconnect.jsp" %>
<%
    String email = (String)session.getAttribute("email");
    String product_id = request.getParameter("pid");
    PreparedStatement ps=con.prepareStatement("delete from wishlist where product_id='"+product_id+"'");
    int i=ps.executeUpdate();
    response.sendRedirect("./wishlist.jsp");
%>