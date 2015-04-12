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
    <meta name="layout" content="main">
    <title>Crop ALert | Login</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
</head>
<body>
<div class="container">
    <h1 style="font-weight: bold;">Please Login to continue</h1>
    <div class="row">
        <div class="col-lg-4 container">
            <g:form action="loginValidator" method="post" >
                <div class="form-group">
                    <label for="userName">Username</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="">
                </div>
                <input type="submit" class="btn btn-success" value="Login"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
