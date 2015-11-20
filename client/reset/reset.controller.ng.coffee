'use strict'
angular.module('etimesheetApp').controller 'ResetCtrl',($scope, $meteor, $state) ->
    
    $scope.email= ''
    $scope.error = ''
    console.log("HELLO")
    # console.log($scope.credentials.email)
    $scope.resetpsw = () ->
      console.log($scope.email)

      Accounts.forgotPassword({email:$scope.email}, (error)->
        if(error)
          console.log("this is erreorrrr")
          console.log(error+"this is error")
        else
          console.log('success')
          console.log($scope.email)
          $state.go 'main'
          
     )
    