Meteor.startup ->
  if Meteor.users.find().count() == 0
    # users = [
    #  {
    #     "_id" : "BhwRmjwMgsr7FtSSX",
    #     "services" : {
    #             "password" : {
    #                     "bcrypt" : "$2a$10$2HzzdQ95mtz/zP6q0PctdeRrwFfPMQyUM1ptaGsbZcpX5jCTph6mu"
    #             },
                
    #             "email" : {
    #                     "verificationTokens" : [ ]
    #             }
    #     },
    #     "emails" : [
    #             {
    #                     "address" : "ghostrider_sailaab@yahoo.com",
    #                     "verified" : true
    #             }
    #     ],
    #     "profile" : [
    #             {
    #                     "fname" : "Sailaab",
    #                     "mname" : "",
    #                     "lname" : "Tilwani",
    #                     "contact" : "98489999999",
    #                     "address" : "Hattiban",
    #                     "deleted" : 1,
    #                     "secondaryemail" : "ghostrider_sailaab@yahoo.com"
    #                     "role":"admin"
    #             }
    #     ]
    #   }
    # ]
    Accounts.createUser({
        email: 'ghostrider_sailaab@yahoo.com'
        password: '1234'
        "profile" : [
                {
                        "fname" : "Sailaab",
                        "mname" : "",
                        "lname" : "Tilwani",
                        "contact" : "98489999999",
                        "address" : "Hattiban",
                        "deleted" : 1,
                        "secondaryemail" : "ghostrider_sailaab@yahoo.com"
                        "role":"admin"
                }
        ]
          })

    users.forEach (user) ->
      Meteor.users.insert user