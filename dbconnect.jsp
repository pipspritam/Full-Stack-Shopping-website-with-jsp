<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.time.*" %>
<%!
    String pretty_print_price(String price){
        int numLen = price.length(), pos = 0;
        String pretty_price = price;
        if(numLen > 3)
        {
            pos = numLen - 3;
            numLen -= 3;
            pretty_price = price.substring(0, pos) + "," + price.substring(pos);
        }
        
        while(numLen > 2)
        {
            pos = numLen - 2;
            numLen -= 2;
            pretty_price = pretty_price.substring(0, pos) + "," + pretty_price.substring(pos);
        }

        return pretty_price;
    }
%>
<%
Connection con=null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver"); 
con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","xe","Pritam@99");
}catch(Exception e){
out.println(e);
}
%>