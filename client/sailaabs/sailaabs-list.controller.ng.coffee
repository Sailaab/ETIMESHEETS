'use strict'

angular.module 'etimesheetApp'
.controller 'SailaabsListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.sailaabs = $scope.$meteorCollection () ->
    Sailaabs.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('sailaabs', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.sailaabsCount = $scope.$meteorObject Counts, 'numberOfSailaabs', false

  $meteor.session 'sailaabsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newSailaab.deleted = 0
      $scope.sailaabs.save $scope.newSailaab
      $scope.newSailaab = undefined
      
  $scope.remove = (sailaab) ->
    $scope.sailaabs.remove sailaab
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
