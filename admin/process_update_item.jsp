<html>
    <head>
        <title>Update Item</title>
        <%@ page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ include file="../dbconnect.jsp"%>
        <%@ include file="./admin_navbar.jsp"%>

        <script type="text/javascript">
            function validate()
            {
                var pname = document.getElementById("pname");
                var price = document.getElementById("price");
                var description = document.getElementById("description");
                var quantity = document.getElementById("quantity");
                var discount = document.getElementById("discount");
                var company = document.getElementById("company");
                var category = document.getElementById("categoty");
                
                if(pname.value.trim()=="")
                {
                    alert("Product name cann't be empty");
                    pname.style.border = "solid 3px red";
                    return false;
                }
                else if(price.value.trim()=="")
                {
                    alert("Price cann't be empty");
                    price.style.border = "solid 3px red";
                    return false;
                }
                else if(description.value.trim()=="")
                {
                    alert("Description cann't be empty");
                    description.style.border = "solid 3px red";
                    return false;
                }
                else if(quantity.value.trim()=="")
                {
                    alert("Quantity cann't be empty");
                    quantity.style.border = "solid 3px red";
                    return false;
                }
                else if(discount.value.trim()=="")
                {
                    alert("Discount cann't be empty");
                    discount.style.border = "solid 3px red";
                    return false;
                }
                else if(company.value.trim()=="")
                {
                    alert("Company name cann't be empty");
                    company.style.border = "solid 3px red";
                    return false;
                }
                else if(category.value.trim()=="")
                {
                    alert("Product category cann't be empty");
                    category.style.border = "solid 3px red";
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
            Statement stmt=con.createStatement();
            String pid = request.getParameter("ID");
            ResultSet rs=stmt.executeQuery("select * from item where product_id='"+pid+ "'");
            if(rs.next())
            { %>
        <form onsubmit="return validate()" action="process_update_item_final.jsp" method="post">
            <center><h4>Update Item <%= rs.getString("product_id") %> </h4></center>
                <table cellspacing="10">
                    <input type="Hidden" name="ID" value="<%= rs.getString(1) %>">
                    <tr>
                        <td>Product Name: </td>
                        <td><input id="pname" type="text" name="pname" value="<%= rs.getString(2) %>"></td>
                    </tr>
                    <tr>
                        <td>MRP: </td>
                        <td><input id="price" type="text" name="price" value="<%= rs.getString(3) %>"></td>
                    </tr>
                    <tr>
                        <td>Description: </td>
                        <td><input id="description"  type="text" name="description" value="<%= rs.getString(4) %>"></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><input id="quantity" type="text" name="quantity" value="<%= rs.getString(5) %>"></td>
                    </tr>
                    <tr>
                        <td>Discount: </td>
                        <td><input id="discount"  type="text" name="discount" value="<%= rs.getString(6) %>"></td>
                    </tr>
                    <tr>
                        <td>Company: </td>
                        <td><input id="company" type="text" name="company" value="<%= rs.getString(7) %>"></td>
                    </tr>
                    <tr>
                        <td>Category: </td>
                        <td><select id="category" name="category" value="<%= rs.getString(8) %>">
                            <option value="Electronics">Electronics</option>
                            <option value="Appliances">Appliances</option>
                            <option value="Men">Men</option>
                            <option value="Women">Women</option>
                            <option value="Sports">Sports</option>
                            <option value="Books">Books</option>
                          </select></td>
                       
                    </tr>
                    <tr>
                        <td></td><td colspan="2"><input type="Submit" value="Update"></td>
                    </tr>
                </table>
            </div>
        </form>
        <% } %>
            </div>
    </body>
</html>