'use strict'

Meteor.publish 'departments', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDepartments', Departments.find({deleted:0}), noReady: true
  Departments.find where, options