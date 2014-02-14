do (
  React = require 'react'
) ->

  { div } = React.DOM

  Column = React.createClass
    displayName: 'Column'

    render: ->
      div className: 'column',
        div className: 'column-inner',
          @props.children

  module.exports = Column

