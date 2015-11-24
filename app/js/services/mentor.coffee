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
  	#This will be more fleshed out when backend API is defined for mentors
    return $resource CONST.API_URL+'mentors/:mentor_id',
      mentor_id: '@id'
