'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'tests-list',
    url: '/tests'
    templateUrl: 'client/tests/tests-list.view.html'
    controller: 'TestsListCtrl'    
  .state 'test-detail',
    url: '/tests/:testId'
    templateUrl: 'client/tests/test-detail.view.html'
    controller: 'TestDetailCtrl'
