<%@ page import="nasacropalert.Crop" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Crop Alert</title>
</head>

<body>
    <g:form controller="user" url="[resource: cropInstance, action: 'update']" enctype="multipart/form-data">
        <g:hiddenField name="id" value="${cropInstance?.id}" />
        <g:hiddenField name="version" value="${cropInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <input type="submit" class="save" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
