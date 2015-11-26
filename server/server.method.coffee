Meteor.methods
  # chkEmailVerify:(userId,emailToVerify) ->
  #   userId=Accounts.sendVerificationEmail(userId,emailToVerify)
  #   console.log ("comes to method"+emailToVerify)
  #   console.log ("comes to method"+userId)

  resetpsw:(userId, newPlaintextPassword) ->
    Accounts.setPassword(userId, newPlaintextPassword)  