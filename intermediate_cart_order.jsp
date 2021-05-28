<%@ include file="dbconnect.jsp" %>
<%!
    String get_order_id(String pid, String email)
    {
        String tme = java.time.LocalTime.now().toString();
        String new_pid = pid.substring(0,2);
        String new_email = email.substring(0,2);
        String order_id = "OD"+tme+new_pid+new_email;
        return order_id;
    }
%>
<%
    String email = (String)session.getAttribute("email");
    Statement deletStmt = con.createStatement();
    String sql4 = "delete from temp_order where email = '" + email + "'";
    int i5 = deletStmt.executeUpdate(sql4);
    String del_name = request.getParameter("del_name");
    String del_email = request.getParameter("del_email");
    String del_phone = request.getParameter("del_phone");
    String del_pincode = request.getParameter("del_pincode");
    String del_address = request.getParameter("del_address");
    String payment_option = request.getParameter("payment_option");
    String buy_date = java.time.LocalDate.now().toString();
    String buy_time = java.time.LocalTime.now().toString();
    try{
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select product_name, price, discount, item.quantity, cart.quantity,cart.product_id from item, cart where cart.product_id=item.product_id and cart.email='"+email+"'");
        int total_payable = 0;
        while(rs.next()){
            int final_price = (rs.getInt(2)*(100 - rs.getInt(3)))/100;
            total_payable += (final_price * rs.getInt(5));
            String order_id = get_order_id(rs.getString(6), email);
            Statement stmt3=con.createStatement();
            String sql1 = "insert into orders values ('" + order_id + "', '" + buy_date + "', '" + email + "', '" + rs.getString(6) + "', " + rs.getString(5) + ", " + total_payable + ", '" + del_name + "', '" + del_phone + "', '" + del_address + "', '" + del_pincode + "', '" + rs.getString(1) + "', '" + payment_option + "', '" + buy_time + "', '" + del_email + "', " + final_price + ")";
            int i1=stmt3.executeUpdate(sql1);
            Statement stmt4 = con.createStatement();
            int i2 = stmt4.executeUpdate("insert into temp_order values('" + order_id + "', '" + email + "')");
            Statement stmt5 = con.createStatement();
            String sql2 = "update item set quantity=quantity-"+rs.getString(5)+" where product_id='" + rs.getString(6) + "'";
            int i3 = stmt5.executeUpdate(sql2);
            Statement stmt6 = con.createStatement();
            String sql3 = "delete from cart where email = '" + email + "'";
            int i4 = stmt6.executeUpdate(sql3);
            response.sendRedirect("cart_bill.jsp");
        }
%>
<%
    } catch (Exception e){out.print("EXc");}
%>