<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 4/12/2015
  Time: 10:38 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Crop Alert</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container">
    <div id="keywordSearch">
        <g:form controller="tips" action="searchTips">
            <lable for="keySearch">Key Search</lable>
            <input type="text" name="keySearch" id="keySearch">
            <select name="wSearch">
                <option>Crop Name</option>
                <option>Disease</option>
            </select>
            <input type="submit" value="search"/>
        </g:form>
    </div>
<table class="table table-responsive table-bordered table-striped table-hover">
    <thead style="font-weight: bold;">
    <th>Crop Name</th>
    <th>Disease</th>
    <th>Symptoms</th>
    <th>Cause</th>
    <th>Control</th>
    <th>Pesticide</th>
    </thead>
    <tbody>
    <g:each in="${tipsList}" var="tips">
        <tr>
            <td>${tips.cropName}</td>
            <td>${tips.disease}</td>
            <td>${tips.symptoms}</td>
            <td>${tips.cause}</td>
            <td>${tips.control}</td>
            <td>${tips.pesticide}</td>
        </tr>
    </g:each>
    </tbody>
    <div class="pagination-tips">
        <g:paginate next="Next" prev="Back" controller="tips" action="searchTips" total="${totalTips}" params="${params}"/>
    </div>
</table>
</div>
</body>
</html>