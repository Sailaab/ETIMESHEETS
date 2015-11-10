'use strict'
angular.module 'etimesheetApp'
.controller 'TimesheetControl', ($scope, $meteor, $stateParams, $rootScope) ->
  $scope.dailyLogs = $scope.$meteorCollection () ->
    DailyLogs.find {deleted:0}, {sort:$scope.getReactively('sort')}
  $scope.projects = $scope.$meteorCollection () ->
    Projects.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLogs', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.dailyLogsCount = $scope.$meteorObject Counts, 'numberOfDailyLogs', false
    $scope.$meteorSubscribe('projects')

  $scope.deltimesheet=(dailylogid)->
    Meteor.call('deldailylog',dailylogid) 