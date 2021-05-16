<html>
    <body>
        <% 
        try{
            session.setAttribute("email",null); 
            response.sendRedirect("index.jsp");
        }
        catch(Exception e)
        {
            out.print(e);
        }
         %>
    </body>
</html>