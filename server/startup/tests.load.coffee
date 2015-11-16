Meteor.startup ->
  if Tests.find().count() == 0
    tests = [
      {
        'name': 'test 1'
      }
      {
        'name': 'test 2'
      }
    ]
    tests.forEach (test) ->
      Tests.insert test