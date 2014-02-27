do (
  _ = require 'lodash'
  React = require 'react'
) ->

  { div, span, h4, form, label, input, a } = React.DOM

  Header = React.createClass
    displayName: 'Header'

    render: ->
      div className: 'header',
        form className: 'form-inline pull-right',
          div className: 'form-group',
            label {}, 'Columns'
          div className: 'form-group',
            input
              type: 'number'
              className: 'form-control'
              value: @props.columns
              onChange: @_setColumns

        a
          className: 'btn btn-link pull-left'
          onClick: _.bind @props.toggleLeftOpen, @, null
        ,
          span className: 'glyphicon glyphicon-th-large'

        h4 className: 'title', 'This is the header'

    _setColumns: (ev) ->
      @props.setColumns parseInt ev.target.value

  module.exports = Header
