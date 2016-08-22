(function () {
    'use strict';

    angular
        .module('myApp')
        .controller('EditController', EditController);

    EditController.$inject = ['UserService', '$location', '$rootScope'];
    function EditController(UserService, $location, $rootScope) {
        var vm = this;
        vm.users=[];
        vm.user=null;
        vm.update = update;
        
        vm.reset=reset;
        initController();
        function initController() {
            loadCurrentUser();
            loadAllUsers()
        }
        function loadCurrentUser() {
            UserService.GetByUsername($rootScope.globals.currentUser.username)
                .then(function (user) {
                    vm.user = user;
                });
        }
        function loadAllUsers() {
            UserService.GetAll()
                .then(function (users) {
                    vm.allUsers = users;
                });
        }
        function update() {
        	firstName=vm.user.firstName;
        	lastName=vm.user.lastName;
        	email=vm.user.email;
        	username=vm.user.username;
        	UserService.updateUser(user,username)
            .then(function (response) {
                if (response.success) {
                    console.log("success!");
                }
                else
                	{
                	console.log("fail!");
                	}
                	}
		             
        );
        	
        }
         function submit() {
            if(vm.user.id==null){
                console.log('Saving New User', vm.user);    
                vm.createUser(self.user);
            }else{
                vm.updateUser(vm.user, vm.user.username);
                console.log('User updated with id ', vm.user.username);
            }
           
            vm.reset();
        }
         function reset(){
            vm.user={firstName:'',lastName:'',username:'',address:'',email:'',password:''};
            $scope.myForm.$setPristine(); //reset Form
        }
        
    
    }
}
)();