'use strict'

###*
# @ngdoc service
# @name tandemApp.service:authIntercepter
# @description
# # authentication
# Factory in the Tandem frontend app.
###
angular.module('tandemApp')
  .factory 'authIntercepter', ($q, $location, AuthToken) ->

    # Intercept Request to add authentication token to header
    request: (config) ->
      config.headers = config.headers || {}
      authToken = AuthToken.getToken()
      if authToken then config.headers.Authorization = 'Bearer ' + authToken
      config

    # Error Handler
    responseError: (rejection) ->
      if rejection.status == 401
        console.log("Response Error 401", rejection)
        $location.url('login') # TODO: Return to previous page

      # Manually return rejected promise
      $q.reject(rejection)
