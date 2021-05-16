<%@ include file="admin_navbar.jsp" %>
<%@ include file="../dbconnect.jsp"%>
<html>
    <head>
        <title>
            Update Item
        </title>
    </head>
    <body>
        <%
        try
        {
            String pid=request.getParameter("ID");
            String pname=request.getParameter("pname");
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String company = request.getParameter("company");
            String category = request.getParameter("category");
            Statement stmt=con.createStatement();
            String sql = "update item set product_name='" + pname + "', price=" + price + ", description='" + description + "', quantity=" + quantity + ", discount=" + discount + ", company='" + company + "', category='" + category + "' where PRODUCT_ID='" +pid+ "'";
            int i=stmt.executeUpdate(sql);
%>
            <h1>Product has been updated! <a href="./update_item.jsp">Update</a> more items</h1>
<%
            con.close();
        }
        catch(Exception e)
        {
            out.print(e);
        }
        %>
    </body>
</html>