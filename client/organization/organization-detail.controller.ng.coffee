'use strict'

angular.module 'etimesheetApp'
.controller 'OrganizationDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.organization = $scope.$meteorObject Organizations, $stateParams.organizationId
  $scope.$meteorSubscribe('organizations')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organization.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
      $state.go('organization-list')  
  $scope.reset = () ->
    $scope.organization.reset()
