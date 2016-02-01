'use strict'

describe 'Controller: MentorController', ->

  # load the controller's module
  beforeEach module 'tandemApp'

  MentorController = {}
  scope = {}
  MentorMock = {}

  # Mock Mentor Service
  beforeEach module ($provide)->
    $provide.value('Mentor', MentorMock)
    return # null return needed for beforeEach module

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $q) ->
    scope = $rootScope.$new()

    # Mock stored mentors
    MentorMock.getMentors = ->
      return [
        name: "Saved Mentor Name"
        email: "savedmentor@example.com"
        expertise: "Saved Mentor Expertise"
      ]

    # Mock call to add Mentor to server
    MentorMock.addMentor = ->
      deferred = $q.defer()
      deferred.resolve('Success')
      return {
        $promise: deferred.promise
      }

    MentorMock.updateMentor = ->
      deferred = $q.defer()
      deferred.resolve('Success')
      return {
        $promise: deferred.promise
      }

    MentorController = $controller 'MentorController',
      $scope: scope


  it 'should be able to add a mentor', ->
    list_length = scope.mentors.length
    scope.newMentor =
      name: "Mentor Name"
      email: "mentor@example.com"
      expertise: "Mentor Expertise"
    scope.addMentor()

    # Ensure all promises complete
    scope.$digest()

    expect(scope.mentors.length).toBe list_length+1

  it 'should be able to edit a mentor', ->
    scope.currentMentor = scope.mentors[0]
    scope.currentMentor.index = 0
    scope.currentMentor.name = "Edited Mentor"
    scope.saveMentor()

    # Ensure all promises complete
    scope.$digest()

    expect(scope.mentors[0].name).toEqual "Edited Mentor"

