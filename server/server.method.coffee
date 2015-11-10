Meteor.methods
  chkEmailVerify:(userId,emailToVerify) ->
    Accounts.sendVerificationEmail(userId,emailToVerify)

  resetpsw:(userId, newPlaintextPassword) ->
    Accounts.setPassword(userId, newPlaintextPassword)  