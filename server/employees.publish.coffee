'use strict'

Meteor.publish 'employees', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfEmployees', Employees.find(where), noReady: true
  Employees.find where, options