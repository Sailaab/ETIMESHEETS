'use strict'

angular.module('etimesheetApp').controller 'MainCtrl',( $scope,$meteor, $state, $mdToast)  ->
  
  

  $scope.credentials =
    email: ''
    password: ''
  $scope.error = ''

  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {}
      
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
        if($scope.currentUser.emails[0].verified==true && $scope.currentUser.profile[0].deleted==0 && $scope.currentUser.profile[0].adminverify==1 && $scope.currentUser.profile[0].isActive==1)
          $state.go 'employee'  
          console.log("comesh here")
        else
          $state.go('not-verified',{userId: Meteor.userId()})
          console.log("goes here")
    ), (err) ->
      $scope.error = 'Login error - ' + err
            
  
   
  $scope.email= ''
  $scope.password=''
  $scope.error = ''
  $scope.profile=[
    fname:'',
    mname:'',
    lname:'',
    contact:'',
    address:'',   
    deleted: 0 ,
    isActive: 1,
  ]

  $scope.register = () ->
    if($scope.password==$scope.repassword)
      Meteor.call('createUserr',$scope.email, $scope.password, $scope.profile)
    else
      console.log("not match")  
      $mdToast.show($mdToast.simple().content('Password doesnt match'))
