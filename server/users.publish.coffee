# Meteor.publish 'users', ->
  # users = Meteor.users.find {}, fields:
  #   emails: 1
  #   profile: 1
  #   isActive: 1
  # users


'use strict'

Meteor.publish 'users', (options, searchString) ->
  where =
    'profile':
      '$elemMatch':
        'fname':
          '$regex': '.*' + (searchString or '') + '.*'
          '$options': 'i'
        'deleted' : 0 
  Counts.publish this, 'numberOfUsers', Meteor.users.find({'profile.deleted':0}), noReady: true
  Meteor.users.find where, options