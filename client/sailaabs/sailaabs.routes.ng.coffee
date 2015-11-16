'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'sailaabs-list',
    url: '/sailaabs'
    templateUrl: 'client/sailaabs/sailaabs-list.view.html'
    controller: 'SailaabsListCtrl'
  .state 'sailaab-detail',
    url: '/sailaabs/:sailaabId'
    templateUrl: 'client/sailaabs/sailaab-detail.view.html'
    controller: 'SailaabDetailCtrl'
