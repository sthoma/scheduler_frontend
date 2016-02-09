'use strict'

angular.module 'tandemApp'

  .controller 'MenteeAvailabilityController', ($scope, MenteeAvailability) ->
    $scope.title = "Mentees"

    $scope.mentees = MenteeAvailability.getMentees()
    $scope.addMentee = ->
      if $scope.newMentee
        newMentee =
          name: $scope.newMentee.name
          calendarUrl: $scope.newMentee.calendarUrl

        MenteeAvailability.addMentee(newMentee).$promise.then (resMentee) ->
          # TODO: add success message
          $scope.mentees.push resMentee
          $scope.newMentee = {}

        .catch ->
          # TODO: Error message

    $scope.deleteMentee = (index) ->
      confirm = window
        .confirm('Are you sure you want to delete this mentee calendar?')
      if confirm
        mentee = $scope.mentees[index]
        menteeId = id: mentee._id

        MenteeAvailability.deleteMentee(menteeId).$promise.then ->
          # TODO: add success message
          $scope.mentees.pop mentee
        .catch ->
          # TODO: Error message
