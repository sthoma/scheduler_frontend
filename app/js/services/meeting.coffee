'use strict'

angular.module('tandemApp')
  .factory 'Meeting', ($resource, apiUrl) ->
    #This will be more fleshed out when backend API is defined
    return $resource apiUrl+'meetings/:id',
        {id: '@_id'},
        {
          'getMeetings': {method: 'GET',  isArray: true},
          'getMeeting': {method: 'GET'},
          'addMeeting': {method: 'POST'},
          'updateMeeting': {method: 'POST'},
          'deleteMeeting': {method: 'DELETE'}
        }

