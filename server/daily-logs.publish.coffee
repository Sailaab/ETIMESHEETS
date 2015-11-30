'use strict'

Meteor.publish 'dailyLogs', (options, searchString,searchpro) ->
  where =
     $and: [{  
      'user':
        '$regex': '.*' + (searchString or '') + '.*'
        '$options': 'i'
        },
      {'pname':
        '$regex': '.*' + (searchpro or '') + '.*'
        '$options': 'i' 
        }]     
    'deleted': 0   
  console.log (searchString+"from the publish search")
  console.log (searchpro+"from the publish searchpro")  
       
    
  Counts.publish this, 'numberOfDailyLogs', DailyLogs.find({deleted:0}), noReady: true
  DailyLogs.find where, options