/**
 * 
 */

'use strict';

myApp.controller('FacebookController', ['$scope', 'UserService','$cookieStore', function($scope,UserService,$cookieStore) {
	 var vm = this;
	 vm.users=[];
	 vm.fetchAllUsers = function(){
         UserService.fetchAllUsers()
             .then(
 					       function(d) {
 						        vm.users = d;
 					       },
       					function(errResponse){
       						console.error('Error while fetching Currencies');
       					}
 			       );
     };
     vm.fetchAllUsers();
	vm.FBLogin = function (){
        	   FB.login(function(response) {
        		    if (response.authResponse) {
        		     console.log('Welcome!  Fetching your information.... ');
        		     FB.api('/me', function(response) {
        		       console.log('Good to see you, ' + response.name + '.');
        		       console.log(response);
        		       vm.fb_user=response;
        		       for (var i=0;i<vm.users.length;i++)
        		       if(vm.fb_user.name==vm.users[i].username && vm.users[i].role == "locataire" || vm.user.role == "proprietaire")
        		    	   {
        		    	   window.open("http://localhost:8081/SpringSecurityRoleBasedLoginExample/",'_self',false)
        		    	   u=vm.fb_user.name;
        		    	   $scope.isUserLoggedIn=true;  
        		    	   }
        		       
        		     });
        		    } else {
        		     console.log('User cancelled login or did not fully authorize.');
        		    }
        		});
           }   ;
}]);