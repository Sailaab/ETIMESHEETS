@Tests = new Mongo.Collection('tests')

Tests.allow
  insert: (userId, test) ->
    true
  update: (userId, test, fields, modifier) ->
    true
  remove: (userId, test) ->
    true
