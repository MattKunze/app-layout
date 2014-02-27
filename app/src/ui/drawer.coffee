do (
  React = require 'react'
) ->

  { div } = React.DOM

  Drawer = React.createClass

    componentDidMount: ->
      # prevent scroll event from propagating to parent - otherwise
      # overscroll within the drawer will scroll the body once the extent
      # is reached
      # bing - this doesn't work in most environments (IE, android, iOS)
      @_scrollable = @getDOMNode().querySelector '.scrollable'
      @_scrollable?.addEventListener 'mousewheel', @_onMouseWheel

    componentWillUnmount: ->
      @_scrollable?.removeEventListener 'mousewheel', @_onMouseWheel

    render: ->
      classes = [ @props.className, "drawer-#{@props.direction}" ]
      if @props.open
        classes.push "#{@props.mode}-#{@props.direction}"

      div { className: classes.join ' ' },
        div className: 'drawer-content',
          div className: 'drawer-title',
            @props.title
          @props.drawerContent
        div className: 'drawer-body',
          @props.children

    _onMouseWheel: (ev) ->
      if @_scrollable
        @_scrollable.scrollTop += ev.deltaY
        ev.preventDefault()

  module.exports = Drawer

