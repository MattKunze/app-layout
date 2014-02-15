do (
  _ = require 'lodash'
  ipsum = require 'lorem-ipsum'
  headroom = require 'headroom.js'
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
      compactHeader: false

    setColumns: (count) ->
      @setState columns: Math.max 1, count

    setCompact: (compact) ->
      @setState compactHeader: compact

    fakeContent: (options) ->
      options or= {}
      ipsum
        count: options.count or 1
        units: options.units or 'paragraphs'

    scrollTop: ->
      window.scrollTo 0

    render: ->
      div {},
        Header
          columns: @state.columns
          compactHeader: @state.compactHeader
          setColumns: @setColumns
        SubHeader
          compactHeader: @state.compactHeader
          setCompact: @setCompact
          scrollTop: @scrollTop

        div className: 'column-container',
          for index in [0...@state.columns]
            Column
              key: index
              title: "Column #{index + 1}"
              fakeContent: @fakeContent

  module.exports = UI

