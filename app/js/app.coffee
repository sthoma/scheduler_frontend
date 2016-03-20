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
  'angulartics'
  'angulartics.mixpanel'
]

.config ($routeProvider) ->
  $routeProvider
    .when "/",
      templateUrl: "./views/make-meeting.html",
      controller: "MeetingController"
    .when "/success",
      templateUrl: "./views/success.html",
      controller: ""
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

.config ($analyticsProvider) ->
  $analyticsProvider.firstPageview(true)
  $analyticsProvider.withAutoBase(true)

.config ($authProvider, apiUrl, googleConfig) ->
  # Satelizer Settings
  $authProvider.storageType = 'localStorage'

  # Auth Providers
  $authProvider.google
    url: apiUrl + "login"
    optionalUrlParams: ['access_type']
    accessType: "offline"
    scope: [
      'profile'
      'email'
      'https://www.googleapis.com/auth/calendar'
    ]
    clientId: googleConfig.clientId

.run ($auth, $location) ->
  # Punt from pageload if no auth present
  if !$auth.isAuthenticated()
    $location.url('/login')
