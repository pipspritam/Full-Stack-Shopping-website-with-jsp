<html>
<head>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            padding: 0;
            margin: 0;
            background-color: #ffffff;
            color: black;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            font-family: 'Poppins', sans-serif;
            padding: 10px 5%;
            color: white;
            background-color: #181c20;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .navbar h1 a{
            text-decoration: none;
            color: white;
            transition: 300ms;
        }
        .navbar h1 a:hover{
            
            color: #2ecc71;
        }


        .navbar h1{
            margin-right: auto;
        }

        .navbar ul {
            list-style: none;
          
        }

        .navbar ul li {
            display: inline-block;
            text-decoration: none;
            padding: 0 20px;
            font-size: 18px;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
        }

        .navbar button {
            background: none;
            padding: 10px 20px;
            margin-left: 30px;
          
            color: white;
            border: 2px solid #2ecc71;
            border-radius: 20px;
            transition: .3s;
            font-weight: bold;
        }

        .navbar button a {
            text-decoration: none;
            color: white;
        }

        .navbar button:hover {
            background-color: #2ecc71;
           
        }
    </style>
</head>

<body>
    <nav class="navbar">
        <h1><a href="./admin_index.jsp">LOGO</a></h1>
        <ul>
            <%
            if(((String)session.getAttribute("admin_email"))==null){

                %>
                <li><a href="./admin_login.jsp">Add Item</a></li>
                <li><a href="./admin_login.jsp">Update Item</a></li>
                <li><a href="./admin_login.jsp">Delete Item</a></li>
                <a href="./admin_login.jsp"><button>Log in</button></a>
                <%

            }
            else {
                %>

                <li><a href="./add_item.jsp">Add Item</a></li>
                <li><a href="./update_item.jsp">Update Item</a></li>
                <li><a href="./delete_item.jsp">Delete Item</a></li>
                <a href="./admin_logout.jsp"><button>Log out</button></a>
                <%
            }

            %>
        </ul>
    </nav>
</body>

</html>