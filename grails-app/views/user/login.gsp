<%--
  Created by IntelliJ IDEA.
  User: sumitshrestha
  Date: 4/11/15
  Time: 2:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>
<body>
    <g:form action="loginValidator" method="post" >
   Username <input type="text" name="userName" placeholder="" >
   Password <input type="password" name="password" placeholder="">
        <input type="submit" value="Login" />
        <g:if test="${flash.message}">
            <p><u>${flash.message}</u></p>
        </g:if>
    </g:form>
</div>
</div>
</body>
</html>
