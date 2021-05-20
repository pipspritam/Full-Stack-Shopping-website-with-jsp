<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<html>
    <head>
        <title>
            Buy Now
        </title>
        <script type="text/javascript">
            function validate()
            {
                var address = document.getElementById("address");
                if(address.value.trim()=="")
                {
                    alert("address cann't be empty");
                    address.style.border = "solid 3px red";
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
        <div class="container" style="height: 100vh;">
    <%
        String id = request.getParameter("ID");
        try{
            Statement stmt=con.createStatement(); 
            Statement stmt1=con.createStatement(); 
            ResultSet rs=stmt.executeQuery("select * from item where product_id = '" + id + "'");
            ResultSet rs1=stmt1.executeQuery("select * from users where email = '" + (String)session.getAttribute("email") + "'");
            rs.next();
            rs1.next();
            int final_price = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
    %>
    
        <h1>
            ORDER DETAILS
        </h1>
        <div class="card">
            <p>
                <%= rs.getString(2) %>
            </p>
            <p>
                Price:  <span>&#8377;</span><%= final_price %> <span><strike>&#8377;<%= rs.getString(3) %></strike></span> <span><%= rs.getString(6) %>% off</span>
            </p>
            <form onsubmit="return validate();" action="./process_buy_now.jsp" method="POST">
                <input type="hidden" name="ID" value="<%= id %>">
                <table cellspacing="10">
                    <tr>
                        <td>Quantity:</td>
                        <td>
                            <input type="number" name="quantity" id="quantity" value="1"> <br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Delivery Address:
                        </td>
                        <td>
                            <textarea name="address" id="address"><%= rs1.getString("address") %></textarea> <br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="PROCESS ORDER">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%  
        con.close();
        }
	    catch (Exception e) { 
		}
    %>
    <div >
        <%@ include file="footer.html" %>
    </div>
    </body>
</html>