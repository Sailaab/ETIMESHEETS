'use strict'

angular.module 'etimesheetApp'
.directive 'toolbar', ->
  restrict: 'AE'
  templateUrl: 'client/components/toolbar/toolbar.view.html'
  replace: true
