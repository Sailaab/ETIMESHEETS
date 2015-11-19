'use strict'

angular.module 'etimesheetApp'
.controller 'leaveCtrl', ($scope, $meteor,$mdToast) ->
  #$scope.myDate= new Date()
  $scope.page = 1
  $scope.perPage = 3  
  $scope.dataOwner=Meteor.userId()    
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.leaveRequests = $scope.$meteorCollection () ->
    LeaveRequests.find {"deleted":0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequests', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    },{owner:$scope.dataOwner}, $scope.getReactively('search')).then () ->
      $scope.leaveRequestsCount = $scope.$meteorObject Counts, 'numberOfLeaveRequests', false

  $meteor.session 'leaveRequestsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newLeaveRequest.verified="Not-Approved"
    $scope.newLeaveRequest.askDate=new Date()
    $scope.newLeaveRequest.owner=Meteor.userId()
    $scope.newLeaveRequest.startDate= $scope.startDate
    $scope.newLeaveRequest.endDate= $scope.endDate
    $scope.newLeaveRequest.user= $scope.currentUser.emails[0].address
    $scope.newLeaveRequest.deleted=0
    $scope.leaveRequests.save $scope.newLeaveRequest
    $scope.newLeaveRequest = undefined
    $mdToast.show($mdToast.simple().content('Leave Request sent'))    
  $scope.remove = (leaveRequestid) ->
    Meteor.call('leaveDelbyuser', leaveRequestid)
    console.log("comes to controller")
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}