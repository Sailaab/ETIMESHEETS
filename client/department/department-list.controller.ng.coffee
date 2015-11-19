'use strict'

angular.module 'etimesheetApp'
.controller 'DepartmentListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 5
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'
  
  $scope.departments = $scope.$meteorCollection () ->
    Departments.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('departments', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.departmentsCount = $scope.$meteorObject Counts, 'numberOfDepartments', false

  $meteor.session 'departmentsCounter'
  .bind $scope, 'page'
    
  $scope.save = () -> 
    $scope.newDepartment.deleted=0
    $scope.newDepartment.isActive=1
    $scope.departments.save $scope.newDepartment
    console.log("new dep"+$scope.newDepartment)
    $scope.newDepartment = undefined
      
  $scope.remove = (departmentId) ->
    Meteor.call('departmentDelete',departmentId)

  
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)} 
