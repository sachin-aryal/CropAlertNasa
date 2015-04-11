<%@ page import="nasacropalert.Crop" %>

<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'cropName', 'error')} ">
    <label for="cropName">
        <g:message code="crop.cropName.label" default="Crop Name"/>

    </label>
    <g:textField name="cropName" value="${cropInstance?.cropName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'disease', 'error')} ">
    <label for="disease">
        <g:message code="crop.disease.label" default="Disease"/>

    </label>
    <g:textField name="disease" value="${cropInstance?.disease}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'affected', 'error')} ">
<label for="affected">
    <g:message code="crop.affected.label" default="Affected"/>

</label>
<g:textField name="affected" value="${cropInstance?.affected}"/>
</div

<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'pesticide', 'error')} ">
    <label for="pesticide">
        <g:message code="crop.location.label" default="Pesticide"/>

    </label>
    <g:textField name="pesticide" value="${cropInstance?.pesticide}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'improve', 'error')} ">
    <label for="improve">
        <g:message code="crop.improve.label" default="Improve"/>

    </label>
    <g:textField name="improve" value="${cropInstance?.improve}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'location', 'error')} ">
    <label for="location">
        <g:message code="crop.location.label" default="Location"/>

    </label>
    <g:textField name="location" value="${cropInstance?.location}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'startDate', 'error')} required">
    <label for="startDate">
        <g:message code="crop.startDate.label" default="Start Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="startDate" precision="day" value="${cropInstance?.startDate}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'image', 'error')} required">
    <label for="image">
        <g:message code="crop.image.label" default="Image"/>
        <span class="required-indicator">*</span>
    </label>
    <input type="file" id="image" name="image"/>
</div>




<div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="crop.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${cropInstance?.description}"/>

</div>

<g:if test="${session.getAttribute("userId")}" >
    <div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'user', 'error')} required">
        <label for="user">
            <g:message code="crop.user.label" default="User"/>
            <span class="required-indicator">*</span>
        </label>
        <g:hiddenField name="user.id" required="true" value="${session.getAttribute("userId")}"/>
    </div>
</g:if>
<g:else>
    <div class="fieldcontain ${hasErrors(bean: cropInstance, field: 'user', 'error')} required">
        <label for="user">
            <g:message code="crop.user.label" default="User"/>
            <span class="required-indicator">*</span>
        </label>
        <g:hiddenField name="user.id" required="true" value="1"/>
    </div>
</g:else>
