'use strict'
angular.module 'etimesheetApp'
.controller 'LeaveControl', ($scope, $meteor) ->  
  
  $scope.leaveRequests = $scope.$meteorCollection () ->
    LeaveRequests.find {"verified":"Not-Approved"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequestsadmin', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.leaveRequestsCount = $scope.$meteorObject Counts, 'numberOfLeaveRequests', false

  $scope.verifyleave = (leaveRequestid) ->
    console.log('comes to controer of admin leave')
    Meteor.call('leaveVerify', leaveRequestid)

  $scope.cancelleave = (leaveRequestid) ->
    console.log('comes to controer of admin leave')
    Meteor.call('leaveCancel', leaveRequestid)  