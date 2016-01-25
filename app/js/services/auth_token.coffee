'use strict'

###*
# @ngdoc service
# @name tandemApp.service:AuthToken
# @description
# # AuthTokenFactory
# Factory in the Tandem frontend app.
###
angular.module('tandemApp')
  .factory 'AuthToken', ($window) ->
    localStore = $window.localStorage
    key = 'auth-token'

    getToken =  ->
      localStore.getItem(key)

    setToken = (token) ->
      if (token)
        localStore.setItem(key, token)
      else
        localStore.removeItem(key)

    { getToken: getToken, setToken: setToken }
