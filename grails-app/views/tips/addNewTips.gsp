<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 4/12/2015
  Time: 9:51 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Crop Alert</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container">
    <h1 style="font-weight: bold;">Add Tip</h1>
    <div class="row">
        <div class="col-lg-4 container">
            <g:form controller="tips" action="saveTips">
                <div class="form-group">
                    <label for="Crop Name">Crop Name</label>
                    <input type="text" class="form-control" id="Crop Name" name="cropName" placeholder="Crop Name" required="">
                </div>
                <div class="form-group">
                    <label for="Disease">Disease</label>
                    <input type="text" class="form-control" id="Disease" name="disease" placeholder="Disease" required="">
                </div>
                <div class="form-group">
                    <label for="Symptoms">Symptoms</label>
                    <input type="text" class="form-control" id="Symptoms" name="symptoms" placeholder="Symptoms" required="">
                </div>
                <div class="form-group">
                    <label for="Cause">Cause</label>
                    <input type="text" class="form-control" id="Cause" name="cause" placeholder="Cause" required="">
                </div>
                <div class="form-group">
                    <label for="Control">Cause</label>
                    <input type="text" class="form-control" id="Control" name="control" placeholder="Control" required="">
                </div>
                <div class="form-group">
                    <label for="Pesticide">Pesticide</label>
                    <input type="text" class="form-control" id="Pesticide" name="pesticide" placeholder="Pesticide" required="">
                </div>
                <input type="submit" value="Add"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>