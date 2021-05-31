<html>
    <body>
        <%@ include file="dbconnect.jsp"%>
        <%@ page contentType="text/html" pageEncoding="UTF-8"%>
        <%
        try{
            String email=(String)session.getAttribute("email");
            String password=request.getParameter("password");
            String conformpassword=request.getParameter("conformpassword");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String pincode = request.getParameter("pincode");
            String address = request.getParameter("address");


            PreparedStatement ps =con.prepareStatement("Update users set name=?,phone=?, password=?, address=?, pincode=?  where email='"+email+"'");
            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setString(3,password);
            ps.setString(4,address);
            ps.setString(5,pincode);
            int i = ps.executeUpdate();
            
            response.sendRedirect("account.jsp");
            con.close();
        }
        catch(Exception e)
        {
            out.print(e);
        }    
        %>
    </body>
</html>