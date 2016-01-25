'use strict'

describe 'Controller: LoginController', ->
  # load the controller's module
  beforeEach module 'tandemApp'

  controller = {}
  httpBackend = {}
  scope = {}

  beforeEach inject ($controller, $rootScope, $q, $httpBackend) ->
    scope = $rootScope
    httpBackend = $httpBackend
    controller = $controller


  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()


  describe 'should check credentials successfully', ->
    beforeEach ->
      httpBackend.expectPOST('http://localhost:3000/api/v1/login').respond(401, null);

      LoginController = controller 'LoginController',
        $scope: scope

    afterEach ->
      httpBackend.flush()

    it 'should flash error if given incorrect credentials', ->
      scope.cred =
        username: 'admin'
        password: 'swordfish'
      scope.sendCredentials()

      scope.$digest()

      expect(scope.loginError).toBe true
