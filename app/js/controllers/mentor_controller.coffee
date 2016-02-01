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

  $scope.setCurrentMentor = (index)->
    current = $scope.mentors[index]
    # console.log current
    $scope.currentMentor = {index: index}
    angular.forEach current, (value, key) ->
      $scope.currentMentor[key] = value

  $scope.saveMentor = ->
    if $scope.currentMentor
      # Build a list of updated values
      mentor = $scope.mentors[$scope.currentMentor.index]
      updatedValues = {}
      angular.forEach $scope.currentMentor, (value, key) ->
        if key != 'index'
          updatedValues[key] = $scope.currentMentor[key]

      # Update Mentor via restful route
      Mentor.updateMentor(updatedValues).$promise.then ->
        # TODO: add success message
        angular.forEach updatedValues, (value, key) ->
          if key != "_id"
            mentor[key] = updatedValues[key]
      .catch ->
        # TODO: Add failure message

  $scope.deleteMentor = (index) ->
    x = window.confirm('Are you sure you want to delete this mentor?')
    if x
      mentor = $scope.mentors[index]
      mentorId = id: mentor._id

      Mentor.deleteMentor(mentorId).$promise.then ->
        # TODO: add success message
        $scope.mentors.pop mentor
      .catch ->




      

        


