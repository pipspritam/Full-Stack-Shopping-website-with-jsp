<html>
    <body>
        <% 
        try{
            session.setAttribute("admin_email",null); 
            response.sendRedirect("admin_login.jsp");
        }
        catch(Exception e)
        {
            out.print(e);
        }
         %>
    </body>
</html>