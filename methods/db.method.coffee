'use strict'

Meteor.methods
  deldailylog:(dailylogid)->
    DailyLogs.update(dailylogid,{$set:'deleted':1})
    console.log("comes to method")
    
  leaveVerify:(leaveRequestid)->
    LeaveRequests.update(leaveRequestid,{$set:{'verified':"Approved"}})
    console.log("comes to the method")

  leaveCancel:(leaveRequestid)->
    LeaveRequests.update(leaveRequestid,{$set:{'verified':"Cancelled"}})
    console.log("comes to the method")

  leaveDelbyuser:(leaveRequestid)->
    LeaveRequests.update(leaveRequestid,{$set:{'deleted':1}})
    console.log("comes to the method")  
      
  remove: (user) ->
    Meteor.users.update({ _id: user },{$set:{"profile.0.deleted":1}})
    console.log("comes here to the method")

  projectDelete:(project) ->
    Projects.update(project,{$set:{'deleted':1}})

  updatedesig:(designationId) ->
    Designations.update(designationId,{$set:{'deleted':1}})

  departmentDelete:(departmentId) ->
    Departments.update(departmentId,{$set:{'deleted':1}})  

  organizationDelete:(organizationId) ->
    Organizations.update(organizationId,{$set:{'deleted':1}})

  sailaabDelete:(sailaabId) ->
    Sailaabs.update(sailaabId,{$set:{'deleted':1}})

  update:(user,email, address, fname, mname, lname, contact, secondaryemail,department,designation) ->
    Meteor.users.update({ _id: user },{$set:{"emails.0.address":email}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.fname":fname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mname":mname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.lname":lname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.address":address}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.contact":contact}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.secondaryemail":secondaryemail}}) 
    Meteor.users.update({ _id: user },{$set:{"profile.0.department":department}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.designation":designation}})
