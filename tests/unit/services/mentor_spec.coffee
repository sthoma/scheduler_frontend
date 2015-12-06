'use strict'

describe 'Service: Mentor', ->

  # load the controller's module
  beforeEach module 'tandemApp'

  Mentor = {}


  # Build Mock for API call before each test
  beforeEach inject ($injector, _CONST_) ->
    $httpBackend = $injector.get('$httpBackend')
    Mentor = $injector.get('Mentor')
    API_URL = _CONST_.API_URL

    # mock data for return
    mentors = [
      {
        name: "Mentor 1"
        email: "mentor@example.com"
        expertise: "Mentor Expertise"
      },
      {
        name: "Mentor 2"
        email: "mentor2@example.com"
        expertise: "Mentor Expertise 2"
      }
    ]

    #inject the mock data into the get call
    $httpBackend.whenGET(API_URL + 'mentors')
      .respond(mentors)


  # Flush the http Backend after each test
  afterEach inject ($injector) ->
    $injector.get('$httpBackend').flush()


  it 'should be able to retrieve mentors', ->
    Mentor.query().$promise.then (data)->
      expect(data[0].name).toEqual "Mentor 1"
      expect(data.length).toBe 2

