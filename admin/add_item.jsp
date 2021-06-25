<%@ include file="admin_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../css/add_item.css">
    <title>New Product</title>
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
    <div class="container box">
        <h1>Add New Product</h1>
        <form class=" col-2" onsubmit="return validate()" action="process_add_item.jsp" method="post">
            <div class="input-box">
                <label for="pid">Product Id</label>
                <input type="text" name="pid" id="pid">
            </div>
            <div class="input-box">
                <label for="pname">Product Name</label>
                <input type="text" name="pname" id="pname">
            </div>
            <div class="input-box">
                <label for="price">Price</label>
                <input type="number" name="price" id="price">
            </div>

            <div class="input-box">
                <label for="quantity">Quantity</label>
                <input type="number" name="quantity" id="quantity">
            </div>
            <div class="input-box">
                <label for="discount">Discount</label>
                <input type="number" name="discount" id="discount">
            </div>
            <div class="input-box">
                <label for="company">Company</label>
                <input type="text" name="company" id="company">
            </div>
            <div class="input-box">
                <label for="category">Category</label>
                <select name="category" id="category">
                    <option value="Electronics">Electronics</option>
                    <option value="Appliances">Appliances</option>
                    <option value="Men">Men</option>
                    <option value="Women">Women</option>
                    <option value="Sports">Sports</option>
                    <option value="Books">Books</option>
                </select>
            </div>
            <div class="input-box text-area">
                <label for="description">Description</label>
                <textarea name="description" id="description" cols="30" rows="5"></textarea>
            </div>
            <input class="add-btn" type="submit" value="Add Product">

        </form>

    </div>
</body>

</html>