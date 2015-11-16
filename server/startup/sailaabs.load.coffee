Meteor.startup ->
  if Sailaabs.find().count() == 0
    sailaabs = [
      {
        'name': 'sailaab 1'
      }
      {
        'name': 'sailaab 2'
      }
    ]
    sailaabs.forEach (sailaab) ->
      Sailaabs.insert sailaab