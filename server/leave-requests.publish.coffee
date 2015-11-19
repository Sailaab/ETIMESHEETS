'use strict'

Meteor.publish 'leaveRequests', (options,od, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'owner':od.owner
    'deleted':0
  Counts.publish this, 'numberOfLeaveRequests', LeaveRequests.find({deleted:0,'owner':od.owner}), noReady: true
  LeaveRequests.find where, options 


Meteor.publish 'leaveRequestsadmin', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'verified': "Not-Approved"
  Counts.publish this, 'numberOfLeaveRequests', LeaveRequests.find({verified:"Not-Approved"}), noReady: true
  LeaveRequests.find where, options   