do (
  React = require 'react/addons'
  headroom = require 'headroom.js'
) ->

  { div, span, a } = React.DOM

  SubHeader = React.createClass
    displayName: 'SubHeader'

    componentDidMount: (rootNode) ->
      headroom = new Headroom rootNode,
        offset: 50
        tolerance: 10000
        onPin: =>
          @props.setCompact false
        onUnpin: =>
          @props.setCompact true
      headroom.init()

    render: ->
      classes = React.addons.classSet
        'sub-header': true
        compact: @props.compactHeader

      div className: classes,
        div className: 'top-menu',
          a onClick: @props.scrollTop,
            span className: 'glyphicon glyphicon-star-empty'

        span className: 'title', 'This is the subheader'


  module.exports = SubHeader

