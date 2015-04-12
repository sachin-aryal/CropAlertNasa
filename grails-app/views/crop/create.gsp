<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

</head>

<body>

<div id="create-crop" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form method="post" url="[resource: cropInstance, action: 'save']" enctype="multipart/form-data">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
