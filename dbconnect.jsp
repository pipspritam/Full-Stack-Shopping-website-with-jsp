<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
Connection con=null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver"); 
con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","xe","xe");
}catch(Exception e){
out.println(e);
}
%>