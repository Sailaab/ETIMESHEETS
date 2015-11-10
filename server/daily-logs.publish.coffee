'use strict'

Meteor.publish 'dailyLogs', (options, searchString) ->
  where =
    'pname':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDailyLogs', DailyLogs.find(where), noReady: true
  DailyLogs.find where, options