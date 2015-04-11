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
    <meta name="layout" content="main">
    <title>Register</title>
    <script>
        window.onload= function(){
            var x = document.getElementById('navTabs');
            x.style.display='none';
        };

        var y = document.getElementById('reg');
        y.onclick= function () {
            alert('Thank you for your registration. Please wait for approval.');
        }

    </script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center;">Fill up the form to register</h1>
    <div class="registrationForm">
            <g:form controller="user" action="register" method="post" >

                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="FullName" name="name" placeholder="Full Name" required="">
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="text" class="form-control" id="Email" name="email" placeholder="Enter Email" required="">
                </div>
                <div class="form-group">
                    <label for="city">Country</label>
                    <input type="text" class="form-control" id="city" name="country" placeholder="Enter Country Name" required="">
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Phone No.">
                </div>
                <div class="form-group">
                    <label for="userName">Username</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="">
                </div>
                <input type="submit" value="Register"/>
                %{--<button id="reg" type="submit"  class="btn btn-default">Submit</button>--}%
            </g:form>
    </div>
</div>
</body>
</html>
