@Sailaabs = new Mongo.Collection('sailaabs')

Sailaabs.allow
  insert: (userId, sailaab) ->
    true
  update: (userId, sailaab, fields, modifier) ->
    true
  remove: (userId, sailaab) ->
    true
