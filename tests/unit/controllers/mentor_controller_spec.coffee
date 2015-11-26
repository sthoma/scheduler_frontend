'use strict'

describe 'Controller: MentorController', ->

  # load the controller's module
  beforeEach module 'tandemApp'

  MentorController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MentorController = $controller 'MentorController',
      $scope: scope

  it 'should be able to add a mentor', ->
    list_length = scope.mentors.length
    scope.newMentor =
      name: "Mentor Name"
      email: "mentor@example.com"
      expertise: "Mentor Expertise"
    scope.addMentor()
    expect(scope.mentors.length).toBe list_length+1
