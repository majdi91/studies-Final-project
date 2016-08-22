'use strict';

myApp.controller('BillController', ['$scope', 'UserService','$cookieStore', function($scope,UserService,$cookieStore) {
	
var vm = this;
$scope.invoice =0;
$scope.id=0;
vm.fact={};
var bills=[];
vm.fetchAllBills = function(){
    UserService.fetchAllBills()
        .then(
				       function(d) {
					        bills = d;
					        vm.get();
				       },
  					function(errResponse){
  						console.error('Error while fetching Currencies');
  						
  					}
		       );
};
vm.fetchAllBills();
vm.get = function (){
	 $scope.invoice= bills.length;
     $scope.id= bills.length;
}
vm.add = function (bill){
	vm.fact.invoice= $scope.invoice+1;
	vm.fact.id=$scope.id+1;
	UserService.create_bill(bill)
    .then(
    		function (){
    			 
    				
    swal("Bill added with success!", "You clicked the button!", "success");},
            function(errResponse){
	               console.error('Error while creating Project.');
	               swal("Oops!", "Error while creating Project!", "error");
            }	
);
  bills.push(bill);
  vm.fetchAllBills();
   
};
	
	
	
	
}]);