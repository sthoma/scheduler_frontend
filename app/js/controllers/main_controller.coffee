'use strict'

angular.module 'tandemApp'

.controller 'MainController', ($scope, $rootScope) ->
  $rootScope.bodyLayout = ''
  $scope.hello = "Hello World!"
