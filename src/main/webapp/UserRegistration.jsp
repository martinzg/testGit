<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Registration page</title>
</head>
<body>

    <h1>New user registration:</h1>
    <form method="post">
        First name:<br>
        <input type="text" name="firstname" required>
        <br>
        Last name:<br>
        <input type="text" name="lastname" required>
        <br>
        Email:<br>
        <input type="email" name="email" required>
        <br>
        Password:<br>
        <input type="password" name="password" required>
        <br>
        Confirm Password:<br>
        <input type="password" name="confirm password" required>
        <br><br>
        <input type="submit" name="submit">
    </form>
    <c:set var="message" scope="session" value='<%= request.getParameter("param") %>'/>
    <c:if test="${message != null}">
        <h4 style="color:red"><c:out value="${message}" /></h4>
    </c:if>

</body>
</html>