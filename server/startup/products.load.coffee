Meteor.startup ->
  if Products.find().count() == 0
    products = [
      {
        'name': 'product 1'
      }
      {
        'name': 'product 2'
      }
    ]
    products.forEach (product) ->
      Products.insert product