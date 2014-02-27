do (
  _ = require 'lodash'
  ipsum = require 'lorem-ipsum'
  headroom = require 'headroom.js'
  React = require 'react/addons'
  Drawer = require './drawer'
  DrawerSettings = require './drawersettings'
  Header = require './header'
  SubHeader = require './subheader'
  Column = require './column'
) ->

  { div } = React.DOM
  classSet = React.addons.classSet

  UI = React.createClass
    displayName: 'UI'

    getInitialState: ->
      columns: 2
      compactHeader: false
      leftMode: 'shrink'
      leftOpen: true

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
      @_scrollTo document.documentElement, 0, 100

    toggleLeftOpen: (explicit) ->
      newOpen = if explicit? then explicit else not @state.leftOpen
      console.warn "left open: #{newOpen}"
      @setState leftOpen: newOpen

    toggleLeftMode: (mode) ->
      @setState leftMode: mode

    componentDidMount: ->
      headroom = new Headroom (@getDOMNode().querySelector '.ui'),
        offset: 50
        tolerance: 10000
      headroom.init()

    render: ->
      Drawer
        direction: 'left'
        mode: @state.leftMode
        open: @state.leftOpen
        drawerContent: DrawerSettings
          mode: @state.leftMode
          toggleMode: @toggleLeftMode
      ,
        div
          className: classSet
            ui: true
            compact: @state.compactHeader
        ,
          Header
            columns: @state.columns
            compactHeader: @state.compactHeader
            setColumns: @setColumns
            toggleLeftOpen: @toggleLeftOpen
          SubHeader
            compactHeader: @state.compactHeader
            scrollTop: @scrollTop

          div className: 'column-container',
            for index in [0...@state.columns]
              Column
                key: index
                title: "Column #{index + 1}"
                fakeContent: @fakeContent

    _scrollTo: (element, to, duration) ->
      return unless duration > 0

      difference = to - element.scrollTop
      perTick = difference / duration * 10

      setTimeout ( =>
        element.scrollTop = element.scrollTop + perTick
        if element.scrollTop > to
          @_scrollTo element, to, duration - 10
      ), 10

  module.exports = UI

