do (
  _ = require 'lodash'
  React = require 'react'
  Drawer = require './drawer'
  DrawerSettings = require './drawersettings'
  Column = require './column'
) ->

  { div, span, a } = React.DOM

  LeftDrawer = React.createClass
    render: ->
      Drawer
        className: 'left-drawer'
        direction: 'left'
        mode: @props.mode
        open: @props.open
        title: Title toggleOpen: @props.toggleOpen
        drawerContent: @transferPropsTo Content {}
      ,
        @props.children

  Title = React.createClass
    render: ->
      div {},
        span {}, 'Left Side'
        a
          className: 'btn btn-link pull-right'
          onClick: _.bind @props.toggleOpen, @, false
        ,
          span className: 'glyphicon glyphicon-th-large'

  Content = React.createClass

    render: ->
      div className: 'scrollable',
        DrawerSettings
          mode: @props.mode
          toggleMode: @props.toggleMode

        Column
          title: 'Blah blah'
          disablePin: true
          fakeContent: @props.fakeContent

  module.exports = LeftDrawer

