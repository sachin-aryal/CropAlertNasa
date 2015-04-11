<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 4/11/2015
  Time: 1:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h1>${ActionName}</h1>
<g:if test="${ActionName.equals("map")}">
    <div id="map">
        This is Map
    </div>
</g:if>
<g:elseif test="${ActionName.equals("graph")}">
    <div id="Chart">
        This is chart
    </div>
</g:elseif>
<g:else>
    <div id="tableData">

    </div>
</g:else>
</body>
</html>