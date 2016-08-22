
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>LT</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Tun</b>Syndic</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation" ng-controller="UserController">
          <!-- Sidebar toggle button-->
          
            <div class="nav pull-right" >
                        <c:url var="loginUrl" value="/login" />
                        <form action="${loginUrl}" method="post" class="form-horizontal">
                        <input type="text"  id="username" name="ssoId" placeholder="Enter Username" required ng-hide="{{isUserLoggedIn}}">
                        <input type="password"  id="password" name="password" placeholder="Enter Password" required ng-hide="{{isUserLoggedIn}}">
                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        <input type="submit" class=" btn-primary btn-default" value="Log in" ng-hide="{{isUserLoggedIn}}">
                       </form>
                      </div>
          <div class="navbar-custom-menu" ng-show="{{isUserLoggedIn}}">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="static/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="static/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="static/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="static/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu" ng-controller="ProjectController as vm">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                  <i class=" icon-bell" ></i>
                  <span class="label label-warning" >{{count}}</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have {{count}} notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li  ng-repeat="a in vm.p_not_commented  track by $index">
                      <a href="#/all_projects">
                        <i class="icon-exclamation-sign"></i>Project "{{a.project_id || a.id}}" is not commented!
                      </a>
                      </li>
                  
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu" ng-controller="PayController as vm">
                <a  href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">{{notif}}</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have {{notif}} tasks</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li ng-repeat="a in vm.impayed  track by $index"><!-- Task item -->
                      <a href="#/pay">
                        <h5>
                           <i class="fa fa-warning"></i> Impayed amount on: {{a.date}} 
                        </h5>
                        </a>
                      </li><!-- end task item -->
                     
                     
                     
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="static/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">${user}</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header" ng-controller="UserController as ctr">
                    <img src="static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      {{currentuser.username}} - {{currentuser.role}}
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="http://localhost:8081/SpringSecurityRoleBasedLoginExample/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel" ng-show="{{isUserLoggedIn}}">
            <div class="pull-left image">
              <img src="static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>${user}</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
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
            
            
          
           
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->   
           
            <a href="<c:url value='/singleUpload' />">Single File Upload</a>  OR  <a href="<c:url value='multiUpload' />">Multi File Upload</a>
          
            
                    </div>

      
       
    
        <script src="//code.angularjs.org/1.2.20/angular.js"></script>
    <script src="//code.angularjs.org/1.2.20/angular-route.js"></script>
    <script src="//code.angularjs.org/1.2.13/angular-cookies.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>
     <script src="static/js/app.js"></script>
     
    <script src="static/js/project_controller.js"></script>
    <script src="static/js/chat.js"></script>
     <script src="static/js/facture_controller.js"></script>
    <script src="static/js/message.js"></script>
    <script src="static/js/ann_controlleur.js"></script>
    <script src="static/js/mail_controller.js"></script>
    <script src="static/js/user_controller.js"></script>
     <script src="static/js/pay_controller.js"></script>
     <script src="static/js/user_service.js"></script>
      <script src="static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script> 
     <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="static/plugins/fullcalendar/fullcalendar.min.js"></script>
   <script src="static/js/bower_components/angular/angular.js"></script>
    <script src="static/js/bower_components/angular-chat/angular-chat.js"></script>
    <script src="static/js/bower_components/sweetalert/dist/sweetalert.min.js"></script>
    <script src="static/js/bower_components/sweetalert/lib/sweetalert.js"></script>
     <script src="static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="static/plugins/select2/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="static/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="static/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="static/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="static/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="static/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="static/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
     <!-- iCheck 1.0.1 -->
    <script src="static/plugins/iCheck/icheck.min.js"></script>
    
    <!-- FastClick -->
    <script src="static/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="static/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="static/dist/js/demo.js"></script>
    <!-- jQuery Knob -->
   
    <!-- Sparkline -->
     
    <script src="static/plugins/sparkline/jquery.sparkline.min.js"></script>
	</body>
</html>