<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="navbar.jsp" %>
    <%@ include file="dbconnect.jsp" %>
    <title>Buy Now</title>
    <link rel="stylesheet" href="./css/buy_now.css">
    <script type="text/javascript">
        function validate()
        {
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
            else if(del_email.value.trim()=="")
            {
                alert("Email cann't be empty");
                del_email.style.border = "solid 3px red";
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
    <%
        String id = request.getParameter("ID");
        try{
            Statement stmt=con.createStatement(); 
            ResultSet rs=stmt.executeQuery("select * from item where product_id = '" + id + "'");
            Statement stmt1=con.createStatement();
            ResultSet rs1=stmt1.executeQuery("select * from users where email = '" + (String)session.getAttribute("email") + "'");
            rs1.next();
            rs.next();
            int final_price = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
            String imgName = rs.getString(1) + ".jpg";
            String img_path = "./image/";
    %>
    <div class="container">
        <form class="order-div" onsubmit="return validate();" action="./process_buy_now.jsp" method="POST">
            <h1>Order Details</h1>
            <div class="product-details-div">
                <div class="product-img-div">
                    <input type="hidden" name="ID" value="<%= id %>">
                    <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                </div>
                <div class="product-details">
                    <h3><%= rs.getString(2) %></h3>
                    <p>Price: <span>&#8377;</span><%= pretty_print_price(Integer.toString(final_price)) %> </p>
                    <div class="discount-price">
                        <span>&#8377;</span><strike>500</strike><span>&emsp; 5% off</span>
                    </div>
                    <p>Quantity: <input type="number" min="1" name="quantity" id="quantity" value="1" max="9"></p>
                </div>

            </div>
            <div class="address-div">
                <h3>Delivery Address</h3>
                <div class="input-box">
                    <label for="name">Name</label>
                    <input type="text" name="del_name" id="del_name" value="<%= rs1.getString(1)%>">
                </div>
                <div class="input-box">
                    <label for="email">Email</label>
                    <input name="del_email" type="email" id="del_email" value="<%= rs1.getString(2)%>">
                </div>
                <div class="input-box number">
                    <label for="phone">Phone</label>
                    <input  type="number" name="del_phone" id="del_phone" value="<%= rs1.getString(3)%>">
                </div>
                <div class="input-box number">
                    <label for="pincode">Pincode</label>
                    <input  name="del_pincode"  type="number" id="del_pincode" value="<%= rs1.getString(6)%>">
                </div>



                <div class="input-box">
                    <label for="address">Address</label>
                    <textarea name="address" id="address" cols="30" rows="6"><%= rs1.getString("address") %></textarea>
                </div>


            </div>
            <div class="procced-btn-div">
                <input  type="submit" value="PROCESS ORDER">
            </div>
        </form>
    </div>
    <% 
        con.close();
        }
	    catch (Exception e) { 
		}
    %>
</body>

</html>