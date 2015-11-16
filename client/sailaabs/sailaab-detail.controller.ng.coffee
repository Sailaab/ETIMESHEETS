'use strict'

angular.module 'etimesheetApp'
.controller 'SailaabDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.sailaab = $scope.$meteorObject Sailaabs, $stateParams.sailaabId
  $scope.$meteorSubscribe('sailaabs')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.sailaab.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.sailaab.reset()
