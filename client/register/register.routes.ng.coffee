'use strict'
angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider

  .state 'register',
      url: '/register',
      templateUrl: 'client/register/register.view.html',
      controller: 'RegisterCtrl'

  .state 'resetcustom',
    url:  '/reset-password/:token'
    templateUrl: 'client/registers/reset.view.html'
    controller: 'resetcustomCtrl' 

  .state 'verifycustom',
    url:  '/verify-email/:token'
    templateUrl: 'client/registers/verified.view.html'
    controller: 'verifycustomCtrl'  
