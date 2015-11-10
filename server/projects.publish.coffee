'use strict'

Meteor.publish 'projects', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfProjects', Projects.find({deleted:0}), noReady: true
  Projects.find where, options
  
 