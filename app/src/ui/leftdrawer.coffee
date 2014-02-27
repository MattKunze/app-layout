do (
  _ = require 'lodash'
  React = require 'react'
  Drawer = require './drawer'
  DrawerSettings = require './drawersettings'
) ->

  { div, span, a } = React.DOM

  LeftDrawer = React.createClass
    render: ->
      Drawer
        className: 'left-drawer'
        direction: 'left'
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
      div className: 'left-content',
        div className: 'title',
          span {}, 'Left Side'
          a
            className: 'btn btn-link pull-right'
            onClick: _.bind @props.toggleOpen, @, false
          ,
            span className: 'glyphicon glyphicon-th-large'
        DrawerSettings
          mode: @props.mode
          toggleMode: @props.toggleMode

  module.exports = LeftDrawer

