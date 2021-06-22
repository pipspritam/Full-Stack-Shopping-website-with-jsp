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
    String pid = request.getParameter("ID");
    Statement stmt4=con.createStatement();
    ResultSet rs4=stmt4.executeQuery("select * from item where product_id='"+pid+"'");
    rs4.next();

    String payable = request.getParameter("payable");
    String final_price = request.getParameter("final_price");
    String payment_option = request.getParameter("payment_option");
    String quantity = request.getParameter("quantity") ;
    int qty = Integer.parseInt(quantity);
    if(qty >= Integer.parseInt(rs4.getString(5))) {
        response.sendRedirect("./no_quantity.jsp");
    }
    else
    {
        String new_address = request.getParameter("address");
        String del_name = request.getParameter("del_name");
        String del_phone = request.getParameter("del_phone");
        String del_pincode = request.getParameter("del_pincode");
        String del_email = request.getParameter("del_email");
        Statement stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'");
        Statement stmt1 = con.createStatement(); 
        ResultSet rs1=stmt1.executeQuery("select * from item where product_id='" + pid + "'");
        Statement stmt2=con.createStatement();
        String sql = "update item set quantity=quantity-"+qty+" where product_id='" + pid + "'";
        int i=stmt2.executeUpdate(sql);
        rs.next();
        rs1.next();
        String pname = rs1.getString(2);
        String order_id = get_order_id(pid, email);
        String buy_date = java.time.LocalDate.now().toString();
        String buy_time = java.time.LocalTime.now().toString();
        Statement stmt3=con.createStatement();
        String sql1 = "insert into orders values ('" + order_id + "', '" + buy_date + "', '" + email + "', '" + pid + "', " + quantity + ", " + payable + ", '" + del_name + "', '" + del_phone + "', '" + new_address + "', '" + del_pincode + "', '" + pname + "', '" + payment_option + "', '" + buy_time + "', '" + del_email + "', " + final_price + ")";
        int i1=stmt3.executeUpdate(sql1);
        response.sendRedirect("./bill.jsp?order_id="+order_id);
    }
%>