class @Dragger
  RADIUS: 30
  constructor: ->
    @shape = new famous.core.Surface
      size: [2 * @RADIUS, 2 * @RADIUS]
      properties:
        border: '2px solid #FF4136'
        borderRadius: "#{2 * @RADIUS}px"
        backgroundColor: 'rgba(255, 255, 255, 0.5)'
    @body = new famous.physics.bodies.Circle
      radius: @RADIUS
      mass: 5
    @position = [0, 0]
    @state = new famous.core.Modifier
      origin: [.5, .5]
      transform: =>
        famous.core.Transform.translate @position[0], @position[1], 0
