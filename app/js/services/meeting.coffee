'use strict'

angular.module('tandemApp')
  .factory 'Meeting', ($resource, CONST) ->
    #This will be more fleshed out when backend API is defined
    return $resource CONST.API_URL+'meetings/:id',
        {id: '@_id'},
        {
          'getMeetings': {method: 'GET',  isArray: true},
          'getMeeting': {method: 'GET'},
          'addMeeting': {method: 'POST'},
          'updateMeeting': {method: 'POST'},
          'deleteMeeting': {method: 'DELETE'}
        }

