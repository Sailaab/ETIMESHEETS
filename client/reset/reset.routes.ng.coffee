'use strict'
angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider

  .state 'reset',
    url: '/reset',
    templateUrl: 'client/reset/reset.view.html',
    controller: 'ResetCtrl'  

  .state 'resetbyadmin',
    url: '/reset/:userId',
    templateUrl: 'client/reset/resetbyadmin.view.html',
    controller: 'ResetCtrlbyadmin'  