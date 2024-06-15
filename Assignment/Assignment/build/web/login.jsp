<%-- 
    Document   : login
    Created on : Jun 10, 2024, 3:57:14 PM
    Author     : daihi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login Page</title>
    </head>
    <body>
        <h2>Login</h2>
        <form name="loginForm" action="login" method="post" onsubmit="return validateLoginForm()">
            Username: <input type="text" name="username"/><br/>
            Password: <input type="password" name="password"/><br/>
            <input type="submit" value="Sign in"/>
        </form>
        <a href="register.jsp">Sign Up</a>

        <script>
            function validateLoginForm() {
                var username = document.forms["loginForm"]["username"].value;
                var password = document.forms["loginForm"]["password"].value;

                if (username == "" || password == "") {
                    alert("Vui lòng điền đầy đủ thông tin");
                    return false;
                }
            }
        </script>
    </body>
</html>


