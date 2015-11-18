'use strict'

angular.module 'etimesheetApp'
.controller 'ManageEmployeeCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {"profile.fname" : 1}
  $scope.orderProperty = '1'
    
  $scope.viewName = 'ManageEmployee'

  $scope.users = $scope.$meteorCollection ()->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}

  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.usersCount = $scope.$meteorObject Counts, 'numberOfUsers', false

  $meteor.session 'usersCounter'
  .bind $scope, 'page'    
      
  # $meteor.autorun $scope, () ->
  #   $meteor.subscribe('users')
    

  $scope.remove = (user) ->
    Meteor.call('remove', user)