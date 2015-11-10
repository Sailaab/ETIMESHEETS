'use strict'
angular.module('etimesheetApp').controller 'ResetCtrl',($scope, $meteor, $state) ->
    
    $scope.credentials.email=''
    $scope.error = ''
    console.log("HELLO")
    # console.log($scope.credentials.email)
    $scope.resetpsw = () ->
      alert('gose here in func')
      Accounts.forgotPassword({email:$scope.credentials.email}, (error)->
        if(error)
          console.log(error+"this is error")
        else
          console.log('success')
          console.log($scope.credentials.email)
          $state.go 'main'
          
     )
    