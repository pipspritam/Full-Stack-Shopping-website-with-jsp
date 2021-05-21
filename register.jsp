<%@ include file="navbar.jsp" %>
<html>
    <head>
        <title>new_registration</title>
        <script type="text/javascript">
            function validate()
            {
                var name = document.getElementById("name");
                var email = document.getElementById("email");
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
                else if(email.value.trim()=="")
                {
                    alert("Enter a valid email");
                    email.style.border = "solid 3px red";
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
        
        <div >
            <form  onsubmit="return validate()" action="process_register.jsp" method="post">
                <div>
                <center><h4>New User Registration</h4></center>
                    <table  cellspacing="10">
                        <tr>
                            <td>Enter Name: </td>
                            <td><input id="name" type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td>Enter Email: </td>
                            <td><input id="email" type="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>Enter Phone: </td>
                            <td><input id="phone" type="text" name="phone"></td>
                        </tr>
                        <tr>
                            <td>Enter Password: </td>
                            <td><input id="pass" type="password" name="newpassword"></td>
                        </tr>
                        <tr>
                            <td>Conform Password: </td>
                            <td><input id="cpass" type="text" name="conformpassword"></td>
                        </tr>
                        <tr>
                            <td>Enter Address: </td>
                            <td><input id="address"  type="text" name="address"></td>
                        </tr>
                        <tr>
                            <td>Enter Pincode: </td>
                            <td><input id="pincode"  type="text" name="pincode"></td>
                        </tr>
                        <tr>
                            <td></td><td colspan="2"><input  type="Submit" value="Register"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Already have an account? <a href="login.jsp">Login here</a></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div> 
    </body>
</html>