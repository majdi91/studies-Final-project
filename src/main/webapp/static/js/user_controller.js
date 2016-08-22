'use strict';

myApp.controller('UserController', ['$scope', 'UserService','$location', function($scope,UserService,$location) {
          var vm = this;
          $scope.currentuser={};
          vm.user={firstName:'',lastName:'',username:'',email:'',role:'',password:''};
          vm.pub={id:'',lib:'',img:''};
          vm.users=[];
          vm.pubs=[];
          vm.fb_user={};
          var u = getUser();
          $scope.isUserLoggedIn=false;  
          vm.checklogin = function (){
        	  if (u != "anonymousUser" ) 
        	  { $scope.isUserLoggedIn=true;}
        	  else  $scope.isUserLoggedIn=false;
        	  
          };
          vm.checklogin();
          vm.fetchAllUsers = function(){
              UserService.fetchAllUsers()
                  .then(
      					       function(d) {
      						        vm.users = d;
      						      vm.currentuser();
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          vm.fetchAllPubs = function(){
              UserService.fetchAllPubs()
                  .then(
      					       function(d) {
      						        vm.pubs = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
           
          
          vm.deleteUser = function(id){
              UserService.deleteUser(id)
		              .then(
				              self.fetchAllUsers,
				              
				              function(errResponse){
					               console.error('Error while deleting User.');
				              }	
                  );
          };

          vm.fetchAllUsers();
          vm.createUser = function(user){
              UserService.createUser(user)
		              .then(
                      vm.fetchAllUsers(), 
				              function(errResponse){
					               console.error('Error while creating User.');
				              }	
                  );
          };
          vm.submit = function() {
              if(vm.user.username==null){
                  console.log('Saving New User', vm.user);    
                  vm.createUser(vm.user);
              }else{
                  vm.updateUser(vm.user, vm.user.username);
                  console.log('User updated with id ', vm.user.username);
              }
              vm.reset();
          };
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
          vm.edit = function(username){
        	
              console.log('username to be edited', username);
              for(var i = 0; i < vm.users.length; i++){
                  if(vm.users[i].username == username) {
                     vm.user = angular.copy(vm.users[i]);
                     console.log('username ', vm.user.username);
                     console.log('firstname ', vm.user.firstName);
                     console.log('lastname ', vm.user.lastName);
                     console.log('email ', vm.user.email);
                    
                     break;
                  }
              }
          };
          vm.edit_delete = function(username){
          	
              console.log('username to be edited', username);
              for(var i = 0; i < vm.users.length; i++){
                  if(vm.users[i].username == username) {
                     vm.user = angular.copy(vm.users[i]);
                     
               
                     break;
                  }
                  swal({   title: "Are you sure?",   
                	  text: "You will not be able to recover this imaginary file!",  
                	  type: "warning",   
                	  showCancelButton: true,  
                	  confirmButtonColor: "#DD6B55",   
                	  confirmButtonText: "Yes, delete it!",   
                	  cancelButtonText: "No, cancel plx!",   
                	  closeOnConfirm: false,   closeOnCancel: false },
                	  function(isConfirm){  
                		  if (isConfirm) {  vm.deleteUser(vm.user.username);   swal("Deleted!", "Your imaginary file has been deleted.", "success");   } 
                		  else {     swal("Cancelled", "Your imaginary file is safe :)", "error");   } });
              }
          };
          vm.updateUser = function(user,username){
              UserService.updateUser(user,username)
		              .then(
				              vm.fetchAllUsers, 
				              swal("Information updated with success!", "You clicked the button!", "success"),
				              function(errResponse){
					               console.error('Error while updating User.');
				              }	
                  );
          };
          
          vm.remove = function(username){
              console.log('username to be deleted', username);
              if(vm.user.username === username) {//clean form if the user to be deleted is shown there.
                 vm.reset();
              }
              vm.deleteUser(username);
          };

          
          vm.reset = function(){
              vm.user={username:'',email:'',firstName:''};
              $scope.myForm.$setPristine(); //reset Form
          };
          vm.currentuser= function(){
        	  for (var i=0;i<vm.users.length;i++)
        		  {
        		  if(u==vm.users[i].username) $scope.currentuser=vm.users[i];
        		  }
          }

      }]);
