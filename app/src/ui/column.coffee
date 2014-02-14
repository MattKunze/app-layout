do (
  _ = require 'lodash'
  React = require 'react'
) ->

  { div, span, button, p } = React.DOM

  Column = React.createClass
    displayName: 'Column'

    getInitialState: ->
      size: 1
      content: []

    changeSize: (delta) ->
      newSize = Math.max 1, @state.size + delta
      content = for index in [0...newSize]
        @state.content[index] or @props.fakeContent()
      @setState
        size: newSize
        content: content

    componentWillMount: ->
      # generate initial content
      @setState content: [ @props.fakeContent() ]

    render: ->
      div className: 'column',
        div className: 'column-inner',
          div className: 'btn-group',
            button className: 'btn disabled', @props.title
            button
              className: 'btn btn-default'
              onClick: _.bind @changeSize, @, 1
            ,
              span className: 'glyphicon glyphicon-plus'
            button
              className: 'btn btn-default'
              onClick: _.bind @changeSize, @, -1
            ,
              span className: 'glyphicon glyphicon-minus'

          for paragraph, index in @state.content
            p key: index, className: 'blokk', paragraph

  module.exports = Column

