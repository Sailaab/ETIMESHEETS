angular.module('etimesheetApp').controller 'RegisterCtrl', [
  '$scope'
  '$meteor'
  '$state'

  ( $scope,$meteor, $state) ->
   
   
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
    ]
    
    $scope.user = $scope.$meteorCollection () ->
      Meteor.users.find {}


    $scope.register = () ->
      if($scope.password==$scope.repassword)
        console.log("correct")
        Accounts.createUser({email:$scope.email, password:$scope.password, profile:$scope.profile}, (error)->
            if(error)
              console.log(error)
            else
              console.log('success')
              $scope.verificationState = $scope.user[0].emails[0].verified
              console.log('verified state')
              $scope.emailToVerify = $scope.user[0].emails[0].address
              if($scope.verificationState==false)
                Meteor.call('chkEmailVerify',Meteor.userId(),$scope.emailToVerify)
                $state.go('not-verified',{userId: Meteor.userId()})
              else
                $state.go('main')
          )
      else
        console.log("not match")  
        alert("pasword doesnt match")
   ]