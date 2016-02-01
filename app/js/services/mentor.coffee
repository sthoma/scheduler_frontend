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
    return $resource CONST.API_URL+'mentors/:id',
        {id: '@_id'},
        {
          'getMentors': {method: 'GET',  isArray: true},
          'getMentor': {method: 'GET'},
          'addMentor': {method: 'POST'},
          'updateMentor': {method: 'POST'},
          'deleteMentor': {method: 'DELETE'}
        }

