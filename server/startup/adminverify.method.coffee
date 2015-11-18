'user strict'
Meteor.methods

Accounts.onCreateUser (options, user) ->
  if options.stopActivationLink
    user.emails[0].verified=true   
  user.profile=options.profile
  return user