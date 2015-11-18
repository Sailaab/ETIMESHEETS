'use strict'
angular.module('etimesheetApp')
.controller 'ManageEmployeeEditCtrl', ($scope, $meteor, $state, $stateParams, $mdToast) ->
  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}

  $scope.departments = $scope.$meteorCollection () ->
    Departments.find {'deleted':'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('departments', {
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      limit: parseInt($scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.departmentsCount = $scope.$meteorObject Counts, 'numberOfDepartments', false

  $scope.designations = $scope.$meteorCollection () ->
    Designations.find {'deleted':'0'}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designations', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.designationsCount = $scope.$meteorObject Counts, 'numberOfDesignations', false      

  $scope.email=$scope.user[0].emails[0].address
  console.log($scope.email)
  $scope.address=$scope.user[0].profile[0].address
  $scope.fname=$scope.user[0].profile[0].fname
  $scope.mname=$scope.user[0].profile[0].mname
  $scope.lname=$scope.user[0].profile[0].lname
  $scope.contact=$scope.user[0].profile[0].contact
  $scope.secondaryemail=$scope.user[0].profile[0].secondaryemail
  $scope.department=$scope.user[0].profile[0].department
  $scope.designation=$scope.user[0].profile[0].designation
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')


  $scope.save = () ->
    console.log($stateParams.userId,$scope.email)
    Meteor.call('update', $stateParams.userId, $scope.email, $scope.address, $scope.fname, $scope.mname, $scope.lname, $scope.contact, $scope.secondaryemail,$scope.department, $scope.designation)
    $state.go('manageemployee')  
    $mdToast.show($mdToast.simple().content('Datas Saved'));