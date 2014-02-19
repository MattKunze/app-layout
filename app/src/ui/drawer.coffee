do (
  React = require 'react'
) ->

  { div } = React.DOM

  Drawer = React.createClass
    render: ->
      div className: 'drawer-container open',
        div className: 'drawer-content',
          @props.drawerContent
        div className: 'drawer-body',
          @props.children

  module.exports = Drawer

