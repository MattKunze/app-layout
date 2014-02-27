do (
  _ = require 'lodash'
  React = require 'react'
  Drawer = require './drawer'
  DrawerSettings = require './drawersettings'
) ->

  { div, span, a } = React.DOM

  RightDrawer = React.createClass
    render: ->
      Drawer
        className: 'right-drawer'
        direction: 'right'
        mode: @props.mode
        open: @props.open
        drawerContent: DrawerContent
          mode: @props.mode
          toggleOpen: @props.toggleOpen
          toggleMode: @props.toggleMode
      ,
        @props.children

  DrawerContent = React.createClass

    render: ->
      div className: 'right-content',
        div className: 'title',
          a
            className: 'btn btn-link pull-left'
            onClick: _.bind @props.toggleOpen, @, false
          ,
            span className: 'glyphicon glyphicon-search'
          span {}, 'Right Side'
        DrawerSettings
          mode: @props.mode
          toggleMode: @props.toggleMode

  module.exports = RightDrawer

