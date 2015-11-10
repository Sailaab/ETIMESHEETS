'use strict'

angular.module 'etimesheetApp'
.filter 'myFilter', ->
  (input) ->
    'myFilter filter: ' + input
