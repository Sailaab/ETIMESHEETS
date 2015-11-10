@Products = new Mongo.Collection('products')

Products.allow
  insert: (userId, product) ->
    true
  update: (userId, product, fields, modifier) ->
    true
  remove: (userId, product) ->
    true
