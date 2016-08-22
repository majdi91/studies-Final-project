<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>File Upload Success</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body ng-app="myApp">
	<div class="success">
		File  <strong>${fileName}</strong> uploaded successfully.
		<br/><br/>
		<a href="<c:url value='http://localhost:8081/SpringSecurityRoleBasedLoginExample/#/add' />">Home</a>	
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