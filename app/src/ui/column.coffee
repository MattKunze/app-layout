do (
  _ = require 'lodash'
  React = require 'react'
) ->

  { div, span, button, p } = React.DOM

  Column = React.createClass
    displayName: 'Column'

    getInitialState: ->
      pinned: false
      size: 1
      content: []

    togglePinned: ->
      @setState pinned: not @state.pinned

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
      div { className: 'column' + if @state.pinned then ' pinned' else '' },
        div className: 'column-inner',
          div className: 'btn-group',
            button
              className: 'btn btn-default' + if @state.pinned then ' active' else ''
              onClick: @togglePinned
            ,
              span className: 'glyphicon glyphicon-pushpin'
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

