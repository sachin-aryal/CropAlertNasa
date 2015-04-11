<%--
  Created by IntelliJ IDEA.
  User: sumitshrestha
  Date: 4/11/15
  Time: 2:57 PM
  test
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body>
<p> Delete THis </p>
<g:form action="register" method="post" >
    Name: <input type="text" name="name" value="name">
    Email Address: <input type="text" name="email" value="email">
    Country: <input type="text" name="country" value="country">
    Phone: <input type ="number" name="phone" value="phone">
    Username: <input type="text" name="userName" value="userName">
    Password: <input type="password" name="password" value="password">
    <input type="submit" value="Register" />
</g:form>
</div>
</body>
</html>
