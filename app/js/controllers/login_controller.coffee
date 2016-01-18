'use strict'

angular.module 'tandemApp'

.controller 'LoginController', ($scope, Login) ->
  $scope.title = "Login"

  $scope.login = ->
    if $scope.login
      newLogin =
        login: $scope.login.email
        password: $scope.login.password

      Login.save(newLogin).$promise.then ->
        # TODO: Flash success
        # TODO: Store cookie
        $scope.login = {}
      .catch ->
        $scope.login = {}
        # TODO: Flash failure
