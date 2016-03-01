'use strict'

angular.module 'tandemApp', [
  'ngRoute'
  'ngResource'
  'ngAnimate'
  'ui.bootstrap'
  'satellizer'
  'oitozero.ngSweetAlert'
  'inform'
  'inform-exception'
  'inform-http-exception'
  'angular-jwt'
]
.constant "CONST",
  "API_URL": "http://localhost:3000/api/v1/"

.config ($routeProvider) ->
  $routeProvider
    .when "/",
      templateUrl: "./views/make-meeting.html",
      controller: "MeetingController"
    .when "/login",
      templateUrl: "./views/login.html",
      controller: "LoginController"
    .when "/logout",
      template: "",
      controller: "LogoutController"
    .otherwise
      redirectTo: '/'

.config ($locationProvider) ->
  # Enable pretty urls (without '/#')
  $locationProvider.html5Mode(true)

.config ($authProvider, CONST) ->
  # Satelizer Settings
  $authProvider.storageType = 'localStorage'

  # Auth Providers
  $authProvider.google
    url: CONST.API_URL + "login"
    optionalUrlParams: ['access_type']
    accessType: "offline"
    scope: [
      'profile'
      'email'
      'https://www.googleapis.com/auth/calendar'
    ]
    clientId: '249264490300-27p809lag3hg5jhhnaufog8m25i2afhm'+
    '.apps.googleusercontent.com'

.run ($auth, $location) ->
  # Punt from pageload if no auth present
  if !$auth.isAuthenticated()
    $location.url('/login')
