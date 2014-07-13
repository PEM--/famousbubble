class @Bubble
  constructor: ->
    radius = famous.math.Random.integer 20, 60
    @shape = new famous.core.Surface
      size: [radius * 2, radius * 2]
      properties:
        backgroundColor: '#7FDBFF'
        border: '3px solid #0074D9'
        borderRadius: "#{radius}px"
    @body = new famous.physics.bodies.Circle radius: radius, mass: 2
    @state = new famous.core.Modifier origin: [.5, .5]
