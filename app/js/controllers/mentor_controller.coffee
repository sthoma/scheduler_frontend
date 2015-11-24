'use strict'

angular.module 'tandemApp'

.controller 'MentorController', [
    '$scope',
    ($scope) ->
      $scope.title = "Mentors"

      #This is a mock for getting mentors from a db
      $scope.mentors = [{
          email: "dude@duders.com"
          expertise: "expert in duding"
          name: "dude"
        },
        {
          email: "dudette@duders.com"
          expertise: "expert in dudettes"
          name: "dudette"
        }
        ]

      $scope.addMentor = ->
        if $scope.newMentor
          newMentor =
            name: $scope.newMentor.name
            email: $scope.newMentor.email
            expertise: $scope.newMentor.expertise
            
          $scope.mentors.push newMentor
        #This is a mock for writing to our mongodb
  ]
