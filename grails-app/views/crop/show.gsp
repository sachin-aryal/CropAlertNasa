<%@ page import="nasacropalert.Crop" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Crop Alert</title>
</head>

<body>
<g:fieldValue field="id" bean="${cropInstance}"/>
<img src = "${createLink(controller:'crop', action: 'imageShow', id:"${cropInstance?.id}")}" width="300"/>
<div id="show-file" class="content scaffold-show" role="main">
    <g:if test="${cropInstance?.image}">
        <li class="fieldcontain">
            <span id="image-label" class="property-label"><g:message code="crop.image.label"
                                                                     default="Image"/></span>
        </li>
    </g:if>

    <g:if test="${cropInstance?.cropName}">
        <li class="fieldcontain">
            <span id="cropName-label" class="property-label"><g:message code="crop.cropName.label"
                                                                        default="Crop Name"/></span>

            <span class="property-value" aria-labelledby="cropName-label"><g:fieldValue bean="${cropInstance}"
                                                                                        field="cropName"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.affected}">
        <li class="fieldcontain">
            <span id="affected-label" class="property-label"><g:message code="crop.affected.label"
                                                                        default="Affected"/></span>

            <span class="property-value" aria-labelledby="affected-label"><g:fieldValue bean="${cropInstance}"
                                                                                        field="affected"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.description}">
        <li class="fieldcontain">
            <span id="description-label" class="property-label"><g:message code="crop.description.label"
                                                                           default="Description"/></span>

            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${cropInstance}"
                                                                                           field="description"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.disease}">
        <li class="fieldcontain">
            <span id="disease-label" class="property-label"><g:message code="crop.disease.label"
                                                                       default="Disease"/></span>

            <span class="property-value" aria-labelledby="disease-label"><g:fieldValue bean="${cropInstance}"
                                                                                       field="disease"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.improve}">
        <li class="fieldcontain">
            <span id="improve-label" class="property-label"><g:message code="crop.improve.label"
                                                                       default="Improve"/></span>

            <span class="property-value" aria-labelledby="improve-label"><g:fieldValue bean="${cropInstance}"
                                                                                       field="improve"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.location}">
        <li class="fieldcontain">
            <span id="location-label" class="property-label"><g:message code="crop.location.label"
                                                                        default="Location"/></span>

            <span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${cropInstance}"
                                                                                        field="location"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.pesticide}">
        <li class="fieldcontain">
            <span id="pesticide-label" class="property-label"><g:message code="crop.pesticide.label"
                                                                         default="Pesticide"/></span>

            <span class="property-value" aria-labelledby="pesticide-label"><g:fieldValue bean="${cropInstance}"
                                                                                         field="pesticide"/></span>

        </li>
    </g:if>

    <g:if test="${cropInstance?.startDate}">
        <li class="fieldcontain">
            <span id="startDate-label" class="property-label"><g:message code="crop.startDate.label"
                                                                         default="Start Date"/></span>

            <span class="property-value" aria-labelledby="startDate-label"><g:formatDate
                    date="${cropInstance?.startDate}"/></span>

        </li>
    </g:if>

%{--<g:if test="${cropInstance?.user}">
    <li class="fieldcontain">
        <span id="user-label" class="property-label"><g:message code="crop.user.label" default="User"/></span>

        <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
                                                                          id="${cropInstance?.user?.id}">${cropInstance?.user?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>--}%
    <g:if test="${userTrue||session.getAttribute("Role").equals("admin")}">
        <g:link class="edit" action="edit" resource="${cropInstance}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
        <g:form url="[resource: cropInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"></g:actionSubmit>
            </fieldset>
        </g:form>
    </g:if>
    <g:else>

    </g:else>
    <g:form controller="comments" action="save">
        <g:if test="${session.getAttribute("Role")}">
            <g:if test="${session.getAttribute("Role").equals("admin")}">
                <g:hiddenField name="commentator" value="admin"/>
            </g:if>
            <g:else>
                <g:hiddenField name="commentator" value="${session.getAttribute("userName")}"/>
            </g:else>
        </g:if>
        <g:else>
            <g:hiddenField name="commentator" value="Anonymous"/>
        </g:else>
        <g:hiddenField name="cropId" value="${cropInstance.id}"/>
        <g:textField name="comment"/>
        <g:submitButton name="Comment">Comment</g:submitButton>
    </g:form>
</div>
</body>
</html>
