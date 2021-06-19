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
            background-color: #fff;
            font-family: 'Poppins', sans-serif;
        }

        .container {

            background-color: #2874f0;
            color: white;
            padding: 40px;
            width: 35%;
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

        .container input[type="email"],
        .container input[type="password"] {
            display: block;
            width: 55%;

            margin-top: 10px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            padding: 10px;
            border: 2px solid #fff;
            border-radius: 30px;
            text-align: center;
            outline: none;
            padding: 14px 10px;
            color: black;
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

        .container input[type="email"]:focus,
        .container input[type="password"]:focus {
            border: 2px solid #2ecc71;
            width: 90%;
        }

        .container input[type="submit"]:hover {
            background-color: #ff9f00;
            color: white;
        }
        .link a {
            text-decoration: none;
            color: #ff6600;
            padding: 0;
            font-weight: bold;
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
            <div class="link">Don't Have An Account? <a href="./register.jsp">Sign Up</a></div>
        </form>
    </div>
</body>

</html>