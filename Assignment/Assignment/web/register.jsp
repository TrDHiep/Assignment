<%-- 
    Document   : register
    Created on : Jun 10, 2024, 3:57:26 PM
    Author     : daihi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Register Page</title>
    </head>
    <body>
        <h2>Register</h2>
        <form name="registerForm" action="register" method="post" onsubmit="return validateRegisterForm()">
            Username: <input type="text" name="username"/><br/>
            Password: <input type="password" name="password"/><br/>
            Confirm Password: <input type="password" name="confirmPassword"/><br/>
            <input type="hidden" name="role" value="Member"/> <%-- Set default value to "Member" --%> <br/> 
            <input type="submit" value="Sign Up"/>
        </form>
        <a href="login.jsp">Login</a>

        <script>
            function validateRegisterForm() {
                var username = document.forms["registerForm"]["username"].value;
                var password = document.forms["registerForm"]["password"].value;
                var confirmPassword = document.forms["registerForm"]["confirmPassword"].value;

                if (username.trim() === "" || password.trim() === "" || confirmPassword.trim() === "") {
                    alert("Please fill in all the fields");
                    return false;
                }
                if (password !== confirmPassword) {
                    alert("Password and confirm password do not match");
                    return false;
                }
            }
        </script>
    </body>
</html>





