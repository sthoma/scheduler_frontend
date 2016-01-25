'use strict'

###*
# @ngdoc controller
# @name tandemApp.controller:LoginController
# @description
# # login
# Controller for logging into the Tandem frontend app.
###
angular.module 'tandemApp'

.controller 'LoginController', ($scope, $rootScope, Session, AuthToken) ->
  $rootScope.bodyLayout = 'login'
  $scope.title = "Login"

  $scope.sendCredentials = ->
    if $scope.cred
      credentials =
        username: $scope.cred.email
        password: $scope.cred.password

      Session.login(credentials).catch ->
        $scope.cred.password = ''
        $scope.loginError = true
