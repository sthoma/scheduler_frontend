'use strict'

###*
# @ngdoc controller
# @name tandemApp.controller:LogoutController
# @description
# # logout
# Controller for logging out of the Tandem frontend app.
###
angular.module 'tandemApp'

.controller 'LogoutController', ($location, AuthToken, Session) ->
  Session.logout()
  AuthToken.setToken()
  $location.url('login')
