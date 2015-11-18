Meteor.publish 'users',(options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
      

  users = Meteor.users.find {}, fields:
    emails: 1
    profile: 1
    isActive: 1
  users