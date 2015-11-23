'use strict'

angular.module 'tandemApp'

.controller 'MentorController', [
    '$scope',
    ($scope) ->
      $scope.title = "Mentors"

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
          $scope.mentors.push $scope.newMentor
        console.log $scope.mentors
  ]
