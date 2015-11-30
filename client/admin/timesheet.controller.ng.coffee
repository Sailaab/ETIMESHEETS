'use strict'
angular.module 'etimesheetApp'
.controller 'TimesheetControl', ($scope, $meteor, $stateParams, $rootScope) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'

  $scope.dailyLogs = $scope.$meteorCollection () ->
    DailyLogs.find {deleted:0}, {sort:$scope.getReactively('sort')}
  $scope.projects = $scope.$meteorCollection () ->
    Projects.find {}, {sort:$scope.getReactively('sort')}
  $scope.users = $scope.$meteorCollection ()->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}


  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLogs', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search'),$scope.getReactively('searchpro')).then () ->
      $scope.dailyLogsCount = $scope.$meteorObject Counts, 'numberOfDailyLogs', false
    $scope.$meteorSubscribe('projects')
    $scope.$meteorSubscribe('users')

  $meteor.session 'dailyLogsCounter'
  .bind $scope, 'page'    

  $scope.deltimesheet=(dailylogid)->
    Meteor.call('deldailylog',dailylogid) 

  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}

  $scope.find=(userr,project,from,to)->
    console.log("this is user"+userr)
    console.log ("thisis project"+project)
    console.log ("this i from"+ from)
    console.log ("this is to"+ to)
    $scope.dailyLogs = $scope.$meteorCollection () ->
      DailyLogs.find {'pname':project, 'user':userr, 'createdDate':{$gt:from, $lt:to}}, {sort:$scope.getReactively('sort')}
    console.log($scope.dailyLogs)      
