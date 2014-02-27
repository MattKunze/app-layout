do (
  _ = require 'lodash'
  ipsum = require 'lorem-ipsum'
  headroom = require 'headroom.js'
  React = require 'react/addons'
  LeftDrawer = require './leftdrawer'
  RightDrawer = require './rightdrawer'
  Header = require './header'
  SubHeader = require './subheader'
  Column = require './column'
) ->

  { div } = React.DOM
  classSet = React.addons.classSet

  UI = React.createClass
    displayName: 'UI'

    getInitialState: ->
      width = document.body.clientWidth
      defaultMode = switch
        when width <= 768 then 'float'
        when width <= 1028 then 'shunt'
        else 'shrink'

      columns: 2
      compactHeader: false
      leftMode: defaultMode
      leftOpen: true
      rightMode: defaultMode
      rightOpen: false

    setColumns: (count) ->
      @setState columns: Math.max 1, count

    setCompact: (compact) ->
      @setState compactHeader: compact

    fakeContent: (options) ->
      options or= {}
      ipsum
        count: options.count or 1
        units: options.units or 'paragraphs'

    scrollTop: (cb) ->
      @_scrollTo 0, 100, cb

    toggleLeftOpen: (explicit) ->
      newOpen = if explicit? then explicit else not @state.leftOpen
      @setState leftOpen: newOpen

    toggleLeftMode: (mode) ->
      @setState leftMode: mode

    toggleRightOpen: (explicit) ->
      newOpen = if explicit? then explicit else not @state.rightOpen

      # need to be at the top of the page to open the right drawer
      if newOpen
        @scrollTop =>
          @setState rightOpen: newOpen
      else
        @setState rightOpen: newOpen

    toggleRightMode: (mode) ->
      @setState rightMode: mode

    componentDidMount: ->
      headroom = new Headroom (@getDOMNode().querySelector '.ui'),
        offset: 50
      headroom.init()

      window.addEventListener 'scroll', @_onScroll

    componentWillUnmount: ->
      window.removeEventListener 'scroll', @_onScroll

    render: ->
      LeftDrawer
        mode: @state.leftMode
        open: @state.leftOpen
        toggleOpen: @toggleLeftOpen
        toggleMode: @toggleLeftMode
        fakeContent: @fakeContent
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
            leftOpen: @state.leftOpen
            toggleLeftOpen: @toggleLeftOpen

          RightDrawer
            mode: @state.rightMode
            open: @state.rightOpen
            toggleOpen: @toggleRightOpen
            toggleMode: @toggleRightMode
            fakeContent: @fakeContent
          ,
            SubHeader
              compactHeader: @state.compactHeader
              scrollTop: @scrollTop
              rightOpen: @state.rightOpen
              toggleRightOpen: @toggleRightOpen

            div className: 'column-container',
              for index in [0...@state.columns]
                Column
                  key: index
                  title: "Column #{index + 1}"
                  fakeContent: @fakeContent

    _onScroll: ->
      # hide right drawer when scrolling body content down
      hr = Headroom.prototype
      if hr.getScrollY() > 0 and hr.getDocumentHeight() > hr.getViewportHeight()
        @toggleRightOpen false

    _scrollTo: (to, duration, cb) ->
      return unless duration > 0

      hr = Headroom.prototype
      difference = to - hr.getScrollY()
      perTick = difference / duration * 10

      setTimeout ( =>
        window.scrollBy 0, perTick
        if hr.getScrollY() > to
          @_scrollTo to, duration - 10, cb
        else
          cb()
      ), 10

  module.exports = UI

