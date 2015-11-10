'use strict'
angular.module('etimesheetApp')
.controller 'ManageEmployeeEditCtrl', ($scope, $meteor, $state, $stateParams, $mdToast) ->
  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  $scope.email=$scope.user[0].emails[0].address
  console.log($scope.email)
  $scope.address=$scope.user[0].profile[0].address
  $scope.fname=$scope.user[0].profile[0].fname
  $scope.mname=$scope.user[0].profile[0].mname
  $scope.lname=$scope.user[0].profile[0].lname
  $scope.contact=$scope.user[0].profile[0].contact
  $scope.secondaryemail=$scope.user[0].profile[0].secondaryemail
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')


  $scope.save = () ->
    console.log($stateParams.userId,$scope.email)
    Meteor.call('update', $stateParams.userId, $scope.email, $scope.address, $scope.fname, $scope.mname, $scope.lname, $scope.contact, $scope.secondaryemail)
    $state.go('manageemployee')  
    $mdToast.show($mdToast.simple().content('Datas Saved'));