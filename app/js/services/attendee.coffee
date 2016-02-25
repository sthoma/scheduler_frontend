'use strict'

angular.module('tandemApp')
  .factory 'Attendee', ($resource, CONST) ->
    return $resource CONST.API_URL+'attendees/:id',
        {id: '@_id'},
        {
          'getAttendees': {method: 'GET',  isArray: true},
          'getAttendee': {method: 'GET'},
          'addAttendee': {method: 'POST'},
          'updateAttendee': {method: 'POST'},
          'deleteAttendee': {method: 'DELETE'}
        }

