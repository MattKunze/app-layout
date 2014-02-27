do (
  _ = require 'lodash'
  React = require 'react'
  Drawer = require './drawer'
  DrawerSettings = require './drawersettings'
  Column = require './column'
) ->

  { div, span, a } = React.DOM

  RightDrawer = React.createClass
    render: ->
      Drawer
        className: 'right-drawer'
        direction: 'right'
        mode: @props.mode
        open: @props.open
        title: Title toggleOpen: @props.toggleOpen
        drawerContent: @transferPropsTo DrawerContent {}
      ,
        @props.children

  Title = React.createClass
    render: ->
      div {},
        a
          className: 'btn btn-link pull-left'
          onClick: _.bind @props.toggleOpen, @, false
        ,
          span className: 'glyphicon glyphicon-search'
        span {}, 'Right Side'

  DrawerContent = React.createClass
    render: ->
      div className: 'scrollable',
        DrawerSettings
          mode: @props.mode
          toggleMode: @props.toggleMode

        Column
          title: 'Search?'
          disablePin: true
          fakeContent: @props.fakeContent

  module.exports = RightDrawer

