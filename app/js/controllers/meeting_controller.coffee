'use strict'

angular.module 'tandemApp'

.controller 'MeetingController', ($scope, Meeting, Attendee) ->
  $scope.meeting = {}
  $scope.meeting.attendees = []
  $scope.meeting.schedule =
    days:
      monday:
        day_code: 'M',
        morning: 'available',
        afternoon: 'available',
        evening: 'unavailable'
      tuesday:
        day_code: 'T',
        morning: 'available',
        afternoon: 'unavailable',
        evening: 'unavailable'
      wednesday:
        day_code: 'W',
        morning: 'available',
        afternoon: 'available',
        evening: 'unavailable'
      thursday:
        day_code: 'Th',
        morning: 'unavailable',
        afternoon: 'available',
        evening: 'unavailable'
      friday:
        day_code: 'F',
        morning: 'available',
        afternoon: 'available',
        evening: 'available'

  Meeting.addMeeting().$promise.then (meeting) ->
    $scope.meeting.id = meeting._id

  $scope.addAttendee = ->
    if $scope.newEmail
      email =
        meeting_id: $scope.meeting.id,
        email: $scope.newEmail

      Attendee.addAttendee(email).$promise.then (attendee) ->
        #$scope.meeting.attendees.push attendee
        $scope.meeting.attendees.push email
        $scope.newEmail = ''
      .catch ->
        # TODO: Add failure alert

  $scope.deleteAttendee = (index) ->
    confirm = window
      .confirm('Are you sure you want to delete this attendee?')
    if confirm
      delObject =
        meeting_id: $scope.meeting.id
        email: $scope.meeting.attendees[index].email

      Attendee.deleteAttendee(delObject).$promise.then ->
        # TODO: add success message
        console.log 'hereee'
        $scope.meeting.attendees.splice(index, 1)
      .catch ->
        console.log 'err'
        # TODO: Error message

  $scope.populateCalendar = ->

.directive 'selectable', ->
  TOGGLE_CLASS = 'selected'
  items = []

  restrict: 'A',
  link: selectLink

  addElement = (elem) ->
    if items.indexOf(elem) == -1
      items.push(elem)

  rmElement = (elem) ->
    idx = items.indexOf(elem)
    if idx != -1
      list.splice idx, 1

  setActive = (elem) ->
    if !elem.hasClass 'unavailable'
      angular.forEach items, (el) ->
        el.removeClass TOGGLE_CLASS
      elem.addClass TOGGLE_CLASS

  selectLink = (scope, elem) ->
    onClick = ->
      setActive elem

    onDestroy = ->
      rmElement elem

    addElement elem
    elem.on 'click', onClick
    scope.$on '$destroy', onDestroy
