do (
  React = require 'react'
) ->

  { div } = React.DOM

  SubHeader = React.createClass
    displayName: 'SubHeader'

    render: ->
      div className: 'sub-header',
        'This is the subheader'

  module.exports = SubHeader

