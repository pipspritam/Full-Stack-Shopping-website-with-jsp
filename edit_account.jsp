<html>
    <head>
        <%@ include file="dbconnect.jsp"%>
        <%@ include file="navbar.jsp"%>
        <%@ page contentType="text/html" pageEncoding="UTF-8"%>
           
    </head>
    <body>
        
        <div>
            <center><h1>Update Account Details</h1></center>
            <% 
            Statement stmt=con.createStatement();
            String email=(String)session.getAttribute("email");
            ResultSet rs=stmt.executeQuery("select * from users where email='"+email+ "'");
            if(rs.next())
            {
                %> <form action="update_account.jsp" method="POST">
                    <div >
                        <table >
                            <tr>
                                <td>Name: </td>
                                
                                <td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><%=rs.getString("email")%></td>
                            </tr>
                            <tr>
                                <td>Phone: </td>
                                <td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
                            </tr>
                            <tr>
                                <td>Address: </td>
                                <td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
                            </tr>
                            <tr>
                                <td>Pincode: </td>
                                <td><input type="text" name="pincode" value="<%=rs.getString("pincode")%>"></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input type="password" name="password" value="<%=rs.getString("password")%>"></td>
                            </tr>
                            <tr>
                                <td>Conform Password: </td>
                                <td><input type="password" name="conformpassword" value="<%=rs.getString("password")%>"></td>
                            </tr>
                            
                            
                            <tr>
                                <td></td><td><input type="Submit" value="Update"></td>
                            </tr>
                            
                        </table>
                    </div>
                    </form>
                <% } %>
        </div>   
    </body>
</html>