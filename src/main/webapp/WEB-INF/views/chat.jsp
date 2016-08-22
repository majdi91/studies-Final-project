<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Simple Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="layout" content="main"/>
    
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>

    <script src="static/js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <link href="static/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link href="static/css/chat_msg.css" type="text/css" media="screen, projection" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/chat.css">
    <link rel="apple-touch-icon-precomposed" href="static/images/media/angularjs-chat.png">
    <link rel="shortcut icon" href="static/images/media/angularjs-chat.png">
    
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
    <body ng-app="myApp">
  
<div class="chat-container" ng-controller="BasicController as chat">

        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <!-- Chat Messages -->
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <div class="chat-messages">
            <div class="chat-header">
                <div class="angularjs-chat-logo"></div>
               Forum
            </div>
            
            <div ng-repeat="m in chat.sms">
                <div class="sent-message-{{ message.self }}">
                    
                   <span class="bubble">  {{m.sender}} :{{ m.txt }}</span>
                </div>
                <div class="clear"></div>
            </div>
             <div ng-repeat="message in chat.messages">
                
                    <span class="bubble bubble--alt">{{message.user.name}} :{{ message.data }}</span>
                    
                
                <div class="clear"></div>
            </div>
        </div>

        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <!-- User Input -->
        <!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
        <form ng-submit="chat.send()" class="chat-input">
            <input type="text" ng-model="chat.textbox" autofocus>
            <input type="submit" class="send-icon" value=" " ng-click="chat.addNotification()">
            <input type="submit" value=" "
                class="sent-indicator {{ chat.status }}">
        </form>

    </div>
    
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
   <script src="static/js/bower_components/angular/angular.js"></script>
    <script src="static/js/bower_components/angular-chat/angular-chat.js"></script>
    <script src="static/js/app.js"></script>
    <script src="static/js/project_controller.js"></script>
    <script src="static/js/chat.js"></script>
    <script src="static/js/ann_controlleur.js"></script>
    <script src="static/js/user_controller.js"></script>
    
     <script src="static/js/user_service.js"></script>
        <script type="text/javascript">
        $(function() {
            $('#sample-table').tablesorter();
            $('#datepicker').datepicker();
            $(".chosen").chosen();
        });
    </script>

	</body>
</html>
   