'use strict'

angular.module 'etimesheetApp'
.controller 'TestDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.test = $scope.$meteorObject Tests, $stateParams.testId
  $scope.$meteorSubscribe('tests')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.test.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.test.reset()
