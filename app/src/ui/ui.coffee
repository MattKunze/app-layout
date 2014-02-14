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

    setColumns: (count) ->
      @setState columns: Math.max 1, count

    fakeContent: (options) ->
      options or= {}
      ipsum
        count: options.count or 1
        units: options.units or 'paragraphs'

    render: ->
      div {},
        Header
          columns: @state.columns
          setColumns: @setColumns
        SubHeader {}

        div className: 'column-container',
          for index in [0...@state.columns]
            Column
              key: index
              title: "Column #{index + 1}"
              fakeContent: @fakeContent

  module.exports = UI
