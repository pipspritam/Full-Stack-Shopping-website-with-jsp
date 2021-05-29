<%@ include file="../dbconnect.jsp" %>
<%@ include file="admin_navbar.jsp" %>
<%
    String pid=request.getParameter("ID"); 
try { 
    
    PreparedStatement ps=con.prepareStatement("delete from item where product_id='"+pid+"'");
    int i=ps.executeUpdate();
    con.close();
    response.sendRedirect("update_item.jsp");
} catch (Exception e) {}
%>