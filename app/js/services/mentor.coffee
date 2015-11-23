'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Mentor
 # @description
 # # Mentor
 # Factory for Mentor retrieval
###
angular.module('tandemApp')
  .factory 'Mentor', ($resource, CONST) ->
    return $resource CONST.API_URL+'mentors/:projectId',
      mentorId: '@id'
