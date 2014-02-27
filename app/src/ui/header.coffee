do (
  _ = require 'lodash'
  React = require 'react'
) ->

  { div, span, h4, a } = React.DOM

  Header = React.createClass
    displayName: 'Header'

    render: ->
      div className: 'header',
        div className: 'btn-group pull-right',
          a
            className: 'btn btn-default'
            onClick: _.bind @_setColumns, @, 1
          ,
            span className: 'glyphicon glyphicon-sort-by-attributes'
          a
            className: 'btn btn-default'
            onClick: _.bind @_setColumns, @, -1
          ,
            span className: 'glyphicon glyphicon-sort-by-attributes-alt'

        unless @props.leftOpen
          a
            className: 'btn btn-link pull-left'
            onClick: _.bind @props.toggleLeftOpen, @, null
          ,
            span className: 'glyphicon glyphicon-th-large'

        h4 className: 'title', 'This is the header'

    _setColumns: (delta) ->
      @props.setColumns @props.columns + delta

  module.exports = Header
