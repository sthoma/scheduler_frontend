'use strict'

angular.module 'tandemApp'

  .controller 'SubmitAvailabilityController',
  ($scope, SubmitAvailability, MentorAvailability, MenteeAvailability, Room) ->
    $scope.title = "Submit Availability Calendars"

    $scope.mentors = MentorAvailability.getMentors()
    $scope.mentees = MenteeAvailability.getMentees()
    $scope.rooms   = Room.getRooms()

    $scope.submit = ->
      schedules =
        rooms: $scope.rooms
        mentors: $scope.mentors
        mentees: $scope.mentees
      SubmitAvailability.submit(schedules).$promise.then (resSubmit) ->
        $scope.disableButton = true
        $scope.flash = "You schedule has been submitted successfully," +
          "we should have your combined schedule back in a couple of days"
      .catch ->
        # TODO: Error message
