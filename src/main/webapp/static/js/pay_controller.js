'use strict';

myApp.controller('PayController', ['$scope', 'UserService','$cookieStore', function($scope,UserService,$cookieStore) {

	 var vm = this;
	 $scope.valide=false;
	 vm.details=[];
	 $scope.currentuser={};
	 $scope.currentdate= new Date().toUTCString();
	 vm.payments=[];
	 vm.projects=[];
	 vm.impayed=[];
	 vm.p=[];
	 $scope.bill_c={};
	 $scope.nb=0;
	 $scope.notif=0;
	 $scope.nbr=0;
	 $scope.somme=0.0;
	 $scope.s_not_payed=0.0;
	 $scope.nb_users=0;
		 vm.users=[];
	 $scope.payed=0;
	 $scope.entree=0.0;
	 $scope.current_p = {};
	 var u =getUser();
	 $scope.project_en_cours =0;
	 
	 var bills=[];
	 
	 
	 vm.currentpayment = function(date){
   	 
         for(var i = 0; i < vm.payments.length; i++){
             if(vm.payments[i].date == date) {
            	 $scope.current_p = angular.copy(vm.payments[i]);
                $cookieStore.put('$scope.current_p',$scope.current_p);
               
                break;
             }
         }	  
     };
     vm.loadcurrentpaymet= function (){
    	 $scope.current_p= $cookieStore.get('$scope.current_p');
   	  
     };
     vm.loadcurrentpaymet();
    
	 vm.getprojects = function(){
         UserService.fetchAllProjects()
         .then(
					       function(d) {
						        vm.projects = d;
						        vm.encours();
						      
					       },
   					function(errResponse){
   						console.error('Error while fetching Currencies');
   					}
			       );
 };
 vm.getprojects();
 	vm.encours= function(){
	 var n=0;
	 for (var i=0;i<vm.projects.length;i++)
		 {
		 if (vm.projects[i].avancement != 100) {vm.p[n]=vm.projects[i];n++;$scope.project_en_cours++;}
		 }
	 $scope.chart3=vm.projects.length - $scope.project_en_cours;
 }
	 vm.getall= function () {
		 UserService.payments()
         .then(
					       function(d) {
						        vm.payments = d;
						        vm.getdetails ();
						        vm.count();
						        vm.notification();
					       },
   					function(errResponse){
   						console.error('Error while fetching Currencies');
   					}
			       );
		 
	 };
	 vm.fetchAllUsers = function(){
         UserService.fetchAllUsers()
             .then(
 					       function(d) {
 						        vm.users = d;
 						       $scope.nb_users=vm.users.length;
 						       for (var i=0;i<vm.users.length;i++){
 						    	   if (u == vm.users[i].username) $scope.current=vm.users[i];
 						       }
 					       },
       					function(errResponse){
       						console.error('Error while fetching Currencies');
       						
       					}
 			       );
     };
     vm.fetchAllUsers();
     
	 vm.getdetails = function (){
		 var k =0;
		 for (var i=0; i<vm.payments.length;i++)
			 {
			 	if (getUser()== vm.payments[i].user)
			 		{
			 			vm.details[k]=vm.payments[i];
			 			if (vm.details[k].etat == "not payed") vm.details[k].disable = true;
			 			k++;
			 		}
			 }
		 
	 };
	 vm.count = function (){
		 var currentDate = new Date();
		 var month = currentDate.getMonth() + 1;
		 var year = currentDate.getFullYear();
		 for (var i=0;i<vm.payments.length;i++)
	 {var s= vm.payments[i].etat;
	 var d= vm.payments[i].date;
	 var dd= d.slice(0,2);
	 var yy=d.slice(3,7);
		if (s.match(/^not.*$/)) {
			$scope.nbr++ ;
			$scope.somme += vm.payments[i].montant;
			if (month == dd && year==yy ) {$scope.s_not_payed+=vm.payments[i].montant;$scope.nb++;}
		}
		else if (month == dd && year==yy && s.match(/^payed.*$/)) {$scope.payed++;$scope.entree+=vm.payments[i].montant;}
		
	 }
		 $scope.chart1=($scope.payed/$scope.nb_users)*100;
		 $scope.chart2=($scope.nbr/$scope.nb_users)*100;
	 };
	 vm.notification= function(){
		var u =getUser();
		var k=0;
		for (var i=0;i<vm.payments.length;i++)
			{
		if (u == vm.payments[i].user && vm.payments[i].etat == "not payed" ) {vm.impayed[k]=vm.payments[i];$scope.notif++;}
			}
	};

	 vm.getall();
	 vm.fetchAllBills = function(){
	     UserService.fetchAllBills()
	         .then(
	 				       function(d) {
	 					        bills = d;
	 					       for(var i = 0; i < bills.length; i++){
	 								 if ($scope.current.firstName == bills[i].firstName && $scope.current.lastName == bills[i].lastName ) {$scope.valide=true;
	 								 $scope.bill_c=bills[i];
	 								 }
	 							 }
	 				       },
	   					function(errResponse){
	   						console.error('Error while fetching Currencies');
	   						
	   					}
	 		       );
	 };
	 vm.fetchAllBills();
    
	 $scope.printDiv = function(divName) {
		 var printContents = document.getElementById(divName).innerHTML;
		    var originalContents = document.body.innerHTML;        
		    document.body.innerHTML = printContents;
		    window.print();
		    document.body.innerHTML = originalContents;
		} 
}]);