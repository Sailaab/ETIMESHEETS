'use strict'

angular.module 'etimesheetApp'
.controller 'ManageEmployeeCtrl', ($scope, $meteor) ->
  $scope.viewName = 'ManageEmployee'

  $scope.users = $scope.$meteorCollection ()->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
      
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
    # 'isActive':'1'

  $scope.remove = (user) ->
    Meteor.call('remove', user)