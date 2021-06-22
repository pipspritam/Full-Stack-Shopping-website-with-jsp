<%@ include file="dbconnect.jsp" %>
<%@ include file="navbar.jsp" %>
<%
    String del_name = request.getParameter("del_name");
    String del_email = request.getParameter("del_email");
    String del_phone = request.getParameter("del_phone");
    String del_pincode = request.getParameter("del_pincode");
    String del_address = request.getParameter("address");
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
                else if(cvv.value.trim()=="")
                {
                    alert("Enter CVV");
                    cvv.style.border = "solid 3px red";
                    return false;
                }
                return true;
            }
            else {  
                alert("Select a payment method");
                return false; 
            }
        }
        
    </script>

    <title>Document</title>
    <link rel="stylesheet" href="./css/process_cart_order.css">
</head>

<body>
    <div class="container">
        <div class="box">
            <h1>Order Details</h1>
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
                    <p>Quantity: <span><%= rs.getInt(5) %></span></p>
                </div>

            </div>
            
            <%
    }
    %>

    <div class="payable">
        <p>Total Payable: <%= pretty_print_price(Integer.toString(total_payable)) %></p>
    </div>
            

        </div>

        <div class="box">
            <h1>Delivery Details</h1>
            <div class="delivery-address-div col-2">
                <p class="label">Name </p>
                <p><%= del_name %></p>
                <p class="label">Email </p>
                <p><%= del_email %></p>
                <p class="label">Phone </p>
                <p><%= del_phone %></p>
                <p class="label">Address</p>
                <p><%= del_address %></p>
                <p class="label">Pincode</p>
                <p><%= del_pincode %></p>
            </div>
        </div>
        <form action="./intermediate_cart_order.jsp" method="post" class="payment-div box" onsubmit="return card_details_validate()">
            <h1>Choose Payment Option</h1>
            <div class="payment-option">
                <input type="radio" id="COD" name="payment_option" value="COD" onclick="hide_card()">
                <label for="COD">Cash On Delivery</label>
                <input type="radio" id="Card" name="payment_option" value="Card" onclick="show_card()">
                <label for="Card">Card</label>
            </div>
            <div class="address-div" style="display: none;">
                <div class="input-box">
                    <label for="card-holder-name">Card Holder Name</label>
                    <input name="card-holder-name" type="text" id="card_holder_name">
                </div>
                <div class="input-box">
                    <label for="card-number">Card Number</label>
                    <input name="card-number" type="number" id="card_number">
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
                <input type="hidden" name="del_name" value="<%= del_name %>">
            <input type="hidden" name="del_email" value="<%= del_email %>">
            <input type="hidden" name="del_phone" value="<%= del_phone %>">
            <input type="hidden" name="del_address" value="<%= del_address %>">
            <input type="hidden" name="del_pincode" value="<%= del_pincode %>">
                
            </div>
            <div class="input-box procced-btn-div">
                <button>Pay <span><%= pretty_print_price(Integer.toString(total_payable))%></span></button>
            </div>
            
        </form>
        <form>
            <button formaction="./place_order.jsp">Cancel</button>
        </form>
    </div>
    <%
    con.close();
} catch(Exception e){}
%>
</body>

</html>