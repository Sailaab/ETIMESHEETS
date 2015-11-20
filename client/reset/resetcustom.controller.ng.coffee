'use strict'
angular.module('etimesheetApp').controller 'resetcustomCtrl',($scope, $meteor, $state, $stateParams) ->
  
  $scope.resetpsw = () ->
    Meteor.call('resetPassword',$stateParams.resetToken,$scope.password)
 