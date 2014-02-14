do (
  ipsum = require 'lorem-ipsum'
  React = require 'react'
  Header = require './header'
  SubHeader = require './subheader'
  Column = require './column'
) ->

  { div } = React.DOM

  UI = React.createClass
    displayName: 'UI'

    getInitialState: ->
      columns: 2
      fakeContent: []

    componentWillMount: ->
      # generate initial fake content
      @setColumns 2

    setColumns: (count) ->
      count = Math.max 1, count
      for index in [0...count]
        @state.fakeContent[index] or= @_fakeContent()
      @setState columns: count

    render: ->
      div {},
        Header
          columns: @state.columns
          setColumns: @setColumns
        SubHeader {}

        div className: 'column-container',
          for index in [0...@state.columns]
            Column key: index,
              @state.fakeContent[index]

    _fakeContent: ->
      ipsum
        count: 1
        units: 'paragraphs'

  module.exports = UI
