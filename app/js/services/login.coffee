'use strict'

###*
 # @ngdoc function
 # @name tandemApp.service:Login
 # @description
 # # Login
 # Factory for authentication
###
angular.module('tandemApp')
  .factory 'Login', ($resource, CONST) ->
    return $resource CONST.API_URL+'login'
