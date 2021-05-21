<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<html>
    <head>
        <title>
            Order Details
        </title>
        <script>
            function show_card() {
                document.getElementById("card_details").style.display = "block";
                return true;
            }
            function hide_card() {
                document.getElementById("card_details").style.display = "none";
                return true;
            }
            function radio_validate()
            {
                if(document.getElementById("COD").checked == true) {   
                    return true;
                } 
                else if(document.getElementById("Card").checked == true) {   
                    return true;
                }else {  
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
            int payable = qty*final_price;
            if(qty<= Integer.parseInt(rs.getString(5))) {
    %>
        <h1>
            ORDER DETAILS
        </h1>
        <p>
            <%= pname %>
        </p>
        <p>
            Price per item: <%= final_price %>
        </p>
        <p>
            Quantity: <%= qty %>
        </p>
        <p>
            Toyal Payable: <%= qty*final_price %>
        </p>
        <p>
            <h1>Delivery Details</h1>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><%=del_name%></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><%=del_phone%></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><%=addr%></td>
                </tr>
                <tr>
                    <td>Pincode: </td>
                    <td><%=del_pincode%></td>
                </tr>
            </table>
        </p>
        <form action="./bill.jsp" method="POST" onsubmit="return radio_validate()">
            <input type="hidden" name="payable" value="<%= payable %>">
            <input type="hidden" name="address" value="<%= addr %>">
            <input type="hidden" name="ID" value="<%= id %>">
            <input type="hidden" name="quantity" value="<%= qty %>">
            <input type="hidden" name="final_price" value="<%= final_price %>">
            <input type="hidden" name="pname" value="<%= pname %>">
            <input type="hidden" name="del_name" value="<%= del_name %>">
            <input type="hidden" name="del_phone" value="<%= del_phone%>">
            <input type="hidden" name="del_pincode" value="<%= del_pincode %>">
            <h1>Choose Payment Option</h1>
            <input type="radio" name="payment_option" id="COD" value="COD" onclick="hide_card()">
                <label for="COD">Cash On Delivery</label>
                <input type="radio" name="payment_option" id="Card" value="Card" onclick="show_card()">
                <label for="Card">Card</label>
                <table id="card_details" style="display: none;">
                    <tr>
                        <td>
                            Card Number: 
                        </td>
                        <td>
                            <input type="text" name="card_number" id="card_number">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Card Holder Name: 
                        </td>
                        <td>
                            <input type="text" name="card_holder_name" id="card_holder_name">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Valid Till
                        </td>
                        <td>
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
                        </td>
                        <td>
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CVV
                        </td>
                        <td>
                            <input type="password" name="cvv" id="cvv">
                        </td>
                    </tr>
                </table><br>
                <input type="submit" value="Pay <%= payable %>">
        </form>
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
        out.print("error");
    }
    %>
    </body>
</html>