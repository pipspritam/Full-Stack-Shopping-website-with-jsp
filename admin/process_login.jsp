<%@ include file="../dbconnect.jsp"%>
	<%@ page contentType="text/html" pageEncoding="UTF-8" %>
		<html>
		<head>
			<title>Process Login</title>
		</head>

		<body>
		
			<% 
				String email=request.getParameter("email"); 
				String pass=request.getParameter("pass"); 
				boolean res=false;
				try { 
					
					Statement stmt=con.createStatement(); 
					ResultSet rs=stmt.executeQuery("select * from admin where email='" + email + "'"); 
		
					res = rs.next();
					if(!res) {
						%>
						<div class="container">
						<h1>
							Email does not exist!</h1> <a href="./admin_login.jsp">
							Login Again</a></div>
						<% }
					else if(rs.getString(3).equals(pass)) {
						session.setAttribute("admin_email", email); 
						session.setAttribute("admin_name", rs.getString(1));
						response.sendRedirect("./admin_index.jsp");
					} 
					else{ %>
						<div class="container"> <h1>Incorrect Password ! </h1>
						<a href="./admin_login.jsp">Login Again</a> </div>
					<% }
						
						con.close(); 
					}
				     catch (Exception e) { 
							out.print("exc");
						}
					 %>

	</body>
</html>