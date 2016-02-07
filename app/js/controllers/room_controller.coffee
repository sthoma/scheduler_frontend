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

        Room.addRoom(newRoom).$promise.then (resRoom) ->
          # TODO: add success message
          $scope.rooms.push resRoom

          $scope.rooms.push newRoom
          # TODO: Error message

    $scope.deleteRoom = (index) ->
      confirm = window.confirm('Are you sure you want to delete this room?')
      if confirm
        room = $scope.rooms[index]
        roomId = id: room._id

        Room.deleteRoom(roomId).$promise.then ->
          # TODO: add success message
          $scope.rooms.pop room
        .catch ->
          # TODO: Error message
