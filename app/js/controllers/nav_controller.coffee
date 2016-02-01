'use strict'

angular.module 'tandemApp'

.controller 'NavController', ($scope, $location) ->
  $scope.isActive = (path)->
    if path == $location.path()
      return 'active'
    else
      return ''
