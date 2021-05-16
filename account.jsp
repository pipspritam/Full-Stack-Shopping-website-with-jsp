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
                                <td><%=rs.getString(1)%></td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><%=rs.getString(2)%></td>
                            </tr>
                            <tr>
                                <td>Phone: </td>
                                <td><%=rs.getString(3)%></td>
                            </tr>
                            <tr>
                                <td>Address: </td>
                                <td><Address><%=rs.getString(5)%></Address></td>
                            </tr>
                            
                            <tr>
                                <td></td><td><a href="#">Edit account</a></td>
                            </tr>
                            <tr>
                                <td></td><td><input type="Submit" value="Logout"></td>
                            </tr>
                            
                        </table>
                    </div>
                    </form>
                <% } %>
        </div>   
    </body>
</html>