'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'

  .state 'admin',
    url: '/admin'
    templateUrl: 'client/admin/admin.view.html'
    controller: 'AdminCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]        

  .state 'not-verified',  
    url: '/notverified/:userId'
    templateUrl: 'client/main/not-verified.view.html'
    controller: 'NotverifiedCtrl'     
  
  .state 'employee',
    url: '/employee'
    templateUrl: 'client/employee/employee.view.html'
    controller: 'EmployeeCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]    

  .state 'timesheet',
    url: '/timesheet'
    templateUrl: 'client/employee/timesheet.view.html'
    controller: 'TimesheetCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]       

  .state 'leave',
    url: '/leave'
    templateUrl: 'client/employee/leave.view.html'
    controller: 'leaveCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

   .state 'leavedetails',
    url: '/leave/:leaveRequestid'
    templateUrl: 'client/employee/leavedetails.view.html'
    controller: 'leavedetailsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ] 

     
         
  .state 'manageemployee',
    url: '/manageemployee'
    templateUrl: 'client/admin/manageemployee.view.html'
    controller: 'ManageEmployeeCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]       

  .state 'manageemployeeEdit',
    url: '/manageemployeeEdit/:userId'
    templateUrl: 'client/admin/manageemployeeEdit.view.html'
    controller: 'ManageEmployeeEditCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]      

  .state 'LeaveCtrls',
    url: '/viewleave'
    templateUrl: 'client/admin/leave.view.html'
    controller: 'LeaveControl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    

  .state 'TimesheetCtrls',
    url: '/viewtimesheet'
    templateUrl: 'client/admin/timesheet.view.html'
    controller: 'TimesheetControl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    

  .state 'logout',
    url: '/logout'
    resolve: 'logout': ['$meteor', '$state'
     ($meteor, $state) ->
      $meteor.logout().then (->
       $state.go 'main'
       return
      ), (err) ->
       console.log 'logout error - ', err
       return
     ]

  .state 'dashboard',
    url: '/dashboard'
    resolve:
      currentUser: ['$meteor','$state', ($meteor,$state) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return $state.go 'admin'
          if(user.emails[0].verified==true && user.profile[0].deleted==0)
           return $state.go 'employee'
         )
      ]    

  .state 'verify',
    url: '/verify-email/:verifyEmailToken'
    template: 'your mail is verified'
    controller:($stateParams, $meteor)->
      console.log($stateParams)
      console.log($stateParams.verifyEmailToken)
      Meteor.call('verifyEmail',$stateParams.verifyEmailToken)
  

    