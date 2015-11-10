'use strict'

angular.module 'etimesheetApp'
.directive 'myDirective', ->
  restrict: 'EA'
  templateUrl: 'client/components/myDirective/my-directive.view.html'
  replace: true
  link: (scope, elem, attrs) ->
    scope.property = 'myDirective'
