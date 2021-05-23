<!DOCTYPE html>
<html lang="en">
<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link rel="stylesheet" href="./final_buy_now.css">
    <script>

        function show_card() {
            document.getElementsByClassName("address-div")[0].style.display = "grid";
            return true;
        }
        function hide_card() {
            document.getElementsByClassName("address-div")[0].style.display = "none";
            return true;
        }
        function card_details_validate()
        {
            if(document.getElementById("COD").checked == true) {   
                return true;
            } 
            else if(document.getElementById("Card").checked == true) {  
                if(card_number.value.trim()=="")
                {
                    alert("Enter a valid card number");
                    card_number.style.border = "solid 3px red";
                    return false;
                }
                else if(card_holder_name.value.trim()=="")
                {
                    alert("Enter a valid card holder name");
                    card_holder_name.style.border = "solid 3px red";
                    return false;
                }
                else if(card_holder_name.value.trim()=="")
                {
                    alert("Enter a valid card holder name");
                    card_holder_name.style.border = "solid 3px red";
                    return false;
                }
                return true;
            }
            else {  
                alert("Select a patment method");
                return false; 
            }
        }
        
    </script>
</head>

<body>
    <%
        String id = request.getParameter("ID");
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from item where product_id='"+id+"'");
            int total_payable = 0;
            Statement stmt1=con.createStatement(); 
            ResultSet rs1=stmt1.executeQuery("select * from users where email = '" + (String)session.getAttribute("email") + "'");
            rs.next();
            rs1.next();
            int final_price = (rs.getInt(3)*(100 - rs.getInt(6)))/100;
            int qty = Integer.parseInt(request.getParameter("quantity"));
            String addr = request.getParameter("address");
            String pname = rs.getString(2);
            String del_name = request.getParameter("del_name");
            String del_phone = request.getParameter("del_phone");
            String del_pincode = request.getParameter("del_pincode");
            String del_email = request.getParameter("del_email");
            int payable = qty*final_price;
            String imgName = id+ ".jpg";
            String img_path = "./image/";
            if(qty<= Integer.parseInt(rs.getString(5))) {
    %>
    <div class="container">
        <div class="col-2">
            <div class="order-div">
                <h1>Order Details</h1>
                <div class="product-details-div">
                    <div class="product-img-div">
                        <img src="<%= img_path+imgName %>" alt="./image/product-1.jpg" onerror="this.onerror=null; this.src='./image/default.jpg'">
                    </div>
                    <div class="product-details">
                        <h3><%= pname %></h3>
                        <p>Price per item: <span>&#8377;</span><%= final_price %></p>
                        <p>Quantity: <span><%= qty %></span></p>
                        <p>Total Price: <span>&#8377;</span><%= qty*final_price %></p>
                    </div>

                </div>
            </div>

            <div class="delivery-box order-div">
                <h1>Delivery Details</h1>
                <div class="delivery-address-div">
                    <p class="label">Name </p>
                    <p><%=del_name%></p>
                    <p class="label">Email </p>
                    <p><%=del_email%></p>
                    <p class="label">Phone </p>
                    <p><%=del_phone%></p>
                    <p class="label">Address</p>
                    <p><%=addr%></p>
                    <p class="label">Pincode</p>
                    <p><%=del_pincode%></p>
                </div>
            </div>
        </div>
        <form action="./bill.jsp" method="POST" class="payment-div order-div" onsubmit="return card_details_validate()">
            <input type="hidden" name="payable" value="<%= payable %>">
            <input type="hidden" name="address" value="<%= addr %>">
            <input type="hidden" name="ID" value="<%= id %>">
            <input type="hidden" name="quantity" value="<%= qty %>">
            <input type="hidden" name="final_price" value="<%= final_price %>">
            <input type="hidden" name="pname" value="<%= pname %>">
            <input type="hidden" name="del_name" value="<%= del_name %>">
            <input type="hidden" name="del_email" value="<%= del_email %>">
            <input type="hidden" name="del_phone" value="<%= del_phone%>">
            <input type="hidden" name="del_pincode" value="<%= del_pincode %>">
            <h1>Choose Payment Option</h1>
            <div class="payment-option">
                <input type="radio" id="COD" name="payment_option" value="COD" onclick="hide_card()">
                <label for="COD">Cash On Delivery</label>
                <input type="radio" id="Card" name="payment_option" value="Card" onclick="show_card()">
                <label for="Card">Card</label>
            </div>
            
            <div class="address-div" style="display: none;">
                <div class="input-box">
                    <label for="card_holder_name">Card Holder Name</label>
                    <input type="text" name="card_holder_name" id="card_holder_name">
                </div>
                <div class="input-box">
                    <label for="card_number">Card Number</label>
                    <input type="text" name="card_number" id="card_number">
                </div>
                <div class="input-box valid-date">
                    <label for="month">Valid Till</label>
                    <select name="month" id="month">
                        <option value="january">January</option>
                        <option value="february">February</option>
                        <option value="march">March</option>
                        <option value="april">April</option>
                        <option value="may">May</option>
                        <option value="june">June</option>
                        <option value="july">July</option>
                        <option value="august">August</option>
                        <option value="september">September</option>
                        <option value="october">October</option>
                        <option value="november">November</option>
                        <option value="december">December</option>
                      </select>
                </select>
                <select name="year" id="year">
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                  </select>

                </div>
                <div class="input-box">
                    <label for="cvv">CVV</label>
                    <input type="password" name="cvv" id="cvv">
                </div>
                
            </div>
      
            <div class="input-box procced-btn-div">
                <input type="submit" value="Pay <%= payable %>">
            </div>

        </form>
    </div>
    <%
            }
            else
            {
    %>
                <h1>Quantity unavailable</h1>
                <a href="./index.jsp">Go back to previous page</a>
    <%
            }
    con.close();
    }
    catch (Exception e) { 
        out.print("Exception");
    }
    %>
</body>

</html>