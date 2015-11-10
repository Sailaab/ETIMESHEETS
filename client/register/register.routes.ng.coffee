'use strict'
angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider

  .state 'register',
      url: '/register',
      templateUrl: 'client/register/register.view.html',
      controller: 'RegisterCtrl'