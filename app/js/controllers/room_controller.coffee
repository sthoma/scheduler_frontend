'use strict'

angular.module 'tandemApp'

  .controller 'RoomController', ($scope, Room) ->
    $scope.title = "Rooms"

    $scope.rooms = Room.getRooms()
    $scope.addRoom = ->
      if $scope.newRoom
        newRoom =
          name: $scope.newRoom.name
          calendarUrl: $scope.newRoom.calendarUrl

        Room.addRoom(newRoom).$promise.then ->
          # TODO: add success message
          $scope.rooms.push newRoom
          $scope.newRoom = {}

        .catch ->
          $scope.rooms.push newRoom
          # TODO: Error message

    $scope.deleteRoom = (index) ->
      x = window.confirm('Are you sure you want to delete this room?')
      if x
        room = $scope.rooms[index]
        roomId = id: room._id

        Room.deleteRoom(roomId).$promise.then ->
          # TODO: add success message
          $scope.rooms.pop room
        .catch ->
          # TODO: Error message
