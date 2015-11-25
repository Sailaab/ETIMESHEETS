angular.module('etimesheetApp').controller 'RegisterCtrl', 
  ( $scope,$meteor, $state, $mdToast) ->
   
   
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
    
    $scope.user = $scope.$meteorCollection () ->
      Meteor.users.find {}


    $scope.register = () ->
      if($scope.password==$scope.repassword)
        console.log("correct")
        console.log("from controller"+$scope.email,$scope.password,$scope.profile)
        Meteor.call('createUserr',$scope.email, $scope.password, $scope.profile)
      else
        console.log("not match")  
        $mdToast.show($mdToast.simple().content('Password doesnt match'))
   