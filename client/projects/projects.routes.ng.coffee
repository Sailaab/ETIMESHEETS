'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'projects-list',
    url: '/projects'
    templateUrl: 'client/projects/projects-list.view.html'
    controller: 'ProjectsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ] 
  .state 'project-detail',
    url: '/projects/:projectId'
    templateUrl: 'client/projects/project-detail.view.html'
    controller: 'ProjectDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ] 