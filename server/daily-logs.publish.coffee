'use strict'

Meteor.publish 'dailyLogs', (options, searchString) ->
  where =
    'pname':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted': 0  
    
  Counts.publish this, 'numberOfDailyLogs', DailyLogs.find({deleted:0}), noReady: true
  DailyLogs.find where, options