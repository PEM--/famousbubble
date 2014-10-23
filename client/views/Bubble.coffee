class @Bubble
  constructor: ->
    radius = famous.math.Random.integer 20, 60
    @shape = new famous.core.Surface
      size: [radius * 2, radius * 2]
      classes: ['bubble-bluebubble']
      properties: borderRadius: CSSC.x radius
    @body = new famous.physics.bodies.Circle
      radius: radius
      mass: 120 / radius
    @mod = new famous.core.Modifier
      origin: [.5, .5]
      align: [.5, .5]
