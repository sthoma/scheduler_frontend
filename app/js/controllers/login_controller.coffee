'use strict'

###*
# @ngdoc controller
# @name tandemApp.controller:LoginController
# @description
# # login
# Controller for logging into the Tandem frontend app.
###
angular.module 'tandemApp'

.controller 'LoginController',
  ($scope, $rootScope, $uibModal, Session, AuthToken) ->

    # use angular-ui-bootstrap to open the modal
    modalInstance = $uibModal.open
      animation: true
      templateUrl: "views/login.html"
      size: "md"
      scope: $scope
      backdrop: "static"
    $rootScope.bodyLayout = 'login'
    $scope.title = "Login"

    $scope.sendCredentials = (form) ->
      if form.cred
        credentials =
          username: form.cred.email
          password: form.cred.password
        Session.login(credentials).catch ->
          form.cred.password = ''
          $scope.loginError = true
