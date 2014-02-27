do (
  _ = require 'lodash'
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

        unless @props.rightOpen
          a
            className: 'btn btn-link pull-right',
            onClick: _.bind @props.toggleRightOpen, @, null
          ,
            span className: 'glyphicon glyphicon-search'

        span className: 'title', 'This is the subheader'

  module.exports = SubHeader

