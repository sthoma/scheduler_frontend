'use strict'

angular.module 'tandemApp'

.controller 'MeetingController',
($scope, $location, Meeting, Attendee, inform, SweetAlert) ->
  $scope.meeting = {}
  $scope.meeting.attendees = []
  $scope.meeting.schedule = [
      day_code: 'm',
      morning: true,
      afternoon: true,
      evening: true
    ,
      day_code: 't',
      morning: true,
      afternoon: true,
      evening: true
    ,
      day_code: 'w',
      morning: true,
      afternoon: true,
      evening: true
    ,
      day_code: 'th',
      morning: true,
      afternoon: true,
      evening: true
    ,
      day_code: 'f',
      morning: true,
      afternoon: true,
      evening: true
  ]

  Meeting.addMeeting().$promise.then (meeting) ->
    $scope.meeting.id = meeting._id

  $scope.addAttendee = ->
    duplicate = $scope.meeting.attendees.some (elem) ->
      elem.email == $scope.newEmail

    if $scope.newEmail and not duplicate
      email =
        meeting_id: $scope.meeting.id,
        email: $scope.newEmail

      Attendee.addAttendee(email).$promise.then (res) ->
        isTandemUser = false
        name = ''

        for attendee in res.tandem_users
          if attendee.email == $scope.newEmail
            name = attendee.name
            isTandemUser = true

        newAttendee =
          name: name,
          email: $scope.newEmail,
          isTandemUser: isTandemUser
        $scope.meeting.attendees.push newAttendee
        $scope.meeting.schedule = res.schedule

        $scope.newEmail = ''
      .catch ->
        inform.add("Unable to add email address", {type: "danger"})

  $scope.deleteAttendee = (index) ->
    SweetAlert.swal {
      title: "Are you sure?"
      text: "This will remove this person from your meeting"
      type: "warning"
      showCancelButton: true
      confirmButtonColor: "rgba(217, 83, 79, 0.7)"
      confirmButtonText: "Remove "+$scope.meeting.attendees[index].email
      closeOnConfirm: true
    }, (confirm)->
      if confirm
        delObject =
          meeting_id: $scope.meeting.id
          email: $scope.meeting.attendees[index].email

        Attendee.deleteAttendee(delObject).$promise.then (res) ->
          $scope.meeting.attendees.splice(index, 1)
          $scope.meeting.schedule = res.schedule

        .catch ->
          console.log 'err'
          inform.add("Unable to remove email address", {type: "danger"})

  $scope.submitMeeting = ->
    validateMeetingForm = (meeting) ->
      validDetails = true
      for detail of meeting.details
        if detail.length == 0
          validDetails = false

      if !validDetails
        false
      else if meeting.attendees.length == 0
        false
      else if meeting.timeSelection.length == 0
        false
      else
        true

    getDetails = ->
      details =
        what: document.getElementById("what").value
        location: document.getElementById("location").value
        duration: document.getElementById("duration").value
      $scope.meeting.details = details

    getTimeSelection = ->
      times = []
      times.push time.id for time in document.getElementsByClassName("selected")
      $scope.meeting.timeSelection = times

    getDetails()
    getTimeSelection()

    if validateMeetingForm($scope.meeting)
      console.log $scope.meeting
      Meeting.updateMeeting($scope.meeting).$promise.then ->
        console.log 'Meeting submitted'
        $location.path('/success')
      .catch ->
        console.log 'Submission error'
    else
      inform.add("You need to fill out all of the fields before your meeting \
                  can be scheduled.", {type: "danger"})
      console.log 'Form validation failed'
