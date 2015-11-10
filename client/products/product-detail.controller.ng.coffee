'use strict'

angular.module 'etimesheetApp'
.controller 'ProductDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.product = $scope.$meteorObject Products, $stateParams.productId
  $scope.$meteorSubscribe('products')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.product.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.product.reset()
