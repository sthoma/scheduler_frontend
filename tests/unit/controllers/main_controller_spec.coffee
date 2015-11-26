'use strict'

describe 'Controller: MainController', ->

  # load the controller's module
  beforeEach module 'tandemApp'

  MainController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainController = $controller 'MainController',
      $scope: scope

  it 'should say hello', ->
    expect(scope.hello).toBe "Hello World!"
