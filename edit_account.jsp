<html>
    <head>
        <%@ include file="dbconnect.jsp"%>
        <%@ include file="navbar.jsp"%>
        <%@ page contentType="text/html" pageEncoding="UTF-8"%>
           
        <script type="text/javascript">
            function validate()
            {
                var name = document.getElementById("name");
                
                var phone = document.getElementById("phone");
                var pass = document.getElementById("pass");
                var cpass = document.getElementById("cpass");
                var address = document.getElementById("address");
                var pincode = document.getElementById("pincode");
                if(name.value.trim()=="")
                {
                    alert("Name cann't be empty");
                    name.style.border = "solid 3px red";
                    return false;
                }
                else if(phone.value.trim()=="")
                {
                    alert("Phone cann't be empty");
                    phone.style.border = "solid 3px red";
                    return false;
                }
                else if(pass.value.trim()=="")
                {
                    alert("Password cann't be empty");
                    pass.style.border = "solid 3px red";
                    return false;
                }
                else if(cpass.value.trim()=="")
                {
                    alert("Password cann't be empty");
                    cpass.style.border = "solid 3px red";
                    return false;
                }
                else if(address.value.trim()=="")
                {
                    alert("Address cann't be empty");
                    address.style.border = "solid 3px red";
                    return false;
                }
                else if(pincode.value.trim()=="")
                {
                    alert("Pincode cann't be empty");
                    pincode.style.border = "solid 3px red";
                    return false;
                }
                else if(pass.value!=cpass.value)
                {
                    alert("Password and Conform password do not match!!");
                    pass.style.border = "solid 3px red";
                    cpass.style.border = "solid 3px red";
                    return false;
                }
                else
                {
                    return true;
                }
            }
        </script>
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
                %> <form onsubmit="return validate()" action="update_account.jsp" method="POST">
                    <div >
                        <table >
                            <tr>
                                <td>Name: </td>
                                
                                <td><input id="name" type="text" name="name" value="<%=rs.getString("name")%>"></td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><%=rs.getString("email")%></td>
                            </tr>
                            <tr>
                                <td>Phone: </td>
                                <td><input id="phone" type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
                            </tr>
                            <tr>
                                <td>Address: </td>
                                <td><input id="address" type="text" name="address" value="<%=rs.getString("address")%>"></td>
                            </tr>
                            <tr>
                                <td>Pincode: </td>
                                <td><input id="pincode" type="text" name="pincode" value="<%=rs.getString("pincode")%>"></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input id="pass" type="password" name="password" value="<%=rs.getString("password")%>"></td>
                            </tr>
                            <tr>
                                <td>Conform Password: </td>
                                <td><input id="cpass" type="password" name="conformpassword" value="<%=rs.getString("password")%>"></td>
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