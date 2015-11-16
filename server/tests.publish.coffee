'use strict'

Meteor.publish 'tests', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfTests', Tests.find(where), noReady: true
  Tests.find where, options