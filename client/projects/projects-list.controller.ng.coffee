'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectsListCtrl', ($scope, $meteor, $state, $mdToast) ->
  $scope.member=[]
  $scope.page = 1
  $scope.perPage = 5
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  


  $scope.projects = $scope.$meteorCollection () ->
    Projects.find {"deleted":0}, {sort:$scope.getReactively('sort')}
  console.log($scope.projects)  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
  
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('projects', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.projectsCount = $scope.$meteorObject Counts, 'numberOfProjects', false
    $meteor.subscribe('users')

  $meteor.session 'projectsCounter'
  .bind $scope, 'page'

  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false
  
  $scope.exists=(users,list)->
    return list.indexOf(users) > -1

  $scope.toggle =  (users, list)->
    $scope.idx = list.indexOf(users)
    if($scope.idx > -1)
     list.splice($scope.idx, 1)
    else
     list.push(users)
    
  $scope.save = () ->
    $scope.newProject.deleted=0
    $scope.newProject.isActive=1
    $scope.newProject.member=$scope.member
    console.log($scope.member)
    $scope.projects.save $scope.newProject
    $scope.newProject = undefined 
    document.getElementById("form").reset()
    $scope.member=[]
    $scope.idx=0 
    $mdToast.show($mdToast.simple().content('Project Saved Sucessfully'))
  

  $scope.remove = (projectId) ->
    Meteor.call('projectDelete', projectId)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}

  $scope.update=(project)->
    $scope.projects.update project    
