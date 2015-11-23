'use strict'

angular.module 'tandemApp', ['ngRoute']

.config [
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "./views/home.html",
        controller: "MainController"
      .otherwise
        redirectTo: '/'

]

