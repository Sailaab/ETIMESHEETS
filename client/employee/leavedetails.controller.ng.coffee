'use strict'

angular.module 'etimesheetApp'
.controller 'leavedetailsCtrl', ($scope,$stateParams, $meteor, $state) ->
  $scope.leaveRequest = $scope.$meteorObject LeaveRequests, $stateParams.leaveRequestId
  $scope.$meteorSubscribe('leaveRequests')
  console.log("this is it")
  console.log($scope.leaveRequest.name)
  