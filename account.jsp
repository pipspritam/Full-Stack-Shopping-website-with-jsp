<html>
    <head>
        <%@ include file="dbconnect.jsp"%>
        <%@ include file="navbar.jsp"%>
        <%@ page contentType="text/html" pageEncoding="UTF-8"%>
           
    </head>
    <body>
        
        <div>
            <center><h1>Account Details</h1></center>
            <% 
            Statement stmt=con.createStatement();
            String email=(String)session.getAttribute("email");
            ResultSet rs=stmt.executeQuery("select * from users where email='"+email+ "'");
            if(rs.next())
            {
                %> <form action="logout.jsp" method="POST">
                    <div >
                        <table >
                            <tr>
                                <td>Name: </td>
                                <td><%=rs.getString("name")%></td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><%=rs.getString("email")%></td>
                            </tr>
                            <tr>
                                <td>Phone: </td>
                                <td><%=rs.getString("phone")%></td>
                            </tr>
                            <tr>
                                <td>Address: </td>
                                <td><Address><%=rs.getString("address")%></Address></td>
                            </tr>
                            <tr>
                                <td>Pincode: </td>
                                <td><%=rs.getString("pincode")%></td>
                            </tr>
                            
                            <tr>
                                <td></td><td><a href="edit_account.jsp">Edit account</a></td>
                            </tr>
                            
                            
                        </table>
                    </div>
                    </form>
                <% } %>
        </div>   
    </body>
</html>