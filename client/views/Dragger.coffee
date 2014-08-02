class @Dragger
  RADIUS: 30
  constructor: ->
    @shape = new famous.core.Surface
      size: [2 * @RADIUS, 2 * @RADIUS]
      classes: ['bubble-dragger']
      properties: borderRadius: "#{2 * @RADIUS}px"
    @body = new famous.physics.bodies.Circle radius: @RADIUS, mass: @RADIUS / 10
    @position = [0, 0]
    @state = new famous.core.Modifier
      origin: [.5, .5]
      transform: =>
        famous.core.Transform.translate @position[0], @position[1], 0
