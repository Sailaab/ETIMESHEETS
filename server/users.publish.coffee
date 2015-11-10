Meteor.publish 'users', ->
  users = Meteor.users.find {}, fields:
    emails: 1
    profile: 1
    isActive: 1
  users