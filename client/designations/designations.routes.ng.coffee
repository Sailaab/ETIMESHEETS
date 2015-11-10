'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'designations-list',
    url: '/managedesignation'
    templateUrl: 'client/designations/designations-list.view.html'
    controller: 'DesignationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    
      
  .state 'designation-detail',
    url: '/designations/:designationId'
    templateUrl: 'client/designations/designation-detail.view.html'
    controller: 'DesignationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    
