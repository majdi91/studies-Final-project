/**
 * 
 */
'use strict';

myApp.factory('UserService', ['$http', '$q', function($http, $q){

	return {
messagereceive: function(msg) {
			return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/chat/message/',msg)
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while chating');
								return $q.reject(errResponse);
							}
			);
		}
	};

}]);