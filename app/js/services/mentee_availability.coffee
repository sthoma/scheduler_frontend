'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Mentee
 # @description
 # # Mentee
 # Factory for interacting with Mentees.
###
angular.module('tandemApp')
  .factory 'MenteeAvailability', ($resource, CONST) ->
    return $resource CONST.API_URL+'mentees/:id',
        {id: '@_id'},
        {
          'getMentees': {method: 'GET',  isArray: true},
          'getMentee': {method: 'GET'},
          'addMentee': {method: 'POST'},
          'updateMentee': {method: 'POST'},
          'deleteMentee': {method: 'DELETE'}
        }
