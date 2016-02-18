'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Mentor
 # @description
 # # Mentor
 # Factory for interacting with Mentors.
###
angular.module('tandemApp')
  .factory 'SubmitAvailability', ($resource, CONST) ->
    return $resource CONST.API_URL+'submissions/:id',
        {id: '@_id'},
        {
          'submit': {method: 'POST'}
        }
