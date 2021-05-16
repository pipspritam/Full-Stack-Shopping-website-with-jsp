<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>
        Login Page
    </title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #262b31;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            
            background-color: #181c20;
            color: white;
            padding: 40px;
            width: 25%;
            text-align: center;
           
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 10px 10px 10px black;
        }

        .container h1 {
            text-transform: uppercase;
            margin-top: 0px;
            margin-bottom: 25px;
            font-size: 38px;
            letter-spacing: 2.5px;
        }

        .container input[type="email"],
        .container input[type="password"] {
            display: block;
            width: 55%;
         
            margin-top: 10px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            background: none;
            padding: 10px;
            border: 2px solid #3498db;
            border-radius: 30px;
            text-align: center;
            outline: none;
            padding: 14px 10px;
            color: white;
            font-size: 20px;
            transition: .3s;
        }
        .container input[type="submit"] {
            display: block;
            width: 35%;
            text-transform: uppercase;
         
            margin-top: 10px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            background: none;
            padding: 10px;
            border: 2px solid #2ecc71;
            border-radius: 30px;
            text-align: center;
            outline: none;
            padding: 14px 10px;
            color: white;
            font-size: 15px;
            transition: .3s;
        }

        .container input[type="email"]:focus,
        .container input[type="password"]:focus {
            border: 2px solid #2ecc71;
            width: 90%;
        }

        .container input[type="submit"]:hover {
            background-color: #2ecc71;
            font-weight: bold;
        }
        .container a{
            text-decoration: none;
            color: white;
            padding: 0;
            border-bottom: 2px solid white;
        }

        .container a:hover{
            border-bottom: 2px transparent;
        }
    </style>
    <script type="text/javascript">
        function validate()
        {
            var email = document.getElementById("email");
            var pass = document.getElementById("pass");
            if(email.value.trim()=="")
            {
                alert("Enter a valid email");
                email.style.border = "solid 3px red";
                return false;
            }
            else if(pass.value.trim()=="")
            {
                alert("Password cann't be empty");
                pass.style.border = "solid 3px red";
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
        <h1>Login</h1>
        <form onsubmit="return validate();" action="./process_login.jsp" method="post">
            <input type="email" name="email" id="email" autocomplete="off" placeholder="Email">
            <input type="password" name="pass" id="pass" placeholder="Password">
            <input type="submit" value="Login">
            <a href="./register.jsp">Dont Have an Account</a>
        </form>
    </div>
</body>

</html>