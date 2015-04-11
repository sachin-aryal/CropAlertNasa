<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

	</head>
	<body>
	<div class="navbar navbar-inverse navbar-fixed-top wet-asphalt">
		<div class="container">

			<a href="" class="navbar-brand"><img src="${resource(dir: 'images', file: 'Crop_Alert.gif')}" height="36px"/></a>
			<!-- hamburger button for responsive-->
			<button class="navbar-toggle" data-toggle="collapse" data-target = ".navHeaderCollapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<!-- navigation menu -->
			<div class="collapse navbar-collapse navHeaderCollapse">
				<ul class="nav navbar-nav navbar-left">
					<li class="active"><a href="#" > Home</a></li>
					<li><a href="#"> Blog</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Social Media<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Google</a> </li>
							<li><a href="#">Facebook</a> </li>
						</ul>
					</li>
					<li><a href="#"> About</a></li>
					<li><a href="#"> Contact</a></li>
				</ul>
				<div class="login-btn" id="login">
					<li class="pull-right"><button class="btn btn-success" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</button></li>
					<li class="pull-right"><button class="btn btn-success"><span class="glyphicon glyphicon-upload"></span> Register</button></li>
				</div>
			</div> <!--navigation end -->
		</div>
	</div>


	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><g:link controller="crop" action="getData" params="[Action:'map']" data-toggle="tab"><i class="fa fa-globe fa-2x"></i> Maps</g:link></li>
			<li><g:link controller="crop" action="getData" params="[Action:'graph']" data-toggle="tab"><i class="fa fa-bar-chart fa-2x"></i> Graphs</g:link></li>
			<li><g:link controller="crop" action="getData" params="[Action:'table']" data-toggle="tab"><i class="fa fa-table fa-2x"></i> Table</g:link></li>
		</ul>
	</div>

	</body>
</html>
