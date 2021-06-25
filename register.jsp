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
        <style>
            
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            background-color: #fff;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            background-color: #2874f0;
            color: white;
            padding: 20px 40px;
            width: 600px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 1px 2px 10px -3px rgb(0 0 0 / 56%);
        }
        .container h1 {
            text-transform: uppercase;
            margin-top: 0px;
            margin-bottom: 25px;
            font-size: 38px;
            letter-spacing: 2.5px;
        }
        .container form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 10px;
            row-gap: 5px;
        }
        .container input,
        .container textarea {
            display: block;
            width: 100%;
            
            margin-bottom: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            padding: 10px;
            border: 2px solid #fff;
            border-radius: 30px;
            text-align: center;
            outline: none;
            
            color: black;
            font-size: 20px;
            transition: .3s;
        }
        .container textarea {
            grid-column: span 2;
            text-align: left;
        }
        .container input[type="submit"] {
            display: block;
            width: 35%;
            text-transform: uppercase;
            grid-column: span 2;
            margin-top: 10px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fb641b;
            padding: 10px;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            text-align: center;
            outline: none;
            padding: 14px 10px;
            border: none;
            font-size: 15px;
            transition: .3s;
            cursor: pointer;
        }
        .container input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .container input:focus {
            border: 2px solid #2ecc71;

        }
        .container input[type="submit"]:hover {
            background-color: #ff9f00;
            color: white;
        }
        .container .link {
            grid-column: span 2;
        }
        .container a {
            text-decoration: none;
            color: #ff6600;
            padding: 0;
            font-weight: bold;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Register</h1>
            <form onsubmit="return validate()" action="process_register.jsp" method="post">
                <input type="text" name="name" id="name" placeholder="Name">
                <input type="email" name="email" id="email" autocomplete="off" placeholder="Email">
                <input type="number" name="phone" id="phone" placeholder="Phone Number">
                <input type="password" name="pass" id="pass" placeholder="Password">
                <input type="password" name="cpass" id="cpass" placeholder="Conform Password">
                <input type="number" name="pincode" id="pincode" placeholder="Enter Pincode">
                <textarea name="address" id="address" cols="30" rows="4" placeholder="Address"></textarea>
                <input type="submit" value="Register">
                <div class="link">Already Have An Account? <a href="login.jsp">Log In</a></div>
            </form>
        </div>
    
        
    </body>
</html>