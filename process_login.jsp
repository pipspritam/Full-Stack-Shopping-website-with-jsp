<%@ include file="navbar.jsp"%>
<%@ include file="dbconnect.jsp"%>
	<%@ page contentType="text/html" pageEncoding="UTF-8" %>
		<html>

		<head>
			<title>Table</title>
			<style>
				.container{
					text-align: center;
					padding: 20px;
					color: black;
				}

				.container h1{
					color: black;
				}

				.container a{
            text-decoration: none;
            color: black;
            padding: 0;
            border-bottom: 2px solid black;
        }

        .container a:hover{
            border-bottom: 2px transparent;
        }
			</style>
		</head>

		<body>
		
			<% 
				String email=request.getParameter("email"); 
				String pass=request.getParameter("pass"); 
				boolean res=true;
				try { 
					
					Statement stmt=con.createStatement(); 
				
					ResultSet rs=stmt.executeQuery("select * from users where email='" + email + "'"); 
		
					res = rs.next();
					if(!res) {
						%>
						<div class="container">
						<h1>
							Email does not exist!</h1> <a href="./login.jsp">
							Login Again</a> or <a href="./register.jsp">Sign Up</a> </div>
						<% }
					else if(rs.getString(4).equals(pass)) {
						session.setAttribute("email", email); 
						session.setAttribute("name", rs.getString(1));
						response.sendRedirect("./index.jsp");
					} 
					else{ %>
						<div class="container"> <h1>Incorrect Password ! </h1>
						<a href="./login.jsp">Login Again</a> </div>
					<% }
						
						con.close(); 
					}
				     catch (Exception e) { 
							
						}
					 %>

		</body>
		</html>