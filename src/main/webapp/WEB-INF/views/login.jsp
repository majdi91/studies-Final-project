<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!-- <html> -->
<!-- 	<head> -->
<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<!-- 		<title>Login page</title> -->
<%-- 		<link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link> --%>
<%-- 		<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> --%>
<!-- 		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" /> -->
<!-- 	</head> -->

<!-- 	<body> -->
<!-- 		<div id="mainWrapper"> -->
<!-- 			<div class="login-container"> -->
<!-- 				<div class="login-card"> -->
<!-- 					<div class="login-form"> -->
<%-- 						<c:url var="loginUrl" value="/login" /> --%>
<%-- 						<form action="${loginUrl}" method="post" class="form-horizontal"> --%>
<%-- 							<c:if test="${param.error != null}"> --%>
<!-- 								<div class="alert alert-danger"> -->
<!-- 									<p>Invalid username and password.</p> -->
<!-- 								</div> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${param.logout != null}"> --%>
<!-- 								<div class="alert alert-success"> -->
<!-- 									<p>You have been logged out successfully.</p> -->
<!-- 								</div> -->
<%-- 							</c:if> --%>
<!-- 							<div class="input-group input-sm"> -->
<!-- 								<label class="input-group-addon" for="username"><i class="fa fa-user"></i></label> -->
<!-- 								<input type="text" class="form-control" id="username" name="ssoId" placeholder="Enter Username" required> -->
<!-- 							</div> -->
<!-- 							<div class="input-group input-sm"> -->
<!-- 								<label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label>  -->
<!-- 								<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required> -->
<!-- 							</div> -->
<%-- 							<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" /> --%>
								
<!-- 							<div class="form-actions"> -->
<!-- 								<input type="submit" -->
<!-- 									class="btn btn-block btn-primary btn-default" value="Log in"> -->
<!-- 							</div> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 	</body> -->
<!-- </html> -->


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html lang="en">

    <head>
    

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Login &amp; Register Templates</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="static/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="static/assets/css/form-elements.css">
        <link rel="stylesheet" href="static/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="static/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="static/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="static/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="static/assets/ico/apple-touch-icon-57-precomposed.png">



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

    <body ng-app="myApp" >
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '573002986187496',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>Login &amp; Register Forms</h1>
                            <div class="description">
                            	<p>
	                            	
                            	</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Login to our site</h3>
	                            		<p>Enter username and password to log on:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-lock"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
	                            <c:url var="loginUrl" value="/login" />
				                    <form role="form" action="${loginUrl}" method="post" class="login-form">
				                    <c:if test="${param.error != null}"> --%>
									<div class="alert alert-danger">
										<p>Invalid username and password.</p>
									</div>
									</c:if>
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text"  placeholder="Username..." class="form-username form-control" id="form-username" name="ssoId">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
				                        
				                        </div>
				                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
				                        <button type="submit" class="btn">Sign in!</button>
				                    </form>
			                    </div>
		                    </div>
		                
		                	<div class="social-login" ng-controller="FacebookController as vm">
	                        	<h3>...or login with:</h3>
	                        	<div class="social-login-buttons">
		                        	<a class="btn btn-link-2" href="#" ng-click="vm.FBLogin()">
		                        		<i class="fa fa-facebook" ></i>Facebook
		                        	</a>
		                        	<a class="btn btn-link-2" href="#">
		                        		<i class="fa fa-twitter"></i> Twitter
		                        	</a>
		                        	<a class="btn btn-link-2" href="#">
		                        		<i class="fa fa-google-plus"></i> Google Plus
		                        	</a>
	                        	</div>
	                        </div>
	                        
                        </div>
                        
                        <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Sign up now</h3>
	                            		<p>Fill in the form below to get instant access:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom" ng-controller="UserController as ctr">
				                    <form role="form" action="" method="post" class="registration-form" ng-submit="ctr.createUser(ctr.user)")>
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">First name</label>
				                        	<input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" id="form-first-name" ng-model="ctr.user.firstName">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Last name</label>
				                        	<input type="text" name="form-last-name" placeholder="Last name..." class="form-last-name form-control" id="form-last-name" ng-model="ctr.user.lastName">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text" name="form-usernname" placeholder="Username..." class="form-last-name form-control" id="form-username" ng-model="ctr.user.username">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="form-password" placeholder="Password..." class="form-last-name form-control" id="form-password" ng-model="ctr.user.password">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Email</label>
				                        	<input type="text" name="form-email" placeholder="Email..." class="form-email form-control" id="form-email" ng-model="ctr.user.email">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Role</label>
				                        	<input type="text" name="form-Role" placeholder="Role..." class="form-email form-control" id="form-role" ng-model="ctr.user.role">
				                        </div>
				                        
				                        <button type="submit" class="btn">Sign me up!</button>
				                    </form>
			                    </div>
                        	</div>
                        	
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>

        <!-- Footer -->
        <footer>
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				
        			</div>
        			
        		</div>
        	</div>
        </footer>

        <!-- Javascript -->
        <script src="static/assets/js/jquery-1.11.1.min.js"></script>
        <script src="static/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="static/assets/js/jquery.backstretch.min.js"></script>
        <script src="static/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
		 <script src="static/js/bootstrap/bootstrap-transition.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-alert.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-modal.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-dropdown.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-scrollspy.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-tab.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-tooltip.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-popover.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-button.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-collapse.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-carousel.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-typeahead.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-affix.js" type="text/javascript" ></script>
        <script src="static/js/bootstrap/bootstrap-datepicker.js" type="text/javascript" ></script>
        <script src="static/js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
        <script src="static/js/jquery/jquery-chosen.js" type="text/javascript" ></script>
        <script src="static/js/jquery/virtual-tour.js" type="text/javascript" ></script>
        <script src="//code.angularjs.org/1.2.20/angular.js"></script>
    <script src="//code.angularjs.org/1.2.20/angular-route.js"></script>
    <script src="//code.angularjs.org/1.2.13/angular-cookies.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>

   <script src="static/js/bower_components/angular/angular.js"></script>
    <script src="static/js/bower_components/angular-chat/angular-chat.js"></script>
    <script src="static/js/app.js"></script>
     
    <script src="static/js/project_controller.js"></script>
    <script src="static/js/chat.js"></script>
    
    <script src="static/js/message.js"></script>
    <script src="static/js/ann_controlleur.js"></script>
    <script src="static/js/user_controller.js"></script>
     <script src="static/js/pay_controller.js"></script>
     <script src="static/js/user_service.js"></script>
     <script src="static/js/facebook_controller.js"></script>
     
    </body>

</html>