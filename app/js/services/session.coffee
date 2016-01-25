'use strict'

###*
 # @ngdoc service
 # @name tandemApp.service:Login
 # @description
 # # Session
 # Factory for authentication
###
angular.module('tandemApp')
  .factory 'Session', ($http, $location, AuthToken, CONST) ->
    onSuccess = (res) ->
      AuthToken.setToken(res.data.token)
      $location.url '/'

    onFailure = (error) ->
      AuthToken.setToken()
      $location.url 'login'

    {
      login: (creds) ->
        $http.post(CONST.API_URL + 'login', creds).then onSuccess, onFailure
      logout: ->
        $http.get CONST.API_URL + 'logout'
    }


