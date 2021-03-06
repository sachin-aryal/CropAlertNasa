<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Crop Alert"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/ico" href="images/favicon.ico">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}" type="text/css">
	<g:layoutHead/>

	<g:javascript src="bootstrap.min.js"/>
	<g:javascript src="jquery-1.11.1.js"/>
	<g:javascript src="jscharts.js"/>
	<g:javascript>
		//navigation active state controller
		var url = window.location;
		// Will only work if string in href matches with location
		$('ul.nav a[href="' + url + '"]').parent().addClass('active');
		// Will also work for relative and absolute hrefs
		$('ul.nav > li').removeClass('active');
		$('ul.nav a').filter(function() {
			return this.href == url;
		}).parent().addClass('active');
	</g:javascript>
	<r:layoutResources />
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top wet-asphalt">
	<div>
		<g:if test="${session.getAttribute("Role")}">
			<g:if test="${session.getAttribute("Role").equals("admin")}">
				<g:link controller="user" action="adminDashboard" class="navbar-brand"><img src="${resource(dir: 'images', file: 'Crop_Alert.gif')}" height="36px"/></g:link>
			</g:if>
			<g:elseif test="${session.getAttribute("Role").equals("user")}">
				<g:link controller="user" action="userDashboard" class="navbar-brand"><img src="${resource(dir: 'images', file: 'Crop_Alert.gif')}" height="36px"/></g:link>
			</g:elseif>
		</g:if>

		<g:else>
			<g:link controller="user" action="index" class="navbar-brand"><img src="${resource(dir: 'images', file: 'Crop_Alert.gif')}" height="36px"/></g:link>
		</g:else>
	<!-- hamburger button for responsive-->
		<button class="navbar-toggle" data-toggle="collapse" data-target = ".navHeaderCollapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<!-- navigation menu -->
		<div class="collapse navbar-collapse navHeaderCollapse">
			<ul class="nav navbar-nav navbar-left">
				<li class="active"><button class="btn btn-primary" role="presentation"><a> English</a></button></li>
				<li class="active"><button class="btn btn-primary"> Nepali</button></li>

			</ul>
			<div class="login-btn" id="login">
				<g:if test="${session.getAttribute("userName")}">
				<li class="pull-right" style="list-style: none;"><button class="btn btn-success" data-toggle="modal" data-target="#myModal"> <g:link controller="user" action="logout"> <span class="glyphicon glyphicon-log-in"></span> Logout</g:link></button></li>
					<small style="color: #ffffff; margin-right: 10px;" class="pull-right">${session.getAttribute("userName")}</small>
				</g:if>
				<g:else>
					<li class="pull-right" style="list-style: none; "><g:link controller="user" action="login" class="btn btn-success" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</g:link></li>
					<li class="pull-right" style="list-style: none;margin-right: 10px;"><g:link controller="user" action="signUp" class="btn btn-success"><span class="glyphicon glyphicon-upload"></span> Register</g:link></li>
				</g:else>
			</div>
		</div> <!--navigation end -->
	</div>
</div>

<div class="container">
	<ul class="nav nav-tabs">
		%{--<li class="active"><g:link controller="crop" action="getData" params="[Action:'map']" data-toggle="tab"><i class="fa fa-globe fa-2x"></i> Maps</g:link></li>--}%
		<li><g:link controller="crop" action="getData" params="[Action:'table']" data-toggle="tab"><i class="fa fa-table fa-2x"></i> Table</g:link></li>
		<li><g:link controller="crop" action="getData" params="[Action:'graph']" data-toggle="tab"><i class="fa fa-bar-chart fa-2x"></i> Graphs</g:link></li>
		<li><g:link controller="crop" action="create" data-toggle="tab"><i class="fa fa-info-circle fa-2x"></i> Add Report</g:link></li>
		<li><g:link controller="tips" action="getTips" data-toggle="tab"><i class="fa fa-user fa-2x"></i> Expert Tips</g:link></li>
	</ul>
</div>

</body>
</html>
<g:layoutBody/>
<r:layoutResources />
</body>
</html>
