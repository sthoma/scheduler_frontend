'use strict'

###*
# @ngdoc directive
# @name tandemApp.directive:selectable
# @description
# # login
# Directive for selectable elements.
###
angular.module 'tandemApp'

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
      items.splice idx, 1

  toggleActive = (elem) ->
    if elem.hasClass TOGGLE_CLASS
      elem.removeClass TOGGLE_CLASS

    else if !elem.hasClass 'unavailable'
      # Comment to allow selecting multiple times
      angular.forEach items, (el) ->
        el.removeClass TOGGLE_CLASS
      elem.addClass TOGGLE_CLASS

  selectLink = (scope, elem) ->
    onClick = ->
      toggleActive elem

    onDestroy = ->
      rmElement elem

    addElement elem
    elem.on 'click', onClick
    scope.$on '$destroy', onDestroy
