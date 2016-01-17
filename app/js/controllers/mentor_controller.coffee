'use strict'

angular.module 'tandemApp'

.controller 'MentorController', ($scope, Mentor) ->
  $scope.title = "Mentors"

  $scope.mentors = Mentor.getMentors()

  $scope.addMentor = ->
    if $scope.newMentor
      #create duplicate object for adding to list
      newMentor =
        name: $scope.newMentor.name
        email: $scope.newMentor.email
        expertise: $scope.newMentor.expertise

      # Add Mentor via restful route
      Mentor.addMentor(newMentor).$promise.then ->
        # TODO: Add Success Message
        $scope.mentors.push newMentor
        $scope.newMentor = {}
      .catch ->
        # TODO: Add Failure Message
