<%-- 
    Document   : Manage
    Created on : Jun 11, 2024, 5:27:14 AM
    Author     : daihi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Manage Page</title>
    </head>
    <body>
        <h2>Admin Management</h2>
        <h3>Add New User</h3>
        <form name="userForm" action="addUser" method="post" onsubmit="return validateUserForm()">
            Username: <input type="text" name="username"/><br/>
            Password: <input type="password" name="password"/><br/>
            Role: 
            <select name="role">
                <option value="Admin">Admin</option>
                <option value="Staff">Staff</option>
                <option value="Member">Member</option>
            </select><br/>
            <input type="submit" value="Add User"/>
        </form>

        <%-- Kiểm tra xem có thông báo thành công hay không --%>
        <% String message = request.getParameter("message");
    if (message != null && !message.isEmpty()) { %>
        <p style="color:green;"><%= message %></p>
        <% } %>

        <%-- Kiểm tra xem có thông báo lỗi hay không --%>
        <% String error = request.getParameter("error");
    if (error != null && !error.isEmpty()) { %>
        <p style="color:red;"><%= error %></p>
        <% } %>

        <script>
            function validateUserForm() {
                var username = document.forms["userForm"]["username"].value;
                var password = document.forms["userForm"]["password"].value;
                var role = document.forms["userForm"]["role"].value;

                if (username == "" || password == "" || role == "") {
                    alert("Vui lòng điền đầy đủ thông tin");
                    return false;
                }
            }
        </script>
    </body>
</html>



