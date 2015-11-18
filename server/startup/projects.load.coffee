Meteor.startup ->
  if Projects.find().count() == 0
    projects = [
     
    ]
    projects.forEach (project) ->
      Projects.insert project