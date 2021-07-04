<%@ include file="../dbconnect.jsp"%>
<%@ include file="./admin_navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../css/process_update_item.css">
    <title>Update Item</title>
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
    <div class="container box">
        <h1>Update Product</h1>
        <%
            Statement stmt=con.createStatement();
            String pid = request.getParameter("ID");
            ResultSet rs=stmt.executeQuery("select * from item where product_id='"+pid+ "'");
            if(rs.next())
            { %>
        <form class=" col-2" onsubmit="return validate()" action="process_update_item_final.jsp" method="post">
            <div class="product-id">Product ID : <span><%= rs.getString("product_id") %></span></div>
            <input type="Hidden" name="ID" value="<%= rs.getString(1) %>">

            <div class="input-box">
                <label for="pname">Product Name</label>
                <input type="text" name="pname" id="pname" value="<%= rs.getString(2) %>">
            </div>
            <div class="input-box">
                <label for="price">Price</label>
                <input type="text" name="price" id="price" value="<%= rs.getString(3) %>">
            </div>

            <div class="input-box">
                <label for="quantity">Quantity</label>
                <input type="text" name="quantity" id="quantity" value="<%= rs.getString(5) %>">
            </div>
            <div class="input-box">
                <label for="discount">Discount</label>
                <input type="text" name="discount" id="discount" value="<%= rs.getString(6) %>">
            </div>
            <div class="input-box">
                <label for="company">Company</label>
                <input type="text" name="company" id="company" value="<%= rs.getString(7) %>">
            </div>
            <div class="input-box">
                <label  for="category">Category</label>
                
                <select name="category" id="category">
                    <option option selected="selected"><%= rs.getString(8) %></option>
                    <option value="Electronics">Electronics</option>
                    <option value="Appliances">Appliances</option>
                    <option value="Men">Men</option>
                    <option value="Women">Women</option>
                    <option value="Sports">Sports</option>
                    <option value="Books">Books</option>
                </select>
            </div>
            <div class="input-box text-area">
                <label for="desc">Description</label>
                <textarea name="description" id="description" cols="30" rows="5"><%= rs.getString(4) %></textarea>
            </div>
            <a href="./update_item.jsp" class="btn">Cancel</a>
            <input class="btn add-btn" type="submit" value="Update Product">

        </form>
        <% } %>
    </div>
</body>

</html>