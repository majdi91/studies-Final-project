'use strict';

myApp.factory('UserService', ['$http', '$q', function($http, $q){

	return {
		fetchAllPubs: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/annonces/')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		fetchAllBills: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/bills')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		fetchAllMails: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/mails')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		fetchAllVotes: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/getvotes/')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		fetchAllSms: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/sms/')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		payments: function() {
			return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/payment')
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while fetching users');
								return $q.reject(errResponse);
							}
			);
		},
		
		createAnn: function(pub){
			return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/ann/add/', pub)
					.then(
							function(response){
								return response.data;
							}, 
							function(errResponse){
								console.error('Error while creating anounce!');
								return $q.reject(errResponse);
							}
					);
    },
    create_bill: function(bill){
		return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/add_bill/', bill)
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while creating anounce!');
							return $q.reject(errResponse);
						}
				);
},
    mail: function(m){
		return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/email/', m)
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while creating anounce!');
							return $q.reject(errResponse);
						}
				);
},
    vote: function(v){
		return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/vote/', v)
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while creating anounce!');
							return $q.reject(errResponse);
						}
				);
},
    createProject: function(project){
		return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/project/add/', project)
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while creating project');
							return $q.reject(errResponse);
						}
				);
},
	Comment: function(comment){
	return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/project/comment/', comment)
			.then(
					function(response){
						return response.data;
					}, 
					function(errResponse){
						console.error('Error while posting comment');
						return $q.reject(errResponse);
					}
			);
},
	fetchAllUsers: function() {
		return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/users')
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while fetching users');
							return $q.reject(errResponse);
						}
		);
},
fetchAllProjects: function() {
	return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/project/')
			.then(
					function(response){
						return response.data;
					}, 
					function(errResponse){
						console.error('Error while fetching projects');
						return $q.reject(errResponse);
					}
	);
},
fetchAllComments: function() {
	return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/comments')
			.then(
					function(response){
						return response.data;
					}, 
					function(errResponse){
						console.error('Error while fetching comments');
						return $q.reject(errResponse);
					}
	);
},
createUser: function(user){
	return $http.post('http://localhost:8081/SpringSecurityRoleBasedLoginExample/user/', user)
			.then(
					function(response){
						return response.data;
					}, 
					function(errResponse){
						console.error('Error while creating user');
						return $q.reject(errResponse);
					}
			);
},
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
},
GetById:function (id){
	return $http.get('http://localhost:8081/SpringSecurityRoleBasedLoginExample/details/',id)
	.then(
			function(response){
				return response.data;
			}, 
			function(errResponse){
				console.error('Error while fetching project');
				return $q.reject(errResponse);
			}
);
	
},
updateUser: function(user,username){
	return $http.put('http://localhost:8081/SpringSecurityRoleBasedLoginExample/update/'+username, user)
			.then(
					function(response){
						return response.data;
					}, 
					function(errResponse){
						console.error('Error while updating user');
						return $q.reject(errResponse);
					}
			);
},
deleteUser: function(username){
    return $http['delete']('http://localhost:8081/SpringSecurityRoleBasedLoginExample/delete/'+username)
            .then(
                    function(response){
                        return response.data;
                    }, 
                    function(errResponse){
                        console.error('Error while deleting user');
                        return $q.reject(errResponse);
                    }
            );
}
     
		
	};

}]);
