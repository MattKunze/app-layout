do (
  React = require 'react'
) ->

  { div, h4, form, label, input } = React.DOM

  Header = React.createClass
    displayName: 'Header'

    render: ->
      classes = React.addons.classSet
        'header': true
        compact: @props.compactHeader

      div className: classes,
        form className: 'form-inline pull-right',
          div className: 'form-group',
            label {}, 'Columns'
          div className: 'form-group',
            input
              type: 'number'
              className: 'form-control'
              value: @props.columns
              onChange: @_setColumns

        h4 className: 'title', 'This is the header'

    _setColumns: (ev) ->
      @props.setColumns parseInt ev.target.value

  module.exports = Header
