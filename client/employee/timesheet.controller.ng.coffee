'use strict'

angular.module 'etimesheetApp'
.controller 'TimesheetCtrl', ( $scope, $meteor, $stateParams, $rootScope) ->
  $scope.page = 1
  $scope.perPage = 10
  $scope.pname=""
  $scope.sort = name : 1
  $scope.orderProperty = '1'
  $scope.Times=[]
  
  
  
  
  $scope.dailyLogs = $scope.$meteorCollection () ->
    DailyLogs.find {}, {sort:$scope.getReactively('sort')}
  $scope.projects = $scope.$meteorCollection () ->
    Projects.find { $and: [{"deleted":0},{"member":Meteor.userId()}]}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLogs', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.dailyLogsCount = $scope.$meteorObject Counts, 'numberOfDailyLogs', false
    $scope.$meteorSubscribe('projects')

  $meteor.session 'dailyLogsCounter'
  .bind $scope, 'page'

  console.log($rootScope.currentUser._id)
  console.log($rootScope.currentUser.emails[0].address)

  $scope.set=(name)->
    $scope.pname=name
    console.log($scope.pname)
  $scope.addRow=()->
    $scope.Times.push({pname:$scope.newDailyLog.name,Timetaken:$scope.newDailyLog.Timetaken,description:$scope.newDailyLog.Description,deleted:0,done:false,user:$rootScope.currentUser.emails[0].address,createdDate:new Date()})
    $scope.newDailyLog = undefined

  $scope.save = () ->
    $scope.newDailyLog=$scope.Times
    console.log($scope.Times+"this is times")
    $scope.dailyLogs.save $scope.newDailyLog
    $scope.newDailyLog = undefined
    $scope.Times= undefined
    $scope.Times=[]
        
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name: parseInt($scope.orderProperty)