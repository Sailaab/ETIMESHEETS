'use strict'
angular.module('etimesheetApp').controller 'ResetCtrlbyadmin',  ['$scope', '$meteor', '$state', '$stateParams',($scope, $meteor, $state,$stateParams) ->
    console.log("this is it")
    $scope.credentials = email: ''
    $scope.error = ''
    $scope.users = $scope.$meteorCollection () ->
      Meteor.users.find {'_id':$stateParams.userId}
    $scope.email=$scope.users[0].emails[0].address
    console.log($scope.email)

    $scope.resetpsw = () ->
       console.log($stateParams.userId)
       Meteor.call('resetpsw', $stateParams.userId,$scope.newPlaintextPassword)
       console.log("successfromcontroller")
       
]
