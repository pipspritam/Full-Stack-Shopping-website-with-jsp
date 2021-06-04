<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<%
    String email = (String)session.getAttribute("email");
    Statement stmt1=con.createStatement(); 
    Statement stmt2=con.createStatement(); 
    ResultSet rs1=stmt1.executeQuery("select * from wishlist where email = '" + email + "'");
    boolean flag = false;
    while(rs1.next())
    {
        flag = true;
        ResultSet rs2=stmt2.executeQuery("select * from item where product_id = '" + rs1.getString(2) + "'");
        rs2.next();
%>
    <p>PRODUCT NAME: <%= rs2.getString("product_name") %></p>
    <form>
        <input type="hidden" name="pid" value="<%= rs1.getString(2) %>">
        <button class="button" formaction="./remove_from_wishlist.jsp">REMOVE</button>
    </form>
<%
    }
    if(!flag)
    {
%>
    <h1>Wishlist is empty!</h1>
<%
    }
%>