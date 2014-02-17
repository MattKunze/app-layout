do (
  React = require 'react/addons'
  headroom = require 'headroom.js'
) ->

  { div, span, a } = React.DOM

  SubHeader = React.createClass
    displayName: 'SubHeader'

    componentDidMount: ->
      headroom = new Headroom @getDOMNode(),
        offset: 50
        tolerance: 10000
        onPin: =>
          @props.setCompact false
        onUnpin: =>
          @props.setCompact true
      headroom.init()

    render: ->
      div className: 'sub-header',
        div className: 'top-menu',
          a onClick: @props.scrollTop,
            span className: 'glyphicon glyphicon-star-empty'

        span className: 'title', 'This is the subheader'


  module.exports = SubHeader

