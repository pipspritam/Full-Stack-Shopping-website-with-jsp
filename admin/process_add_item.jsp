<%@ include file="admin_navbar.jsp" %>
<%@ include file="../dbconnect.jsp"%>
<html>
    <head>
        <title>
            Add Item
        </title>
    </head>
    <body>
        <%
        try
        {
            String pid=request.getParameter("pid");
            String pname=request.getParameter("pname");
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String company = request.getParameter("company");
            String category = request.getParameter("category");
            Statement stmt=con.createStatement();
	        ResultSet rs=stmt.executeQuery("select * from item where product_id='" + pid + "'");
            if(rs.next())
            {
%>
                <h1>Product ID Already Exists <a href="./add_item.jsp">Try Again</a></h1>
<%
            }
            else
            {
                int i=stmt.executeUpdate("insert into item values ('"+pid+"','"+pname+"',"+price+",'"+description+"',"+quantity+","+discount+",'"+company+"','"+category+"')");
%>
            <h1>Product has been added! Return to <a href="./admin_index.jsp">Home Page</a></h1>
<%
            }
            con.close();
        }
        catch(Exception e)
        {
            out.print(e);
        }
        %>
    </body>
</html>