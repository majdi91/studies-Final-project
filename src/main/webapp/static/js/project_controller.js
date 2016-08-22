'use strict';

myApp.controller('ProjectController', ['$scope', 'UserService','$cookieStore', function($scope,UserService,$cookieStore) {
          var vm = this;
          $scope.count =0 ;
          $scope.cats=['maintenance','new project'];
          vm.project={desc:'',titre:'',project_id:'',cat:'',budget:0.0,date_deb:'',date_fin:''};
          var project={desc:'',titre:'',id:'',cat:'',budget:0.0,date_deb:'',date_fin:''}; 
          vm.p={desc:'',titre:'',id:'',cat:'',budget:0.0,date:'',date_deb:'',date_fin:''};
          vm.comment={txt:'',project:null};
          vm.vote_obj={like:0,dislike:0,id_project:'',user:''};
          vm.votes=[];
          vm.projects=[];
          var comments=[];
          var p_commented=[];
          vm.users=[];
          var u = getUser();
          vm.commentsByproject=[];
          vm.p_not_commented=[];
          $scope.like=0;
          $scope.dislike=0;
          
          vm.edit = function(titre){
        	  console.log('project to be edited', titre);
              for(var i = 0; i < vm.projects.length; i++){
                  if(vm.projects[i].titre == titre) {
                     vm.project = angular.copy(vm.projects[i]);
                     $cookieStore.put('vm.project', vm.project);
                    
                     break;
                  }
              }
              
              
        	  
          };
          vm.currentproject= function (){
        	  vm.project= $cookieStore.get('vm.project');
        	  vm.comment.project=vm.project;
          };
          vm.currentproject();
          vm.fetchAllProjects = function(){
              UserService.fetchAllProjects()
                  .then(
      					       function(d) {
      						        vm.projects = d;
      						        //console.log(vm.projects.length);
      						      
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
        function getAllComments(){
        	var k=0;
              UserService.fetchAllComments()
                  .then(
      					       function(d) {
      					    	  console.log("WS returened "+d.length+" comments");
      						        comments = d;
      						      vm.notification();
      						      console.log("Global variable holds "+comments.length+ " comments");
      						      for (var i=0;i<comments.length;i++){
      						    	  if(comments[i].project ==  null){
      				        		  if(vm.comment.project!=null && vm.comment.project.id == comments[i].project_id) {
      				        			  vm.commentsByproject[k]=comments[i];k++;
      				        		  }
      				        	  }
      						      else if (vm.comment.project!=null && vm.comment.project.id == comments[i].project.id) {
      						    	  vm.commentsByproject[k]=comments[i];k++;
      						      }
      						      }
      						      
      					       },
            					function(errResponse){
            						console.error('Error while fetching comments');
            						
            					}
      			       );
          };
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
          

          vm.notification = function()
          {
        	  var n=0;
        	  var k=0;
        	  
        	  console.log("Enumerating comments ("+comments.length+") to fetch notifications.");
        	  for (var i=0; i<comments.length;i++)
        	  {
        		  console.log("Enumerating prjects "+vm.projects.length);
        		 
        		  if (u==comments[i].utilisateur) {p_commented[n]=comments[i].project_id;n++;}
        		  else {vm.p_not_commented[k]=comments[i];k++;$scope.count++;}
        	  }
        	  if (vm.projects.length > comments.length){
        		  for (var i=0; i<vm.projects.length;i++)
        			  {
        			  var trouve=false;
        			  for (var j=0; j<comments.length;j++)
        				  {
        				  if (vm.projects[i].id == comments[j].project_id) {trouve =true;}
        				  }
        			  if (trouve == false ) {vm.p_not_commented[k]=vm.projects[i];$scope.count++;k++;}
        					  }
        	  }
        	  
        	  
        	  if (p_commented.length == 0) $scope.count = vm.projects.length;
        	   
          };
          vm.recount= function(){
        	  $scope.count=0;
          }
          vm.fetchAllProjects();
          getAllComments();
          
         
          
          vm.fetchAllUsers();
       
          vm.createProject = function(project){
        	  var d=project.date;
        	  console.log(project.date.length);
        	  var mm =d.slice(0,2);
        	  var dd =d.slice(3,5);
        	  var yy=d.slice(6,10);
        	  var m =d.slice(13,15);
        	  var ddd =d.slice(16,18);
        	  var y=d.slice(19,23);
        	  project.date_deb= dd+'/'+mm+'/'+yy;
        	  project.date_fin= ddd+'/'+m+'/'+y;
              UserService.createProject(project)
		              .then(
                      vm.fetchAllProjects,
                      swal("Project added with success!", "You clicked the button!", "success"),
				              function(errResponse){
					               console.error('Error while creating Project.');
					               swal("Oops!", "Error while creating Project!", "error");
				              }	
                  );
              vm.reset();
          };
          
          
          
          vm.AddComment = function(comment){
        	  for (var i=0;i<vm.users.length;i++)
    		  {
    		  if (u== vm.users[i].username) vm.comment.user=vm.users[i];
    		  }
              UserService.Comment(comment)
		              .then(
                      vm.fetchAllComments, 
				              function(errResponse){
					               console.error('Error while comminting!');
					               swal("Oops!", "Error while comminting!", "error");
				              }	
                  );
              
          };
          vm.getallvotes = function () {
        	  UserService.fetchAllVotes()
              .then(
  					       function(d) {
  						        vm.votes = d;
  						      vm.getvote_res();
  					       },
        					function(errResponse){
        						console.error('Error while fetching Currencies');
        						
        					}
  			       );  
        	  
          };
          vm.getallvotes();
          vm.vote_like = function(){
        	  $scope.like++;
        	  vm.vote_obj.like=  $scope.like;
        	  vm.vote_obj.user=u;
        	  vm.vote_obj.project_id=vm.project.project_id;
        	  UserService.vote(vm.vote_obj)
              .then(
             console.log("vote added!"), 
		              function(errResponse){
			               console.error('Error while voting!');
			               swal("Oops!", "Error while voting!", "error");
		              }	
          );
        	  
          };
          vm.getvote_res=function (){
        		 for (var i=0;i<vm.votes.length;i++){
        			 
        			 if (vm.votes[i].project_id == project.project_id){
        				 $scope.like += vm.votes[i].like;
        				 $scope.dislike += vm.votes[i].dislike;
        			 }
        		 }
          }
          vm.vote_dislike = function(){
        	  $scope.dislike++;
        	  vm.vote_obj.dislike=  $scope.dislike;
        	  vm.vote_obj.user=u;
        	  vm.vote_obj.project_id=vm.project.project_id;
        	  UserService.vote(vm.vote_obj)
              .then(
             console.log("vote added!"), 
		              function(errResponse){
			               console.error('Error while voting!');
			               swal("Oops!", "Error while voting!", "error");
		              }	
              );  
          };
          vm.reset = function(){
              self.user={titre:'',desc:'',img:'',cat:''};
              $scope.myForm.$setPristine(); //reset Form
          };
}]);