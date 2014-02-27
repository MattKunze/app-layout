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

      div className: @props.className + ' drawer-container' + openClass,
        div className: 'drawer-content',
          div className: 'drawer-title',
            @props.title
          @props.drawerContent
        div className: 'drawer-body',
          @props.children

  module.exports = Drawer

