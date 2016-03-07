'use strict'

angular.module('tandemApp')
  .factory 'Email', ($resource, CONST) ->
    return $resource CONST.API_URL+'sendMeetingInvite',
        {id: '@_id'},
        {
          'sendMeetingInvite': {method: 'POST'},
        }
