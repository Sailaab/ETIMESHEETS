'use strict'

angular.module 'etimesheetApp'
.config ($mdThemingProvider) ->
  $mdThemingProvider.theme('default')
  .primaryPalette('deep-orange')
  .accentPalette('lime')
