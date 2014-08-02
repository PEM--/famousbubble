class @Bubble
  constructor: ->
    radius = famous.math.Random.integer 20, 60
    @shape = new famous.core.Surface
      size: [radius * 2, radius * 2]
      classes: ['bubble-bluebubble']
      properties: borderRadius: "#{radius}px"
    @body = new famous.physics.bodies.Circle radius: radius, mass: radius / 10
    @state = new famous.core.Modifier origin: [.5, .5]
