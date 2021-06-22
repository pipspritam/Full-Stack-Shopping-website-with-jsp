<%@ include file="dbconnect.jsp"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./css/account.css">
    <title>Edit Account</title>
    <script type="text/javascript">
        function validate()
        {
            var name = document.getElementById("name");
            
            var phone = document.getElementById("phone");
            var pass = document.getElementById("pass");
            var cpass = document.getElementById("cpass");
            var address = document.getElementById("address");
            var pincode = document.getElementById("pincode");
            if(name.value.trim()=="")
            {
                alert("Name cann't be empty");
                name.style.border = "solid 3px red";
                return false;
            }
            else if(phone.value.trim()=="")
            {
                alert("Phone cann't be empty");
                phone.style.border = "solid 3px red";
                return false;
            }
            else if(pass.value.trim()=="")
            {
                alert("Password cann't be empty");
                pass.style.border = "solid 3px red";
                return false;
            }
            else if(cpass.value.trim()=="")
            {
                alert("Password cann't be empty");
                cpass.style.border = "solid 3px red";
                return false;
            }
            else if(address.value.trim()=="")
            {
                alert("Address cann't be empty");
                address.style.border = "solid 3px red";
                return false;
            }
            else if(pincode.value.trim()=="")
            {
                alert("Pincode cann't be empty");
                pincode.style.border = "solid 3px red";
                return false;
            }
            else if(pass.value!=cpass.value)
            {
                alert("Password and Conform password do not match!!");
                pass.style.border = "solid 3px red";
                cpass.style.border = "solid 3px red";
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
    <div class="container">
        <div class="box">
            <% 
            Statement stmt=con.createStatement();
            String email=(String)session.getAttribute("email");
            ResultSet rs=stmt.executeQuery("select * from users where email='"+email+ "'");
            if(rs.next())
            {
                %>
            <h2>Edit Account Details</h2>
            <form class="details col-2" onsubmit="return validate()" action="update_account.jsp" method="POST">
                <label class="label">Name</label>
                <input id="name" type="text" name="name" value="<%=rs.getString("name")%>">
                <label class="label">Email</label>
                <p><%=rs.getString("email")%></p>
                <label class="label">Phone</label>
                <input id="phone" type="text" name="phone" value="<%=rs.getString("phone")%>">
                <label class="label">Pincode</label>
                <input id="pincode" type="text" name="pincode" value="<%=rs.getString("pincode")%>">
                <label class="label">Address</label>
                <textarea name="address" id="address" cols="30" rows="5"><%=rs.getString("address")%></textarea>

                <label class="label">Password</label>
                <input id="pass" type="password" name="password" value="<%=rs.getString("password")%>">
                <label class="label">Conform Password</label>
                <input id="cpass" type="password" name="conformpassword" value="<%=rs.getString("password")%>">
                <input class="edit-btn" type="Submit" value="Update">
                <button class="edit-btn" formaction="account.jsp">Cancel</button>
            </form>
            <% } %>
        </div>
    </div>




</body>

</html>