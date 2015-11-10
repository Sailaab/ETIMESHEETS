@DailyLogs = new Mongo.Collection('dailyLogs')

DailyLogs.allow
  insert: (userId, dailyLog) ->
    userId
  update: (userId, dailyLog, fields, modifier) ->
    userId
  remove: (userId, dailyLog) ->
    userId
