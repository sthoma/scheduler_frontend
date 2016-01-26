'use strict'

describe 'Controller: LoginController', ->
  # load the controller's module
  beforeEach module 'tandemApp'

  controller = {}
  scope = {}
  _mockSession = {}
  _mockPromise = {}

  expectedResponse = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope
    controller = $controller
    _mockSession = login: -> _mockPromise

  describe 'should check invalid credentials', ->
    beforeEach ->
      _mockPromise =
        catch: (errorFn) ->
          errorFn expectedResponse

        error: (fn) ->
          fn expectedResponse

      controller 'LoginController',
        $scope: scope
        Session: _mockSession

    it 'should show login error', ->
      scope.cred =
        username: 'admin'
        password: 'swordfish'
      scope.sendCredentials()

      scope.$digest()

      expect(scope.loginError).toBe true
