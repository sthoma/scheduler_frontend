'use strict'

angular.module 'tandemApp'

  .controller 'MentorAvailabilityController', ($scope, MentorAvailability) ->
    $scope.title = "Mentors"

    $scope.mentors = MentorAvailability.getMentors()
    $scope.addMentor = ->
      if $scope.newMentor
        newMentor =
          name: $scope.newMentor.name
          calendarUrl: $scope.newMentor.calendarUrl

        MentorAvailability.addMentor(newMentor).$promise.then (resMentor) ->
          # TODO: add success message
          $scope.mentors.push resMentor
          $scope.newMentor = {}

        .catch ->
          # TODO: Error message

    $scope.deleteMentor = (index) ->
      confirm = window
        .confirm('Are you sure you want to delete this mentor calendar?')
      if confirm
        mentor = $scope.mentors[index]
        mentorId = id: mentor._id

        MentorAvailability.deleteMentor(mentorId).$promise.then ->
          # TODO: add success message
          $scope.mentors.pop mentor
        .catch ->
          # TODO: Error message
