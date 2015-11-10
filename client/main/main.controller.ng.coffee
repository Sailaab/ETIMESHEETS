'use strict'

angular.module('etimesheetApp').controller 'MainCtrl', ['$scope', '$meteor', '$state', ($scope, $meteor, $state) ->
  
  

  $scope.credentials =
    email: ''
    password: ''
  $scope.error = ''


  $scope.user = $scope.$meteorCollection ()->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
      
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')


  $scope.login = ()->
    
    $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
      console.log($scope.currentUser.emails[0].address)    
      if($scope.currentUser.profile[0].role=="admin")
        console.log($scope.credentials.email,$scope.credentials.password)
        console.log("correct admin")
        $state.go 'admin'

      else 
        if($scope.currentUser.emails[0].verified==true && $scope.currentUser.profile[0].deleted==0)
          $state.go 'employee'  
          console.log("comesh here")
        else
          $state.go('not-verified',{userId: Meteor.userId()})
          console.log("goes here")
    ), (err) ->
      $scope.error = 'Login error - ' + err
]
            