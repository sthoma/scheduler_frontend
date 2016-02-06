'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Room
 # @description
 # # Room
 # Factory for interacting with Rooms.
###
angular.module('tandemApp')
  .factory 'Room', ($resource, CONST) ->
    return $resource CONST.API_URL+'rooms/:id',
        {id: '@_id'},
        {
          'getRooms': {method: 'GET',  isArray: true},
          'getRoom': {method: 'GET'},
          'addRoom': {method: 'POST'},
          'updateRoom': {method: 'POST'},
          'deleteRoom': {method: 'DELETE'}
        }
