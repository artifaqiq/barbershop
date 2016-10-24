@Timer = React.createClass
  getInitialState: ->
    elapsed: 0
    start: Date.now()

  componentDidMount: ->
    @timer = setInterval(this.tick, 50);

  tick: ->
    @setState
      elapsed: ((Date.now() - @state.start) / 1000).toFixed(1)

  componentWillUnmount: ->
    clearInterval(@timer);

  render: ->
    React.DOM.div
      className: ""
      React.DOM.div
        className: 'btn btn-danger'
        style:
          width: 500
        "#{@state.elapsed} sec"


