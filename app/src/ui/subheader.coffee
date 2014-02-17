do (
  React = require 'react/addons'
) ->

  { div, span, a } = React.DOM

  SubHeader = React.createClass
    displayName: 'SubHeader'

    render: ->
      div className: 'sub-header',
        div className: 'top-menu',
          a onClick: @props.scrollTop,
            span className: 'glyphicon glyphicon-star-empty'

        span className: 'title', 'This is the subheader'


  module.exports = SubHeader

