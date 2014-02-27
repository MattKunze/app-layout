do (
  React = require 'react'
) ->

  { div } = React.DOM

  Drawer = React.createClass

    render: ->
      openClass = if @props.open
        " #{@props.mode}-#{@props.direction}"
      else
        ''

      div className: 'drawer-container' + openClass,
        div className: 'drawer-content',
          div className: 'title', 'Drawer'
          @props.drawerContent
        div className: 'drawer-body',
          @props.children

  module.exports = Drawer

