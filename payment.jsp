<%@ include file="navbar.jsp" %>
<%@ include file="dbconnect.jsp" %>
<%
    String payable = request.getParameter("payable");
    String quantity = request.getParameter("quantity");
    String pid = request.getParameter("ID");
    String address = request.getParameter("address");
%>
<html>
    <head>
        <script>
            function show_card() {
                document.getElementById("card_details").style.display = "block";
                return true;
            }
            function hide_card() {
                document.getElementById("card_details").style.display = "none";
                return true;
            }
        </script>
    </head>
    <body>
        <p>
            Total Payable - <%= payable %>
        </p>
        <h1>
            Payment Options
        </h1>
        <div>
            <form action="./bill.jsp">
                <input type="hidden" name="ID" value="<%= pid %>">
                <input type="hidden" name="address" value="<%= address %>">
                <input type="hidden" name="quantity" value="<%= quantity %>">
                <input type="hidden" name="payable" value="<%= payable %>">
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
                            Valid Till
                        </td>
                        <td>
                            <input type="text" name="valid_month" id="valid_month">
                        </td>
                        <td>
                            <input type="text" name="valid_year" id="valid_year">
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
        </div>
    </body>
</html>