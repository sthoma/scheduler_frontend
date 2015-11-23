'use strict'

angular.module 'tandemApp'

.controller 'MainController', [
    '$scope',
    ($scope) ->
      $scope.hello = "Hello World!"
  ]
