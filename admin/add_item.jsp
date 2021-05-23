<%@ include file="admin_navbar.jsp" %>
<html>
    <head>
        <title>new_registration</title>
        <script type="text/javascript">
            function validate()
            {
                var pid = document.getElementById("pid");
                var pname = document.getElementById("pname");
                var price = document.getElementById("price");
                var description = document.getElementById("description");
                var quantity = document.getElementById("quantity");
                var discount = document.getElementById("discount");
                var company = document.getElementById("company");
                var category = document.getElementById("categoty");
                if(pid.value.trim()=="")
                {
                    alert("Product ID cann't be empty");
                    pid.style.border = "solid 3px red";
                    return false;
                }
                else if(pname.value.trim()=="")
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
        
        <div >
            <form  onsubmit="return validate()" action="process_add_item.jsp" method="post" enctype="multipart/form-data">
                <div>
                <center><h4>Add Item</h4></center>
                    <table  cellspacing="10">
                        <tr>
                            <td>Product ID </td>
                            <td><input id="pid" type="text" name="pid"></td>
                        </tr>
                        <tr>
                            <td>Product Name: </td>
                            <td><input id="pname" type="text" name="pname"></td>
                        </tr>
                        <tr>
                            <td>Price </td>
                            <td><input id="price" type="text" name="price"></td>
                        </tr>
                        <tr>
                            <td>Description </td>
                            <td><input id="description" type="text" name="description"></td>
                        </tr>
                        <tr>
                            <td>Quantity </td>
                            <td><input id="quantity" type="text" name="quantity"></td>
                        </tr>
                        <tr>
                            <td>Discount </td>
                            <td><input id="discount" type="text" name="discount"></td>
                        </tr>
                        <tr>
                            <td>Company </td>
                            <td><input id="company" type="text" name="company"></td>
                        </tr>
                        <tr>
                            <td>Category </td>
                            <td><select id="category" name="category">
                                <option value="Electronics">Electronics</option>
                                <option value="Appliances">Appliances</option>
                                <option value="Men">Men</option>
                                <option value="Women">Women</option>
                                <option value="Sports">Sports</option>
                                <option value="Books">Books</option>
                              </select></td>
                        </tr>
                        <tr>
                            <td>Add Product Image</td> 
                            <td><input type="file" name="uploadfile" size="50"></td>
                        </tr>
                        <tr>
                            <td></td><td colspan="2"><input  type="Submit" value="Add Product"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div> 
    </body>
</html>