'use strict'

angular.module('tandemApp')
  .factory 'Email', ($resource, apiUrl) ->
    return $resource apiUrl+'sendMeetingInvite',
        {id: '@_id'},
        {
          'sendMeetingInvite': {method: 'POST'},
        }
