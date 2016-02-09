'use strict'

angular.module 'tandemApp'

  .controller 'MentorAvailabilityController', ($scope, Mentor) ->
    $scope.title = "Mentors"

    $scope.mentors = Mentor.getMentors()
    $scope.addMentor = ->
      if $scope.newMentor
        newMentor =
          name: $scope.newMentor.name
          calendarUrl: $scope.newMentor.calendarUrl

        Mentor.addMentor(newMentor).$promise.then (resMentor) ->
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

        Mentor.deleteMentor(mentorId).$promise.then ->
          # TODO: add success message
          $scope.mentors.pop mentor
        .catch ->
          # TODO: Error message
