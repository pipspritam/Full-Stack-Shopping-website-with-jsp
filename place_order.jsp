<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<%
    try{
        String email = (String)session.getAttribute("email");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select product_name, price, discount, item.quantity, cart.quantity,cart.product_id from item, cart where cart.product_id=item.product_id and cart.email='"+email+"'");
        int total_payable = 0;
        Statement stmt1=con.createStatement(); 
        ResultSet rs1=stmt1.executeQuery("select * from users where email = '" + email + "'");
        rs1.next();
        while(rs.next()){
            int final_price = (rs.getInt(2)*(100 - rs.getInt(3)))/100;
            total_payable += (final_price * rs.getInt(5));
%>
<html>
    <head>
        <title>
            Place Order
        </title>
        <script type="text/javascript">
            function validate()
            {
                var address = document.getElementById("address");
                var del_name = document.getElementById("del_name");
                var del_phone = document.getElementById("del_phone");
                var del_pincode = document.getElementById("del_pincode");
                
                if(address.value.trim()=="")
                {
                    alert("address cann't be empty");
                    address.style.border = "solid 3px red";
                    return false;
                }
                else if(del_name.value.trim()=="")
                {
                    alert("Name cann't be empty");
                    del_name.style.border = "solid 3px red";
                    return false;
                }
                else if(del_phone.value.trim()=="")
                {
                    alert("Phone number cann't be empty");
                    del_phone.style.border = "solid 3px red";
                    return false;
                }
                else if(del_pincode.value.trim()=="")
                {
                    alert("Pincode cann't be empty");
                    del_pincode.style.border = "solid 3px red";
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
        <h1>Product Name: <%= rs.getString("product_name") %></h1>
        <p>Price: <%= pretty_print_price(Integer.toString(final_price)) %></p>
        <p>Quantity: <%= rs.getInt(5) %></p>
        <%
        }
        %>
        <p>Total Payable: <strong><%= pretty_print_price(Integer.toString(total_payable)) %></strong></p>
        <form onsubmit="return validate();" action="./process_cart_order.jsp" method="POST">
            <table cellspacing="10">
                <tr><td>Delivery Address</td></tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="del_name" id="del_name" value="<%= rs1.getString("NAME")%>"></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" name="del_email" id="del_email" value="<%= rs1.getString("email")%>"></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><input type="text" name="del_phone" id="del_phone" value="<%= rs1.getString("PHONE")%>"></td>
                </tr>
                <tr>
                    <td>
                        Address (Area & Street):
                    </td>
                    <td>
                        <textarea name="address" id="address"><%= rs1.getString("address") %></textarea> <br>
                    </td>
                </tr>
                <tr>
                    <td>Pincode: </td>
                    <td><input type="text" name="del_pincode" value="<%= rs1.getString("PINCODE")%>" id="del_pincode"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="PROCESS ORDER">
                    </td>
                </tr>
            </table>
        </form>
        <%    
    } catch(Exception e){out.print("Exception");}
        %>
    </body>
</html>