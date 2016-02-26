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
