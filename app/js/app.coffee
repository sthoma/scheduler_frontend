'use strict'

angular.module 'tandemApp', ['ngRoute']

.config [
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "./views/home.html",
        controller: "MainController"
      .when "/add-mentor",
        templateUrl: "./views/add-mentor.html",
        controller: "MentorController"
      .when "/add-team",
        templateUrl: "./views/home.html",
        controller: "MainController"
      .otherwise
        redirectTo: '/'

]

