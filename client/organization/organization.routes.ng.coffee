'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'organization-list',
    url: '/manageorganization'
    templateUrl: 'client/organization/organization-list.view.html'
    controller: 'OrganizationListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    

  .state 'organization-detail',
    url: '/organization/:organizationId'
    templateUrl: 'client/organization/organization-detail.view.html'
    controller: 'OrganizationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    
