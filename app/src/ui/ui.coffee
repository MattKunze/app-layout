do (
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

    render: ->
      div {},
        Header
          columns: @state.columns
          setColumns: @setColumns
        SubHeader {}

        div className: 'column-container',
          for index in [1..@state.columns]
            Column key: index, "Column #{index}"

  module.exports = UI
