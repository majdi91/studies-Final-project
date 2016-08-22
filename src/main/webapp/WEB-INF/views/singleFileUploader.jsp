<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Simple Tables</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <script src="static/js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <link href="static/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
	<link href="static/css/screen.css" type="text/css" media="screen, projection" rel="stylesheet" />
	<link href="static/css/AdminLTE.css" type="text/css" media="screen, projection" rel="stylesheet" />
	
	<link rel="stylesheet" href="static/plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="static/plugins/iCheck/all.css">
     <link rel="stylesheet" href="static/plugins/iCheck/flat/blue.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="static/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="static/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="static/plugins/select2/select2.min.css">
	<link href="static/js/bower_components/sweetalert/dist/sweetalert.css" type="text/css" media="screen, projection" rel="stylesheet" />
	<link href="static/css/sweetalert.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
    
    <link rel="stylesheet" href="static/dist/css/skins/_all-skins.min.css">
	<style type="text/css"> 
	.styled-button-3 {
	-webkit-box-shadow:rgba(0,0,0,0.0.1) 0 1px 0 0;
	-moz-box-shadow:rgba(0,0,0,0.0.1) 0 1px 0 0;
	box-shadow:rgba(0,0,0,0.0.1) 0 1px 0 0;
	background-color:#5B74A8;
	border:1px solid #29447E;
	font-family:'Lucida Grande',Tahoma,Verdana,Arial,sans-serif;
	font-size:12px;
	font-weight:700;
	padding:2px 6px;
	color:#fff;
	border-radius:5px;
	-moz-border-radius:5px;
	-webkit-border-radius:5px
}
 </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
		function check(){
	var u="${user}";
	if (u == "anonymousUser" ) 
		window.open("http://localhost:8081/SpringSecurityRoleBasedLoginExample/login",'_self',false)
}

</script>

<script>
function getUser()
{
	var u="${user}";
	return u;
	}
</script>
  </head>
  <body class="hold-transition skin-blue sidebar-mini" ng-app="myApp">
    <div class="wrapper">

      <header class="main-header">
   </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          
          <!-- search form -->
         
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu"  ng-controller="UserController">
            <li class="header">MAIN NAVIGATION</li>
            
            <li class="treeview" ng-show="{{isUserLoggedIn}}">
              <a href="#/view">
                <i class="fa fa-group"></i>
                <span>Population</span>
               <i class="fa fa-angle-left pull-right"></i>
              </a>
            
            </li>
            <li>
              <a href="#/all_projects" ng-show="{{isUserLoggedIn}}">
                <i class="fa fa-gears"></i> <span>Projects</span> 
             	 <i class="fa fa-angle-left pull-right"></i>
              </a>
             
            </li>
            <li class="treeview" ng-show="{{isUserLoggedIn}}">
              <a href="#/pay">
                <i class="fa fa-pie-chart"></i>
                <span>Payment</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              
            </li>
            <li class="treeview" ng-show="{{isUserLoggedIn}}">
              <a href="<c:url value='/chat' />">
                <i class="icon-comment"></i>
                <span>Forum</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <li class="treeview" ng-show="{{isUserLoggedIn}}">
              <a href="#/send">
                <i class="fa fa-envelope"></i> <span>MailBox</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
             
            </li>
           
            <li class="treeview">
              <a href="#/">
                <i class="icon-home"></i> <span>Home</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
             
            </li>
           
            <li class="treeview">
              <a href="#/add">
                <i class="fa fa-plus"></i> <span>Place an Ad</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
             
            </li>
            </ul>
            
          
           
        </section>
        <!-- /.sidebar -->
      </aside>

<!-- start content -->
<div class="content-wrapper">
<section class="container">

	<div class="row">
		
		<form:form method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">
		
			<div class="col-md-6">
				<div class="box box-primary">
				<div class="box-body">
					<label class="col-md-3 control-lable" for="file">Upload a file</label>
					<div class="form-group">
						<form:input type="file" path="file" id="file"/>
						<div class="has-error">
							<form:errors path="file" class="help-inline"/>
						</div>
					</div>
					</div>
					<div class="box-footer">
					<input type="submit" value="Upload" class="btn btn-primary">
				</div>
				</div>
			</div>
	
			
				
			
		</form:form>
		
	</div>
	
<!-- start footer -->         

</section>
</div>

<footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.3.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
</div>

<!-- end footer -->
 <script src="//code.angularjs.org/1.2.20/angular.js"></script>
    <script src="//code.angularjs.org/1.2.20/angular-route.js"></script>
    <script src="//code.angularjs.org/1.2.13/angular-cookies.js"></script>
    <script src="static/js/app.js"></script>
    <script src="static/js/edit_controller.js"></script>
    <script src="static/js/user_controller.js"></script>
     <script src="static/js/ann_controlleur.js"></script>
     <script src="static/js/user_service.js"></script>
</body>
</html>
