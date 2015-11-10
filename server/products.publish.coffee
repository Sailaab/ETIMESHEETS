'use strict'

Meteor.publish 'products', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfProducts', Products.find(where), noReady: true
  Products.find where, options