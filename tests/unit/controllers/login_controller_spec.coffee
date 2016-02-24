'use strict'

describe 'Controller: LoginController', ->
  # load the controller's module
  beforeEach module 'tandemApp'

  LoginController = {}
  scope = {}
  SessionMock = {}

  expectedResponse = {}

  beforeEach module ($provide)->
    $provide.value('Session', SessionMock)
    return

  beforeEach inject ($rootScope, $httpBackend) ->
    scope = $rootScope.$new()
    # needed because login templates are called using angular-ui-bootstrap
    $httpBackend.whenGET("views/login.html").respond("login");
    $httpBackend.expectGET("views/login.html")

  # describe 'should check invalid credentials', ->
  #   beforeEach inject ($controller, $q) ->

  #     # Mock call to add Mentor to server
  #     SessionMock.login = (credentials) ->
  #       deferred = $q.defer()
  #       deferred.reject({error:"error"})
  #       return deferred.promise

  #     LoginController = $controller 'LoginController',
  #       $scope: scope

  #   it 'should show login error', ->
  #     form = {}
  #     form.cred =
  #       username: 'admin'
  #       password: 'swordfish'
  #     scope.sendCredentials(form)

  #     scope.$digest()

  #     expect(scope.loginError).toBe true
