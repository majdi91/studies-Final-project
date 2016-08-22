'use strict';

myApp.controller('MailController', ['$scope', 'UserService','$window','$cookieStore', function($scope,UserService,$window,$cookieStore) {
	var vm = this;
	vm.mail={from:'',to:'',object:'',budy:'',firstName:'',lastName:''};
	vm.users=[];
	vm.mails=[];
	vm.c_mail={};
	vm.reply_msg={from:'',to:'',object:'',budy:'',firstName:'',lastName:''};
	vm.emails=[];
	vm.mails_sent=[];
	$scope.receive=0;
	$scope.sent=0;
	var u=getUser();
	vm.fetchAllUsers = function(){
        UserService.fetchAllUsers()
            .then(
					       function(d) {
						        vm.users = d;
						      for (var i=0;i<vm.users.length;i++)
						    	  {
						    	  if (u == vm.users[i].username) {vm.mail.from=vm.users[i].email;
						    	  vm.mail.firstName=vm.users[i].firstName;
						    	  vm.mail.lastName=vm.users[i].lastName;
						    	  vm.reply_msg.firstName=vm.users[i].firstName;
						      	  vm.reply_msg.lastName=vm.users[i].lastName;
						    	  }
						    	  }
					       },
      					function(errResponse){
      						console.error('Error while fetching Currencies');
      					}
			       );
    };
    vm.fetchAllUsers();
    
    vm.fetchAllMails = function(){
        UserService.fetchAllMails()
            .then(
					       function(d) {
						        vm.mails = d;
						        for (var i=0;i<vm.mails.length;i++)
						    	  {
						    	  if (u == vm.mails[i].to) {vm.emails[$scope.receive]=vm.mails[i];$scope.receive++;}
						    	  if (u == vm.mails.from) {vm.mails_sent[$scope.sent]=vm.mails[i];$scope.sent++;}
						    	  }
					       },
      					function(errResponse){
      						console.error('Error while fetching Currencies');
      					}
			       );
    };
    vm.fetchAllMails();
    vm.edit = function(from,object){
  	  
        for(var i = 0; i < vm.mails.length; i++){
            if(vm.mails[i].from == from && vm.mails[i].object == object) {
               vm.c_mail = angular.copy(vm.mails[i]);
               $cookieStore.put('vm.c_mail', vm.c_mail);
              
               break;
            }
        }
        
        
  	  
    };
    vm.currentmail= function (){
    	vm.c_mail= $cookieStore.get('vm.c_mail');
  	  
    };
    vm.currentmail();
    vm.reply= function (){
    	vm.reply_msg.from= vm.c_mail.to;
    	vm.reply_msg.to = vm.c_mail.from;
    	
    };
	vm.sendmail = function(email) {
		UserService.mail(email)
        .then(
        		function(){
        		swal("E-mail sent successfully!", "You clicked the button!", "success") ;
        		
        		},
	              function(errResponse){
		               console.error('Error while sending email.');
	              }	
    );
		$window.location.reload();
		
};
		
	
	
	
}]);