'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Mentor
 # @description
 # # Mentor
 # Factory for interacting with Mentors.
###
angular.module('tandemApp')
  .factory 'Mentor', ($resource, CONST) ->
    return $resource CONST.API_URL+'mentors/:id',
        {id: '@_id'},
        {
          'getMentors': {method: 'GET',  isArray: true},
          'getMentor': {method: 'GET'},
          'addMentor': {method: 'POST'},
          'updateMentor': {method: 'POST'},
          'deleteMentor': {method: 'DELETE'}
        }
