'use strict'

angular.module 'tandemApp', [
  'ngRoute'
  'ngResource'
]
.constant "CONST",
  "API_URL": "http://localhost:3000/api/v1/"

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
