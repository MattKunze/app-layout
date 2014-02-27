do (
  _ = require 'lodash'
  React = require 'react'
) ->

  { div, a } = React.DOM
  { classSet } = React.addons

  DrawerSettings = React.createClass
    render: ->
      div className: 'settings btn-group btn-group-justified',
        for mode in [ 'Shrink', 'Shunt', 'Float' ]
          a
            key: mode
            className: classSet
              'btn btn-default': true
              active: mode.toLowerCase() is @props.mode
            onClick: _.bind @props.toggleMode, @, mode.toLowerCase()
          , mode

  module.exports = DrawerSettings

