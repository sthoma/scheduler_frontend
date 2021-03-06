'use strict'

angular.module 'tandemApp', [
  'ngRoute'
  'ngResource'
  'ui.bootstrap'
]
.constant "CONST",
  "API_URL": "http://localhost:3000/api/v1/"

.config ($routeProvider) ->
  $routeProvider
    .when "/",
      templateUrl: "./views/make-meeting.html",
      controller: "MainController"
    .when "/login",
      templateUrl: "./views/blank.html",
      controller: "LoginController"
    .when "/logout",
      template: "",
      controller: "LogoutController"
    .otherwise
      redirectTo: '/'

.config ($locationProvider) ->
  # Enable pretty urls (without '/#')
  $locationProvider.html5Mode(true)

.config ($httpProvider) ->
  # Add authentication to requests
  $httpProvider.interceptors.push('authIntercepter')

.run (AuthToken, $location) ->
  # Punt from pageload if no auth present
  if !AuthToken.getToken()
    $location.url('login')
