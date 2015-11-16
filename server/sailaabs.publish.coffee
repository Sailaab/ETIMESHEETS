'use strict'

Meteor.publish 'sailaabs', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfSailaabs', Sailaabs.find({deleted:0}), noReady: true
  Sailaabs.find where, options