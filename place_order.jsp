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
        %>
        
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Place Order</title>
    <link rel="stylesheet" href="./css/place_order.css">
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
    <div class="container">
        <h1>Order Details</h1>
        <div class="col-2">

            <div class="box">
                <h2>Product List</h2>
                <% 
        while(rs.next()){
            int final_price = (rs.getInt(2)*(100 - rs.getInt(3)))/100;
            total_payable += (final_price * rs.getInt(5));
            String imgName = rs.getString(6) + ".jpg";
            String img_path = "./image/";
%>
                <div class="product col-2">
                    <div class="product-img-div">
                        <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                    </div>
                    <div class="product-details">
                        <h3><%= rs.getString("product_name") %></h3>
                        <p>Price: <span>&#8377;</span><%= pretty_print_price(Integer.toString(final_price)) %></p>
                        <p>Quantity: <%= rs.getInt(5) %></p>
                    </div>

                </div>
                <%
        }
        %>

                <div class="total-price">
                    <h2>Total Amount : <span>&#8377;</span> <%= pretty_print_price(Integer.toString(total_payable)) %></h2>

                </div>
            </div>

            <div class="box address-div">
                <h2>Delivery Address</h2>
                <form class=" col-2" onsubmit="return validate();" action="./process_cart_order.jsp" method="POST">
                    <div class="input-box">
                        <label for="del_name">Name</label>
                        <input type="text" name="del_name" id="del_name" value="<%= rs1.getString("NAME")%>">
                    </div>
                    <div class="input-box">
                        <label for="del_email">Email</label>
                        <input type="text" name="del_email" id="del_email" value="<%= rs1.getString("email")%>">
                    </div>
                    <div class="input-box">
                        <label for="del_phone">Phone</label>
                        <input type="text" name="del_phone" id="del_phone" value="<%= rs1.getString("PHONE")%>">
                    </div>
                    <div class="input-box">
                        <label for="del_pincode">Pincode</label>
                        <input type="text" name="del_pincode" value="<%= rs1.getString("PINCODE")%>" id="del_pincode">
                    </div>
                    <div class="input-box">
                        <label for="address">Address</label>
                        <textarea  cols="30" rows="6" name="address" id="address"><%= rs1.getString("address") %></textarea>
                    </div>
                    <div class="procced-btn-div">
                        <button formaction="./cart.jsp">Cancel</button>
                        <button>Process Order</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
    <%    
    } catch(Exception e){out.print("Exception");}
        %>
</body>

</html>