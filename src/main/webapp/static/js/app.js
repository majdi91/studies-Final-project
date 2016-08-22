'use strict';

var myApp = angular.module('myApp', ['ngRoute','ngCookies','chat','angularFileUpload']).constant( 'config', {
    "pubnub": {
        "publish-key"   : "pub-c-aefb421c-b30a-4afc-bae4-b866c5ea3d69",
        "subscribe-key" : "sub-c-76f89e66-c3a9-11e5-b5a8-0693d8625082"
    }
} );;


myApp.config(['$routeProvider', function ($routeProvider) {

        $routeProvider
        .when('/info', {
            
            templateUrl: 'static/view/project_dash.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
        .when('/sent-mail', {
            
            templateUrl: 'static/view/mail_sent.jsp',
            controller: 'MailController',
            controllerAs: 'vm'
        })
        .when('/send', {
            
            templateUrl: 'static/view/send_mail.jsp',
            controller: 'MailController',
            controllerAs: 'vm'
        })
        .when('/read', {
            
            templateUrl: 'static/view/read_mail.jsp',
            controller: 'MailController',
            controllerAs: 'vm'
        })
         .when('/invoice', {
            
            templateUrl: 'static/view/invoice.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
       .when('/invoice-print', {
            
            templateUrl: 'static/view/invoice_print.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
        .when('/bill', {
            
            templateUrl: 'static/view/add_bill.jsp',
            controller: 'BillController',
            controllerAs: 'vm'
        })
        .when('/dash', {
            
            templateUrl: 'static/view/dashbord.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
        .when('/pay', {
            
            templateUrl: 'static/view/payment.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
        .when('/ii', {
            
            templateUrl: 'static/view/charts.jsp',
            controller: 'PayController',
            controllerAs: 'vm'
        })
        .when('/add_project', {
            
            templateUrl: 'static/view/add_project.jsp',
            controller: 'ProjectController',
            controllerAs: 'vm'
        })
        .when('/all_projects', {
            
            templateUrl: 'static/view/view_allprojects.jsp',
            controller: 'ProjectController',
            controllerAs: 'vm'
        })
        	.when('/project_details', {
            
            templateUrl: 'static/view/project_details.jsp',
            controller: 'ProjectController',
            controllerAs: 'vm'
        })
        .when('/', {
            
            templateUrl: 'static/view/view_annonce.jsp',
            controller: 'AnnController',
            controllerAs: 'vm'
        })
        	
            .when('/view', {
                
                templateUrl: 'static/view/view_all.jsp',
                controller: 'UserController',
                controllerAs: 'vm'
            })
            .when('/add', {
                
                templateUrl: 'static/view/add.jsp',
                controller: 'AnnController',
                controllerAs: 'vm'
            })
            .when('/add_user', {
                
                templateUrl: 'static/view/add_user.jsp',
                controller: 'UserController',
                controllerAs: 'vm'
            })
            .when('/update', {
                
                templateUrl: 'static/view/update_user.jsp',
                controller: 'UserController',
                controllerAs: 'vm'
            })
            .when('/delete', {
                
                templateUrl: 'static/view/delete_user.jsp',
                controller: 'UserController',
                controllerAs: 'vm'
            })
            .when('/edit', {
                
                templateUrl: 'static/view/edit.jsp',
                controller: 'UserController',
                controllerAs: 'vm'
            });
            
}]);

