'use strict';

myApp.controller('AnnController', ['$scope', 'UserService','$location','FileUploader','$sce' ,function($scope,UserService,$location,FileUploader,$sce) {
	var uploader = $scope.uploader = new FileUploader({
        url: '/SpringSecurityRoleBasedLoginExample/singleUpload'
    });
	
	var vm = this;
	$scope.myImgSrc = $sce.trustAsResourceUrl('static/upload/');
          vm.pub={desc:'',cat:'',date:'',file_name:[],file_size:[],file_type:[],file_date:[],titre:'',user:null};
          vm.pub.cats=['Vente','Location','Demande aide'];
          vm.pubs=[];
          vm.users=[]; 
          var u = getUser();
       // FILTERS

          uploader.filters.push({
              name: 'imageFilter',
              fn: function(item /*{File|FileLikeObject}*/, options) {
                  var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
                  return 'txt|pdf|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
              }
          });

          // CALLBACKS

          uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
              console.info('onWhenAddingFileFailed', item, filter, options);
          };
          uploader.onAfterAddingFile = function(fileItem) {
              console.info('onAfterAddingFile', fileItem);
          };
          uploader.onAfterAddingAll = function(addedFileItems) {
              console.info('onAfterAddingAll', addedFileItems);
          };
          uploader.onBeforeUploadItem = function(item) {
              console.info('onBeforeUploadItem', item);
          };
          uploader.onProgressItem = function(fileItem, progress) {
              console.info('onProgressItem', fileItem, progress);
          };
          uploader.onProgressAll = function(progress) {
              console.info('onProgressAll', progress);
          };
          uploader.onSuccessItem = function(fileItem, response, status, headers) {
              console.info('onSuccessItem', fileItem, response, status, headers);
          };
          uploader.onErrorItem = function(fileItem, response, status, headers) {
              console.info('onErrorItem', fileItem, response, status, headers);
          };
          uploader.onCancelItem = function(fileItem, response, status, headers) {
              console.info('onCancelItem', fileItem, response, status, headers);
          };
          uploader.onCompleteItem = function(fileItem, response, status, headers) {
              console.info('onCompleteItem', fileItem, response, status, headers);
          };
          uploader.onCompleteAll = function() {
              console.info('onCompleteAll');
          };

          console.info('uploader', uploader);
          
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
         
          vm.fetchAllPubs();
          vm.fetchAllUsers();
          vm.createAnn = function(pub){
        	  for (var i=0;i<vm.users.length;i++)
        		  {


        		  if (u== vm.users[i].username) vm.pub.user=vm.users[i];
        		  
        		  }
        	  for (var j=0;j<uploader.queue.length;j++){
        		  var ch= uploader.queue[j].file.name;
        		  ch =ch.replace(/[\/\\#,+()$%'":*?<>{}]/g, '');
        		  vm.pub.file_name[j]=ch;
        		  vm.pub.file_size[j]=JSON.stringify(uploader.queue[j].file.size);
        		  vm.pub.file_date[j]=JSON.stringify(uploader.queue[j].file.lastModifiedDate);
        		  vm.pub.file_type[j]=JSON.stringify(uploader.queue[j].file.type);
        	  }
              UserService.createAnn(pub)
		              .then(
                      vm.fetchAllPubs,
                      swal("Announce added with success!", "You clicked the button!", "success"),
				              function(errResponse){
					               console.error('Error while creating Pub.');
					               swal("Oops!", "Error while creating this announce!", "error");
				              }	
                  );
             
              $location.path('/');
          };
          vm.reset = function(){
              self.user={titre:'',desc:'',img:'',cat:''};
              $scope.myForm.$setPristine(); //reset Form
          };
}]);