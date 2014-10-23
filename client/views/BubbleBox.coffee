class @BubbleBox extends famous.core.View
  DEFAULT_OPTIONS:
    numBodies: 5
    gravityStrength: 3
    gravityNormal: [0, -200]
    size: [400, 400]
    origin: [.5, .5]
    align: [.5, .5]
  constructor: (@options) ->
    @constructor.DEFAULT_OPTIONS = @DEFAULT_OPTIONS
    super @options
    surf = new famous.core.Surface
      size: @options.size
      classes: ['bubble-main-box']
    mod = new famous.core.Modifier
      origin: @options.origin
      align: @options.align
    (@add mod).add surf
    @gravity = new famous.physics.forces.Repulsion
      strength: @options.gravityStrength
      anchor: @options.gravityNormal
    @walls = new famous.physics.constraints.Walls
      sides: famous.physics.constraints.Walls.SIDES.TWO_DIMENSIONAL
      size: @options.size
      origin: @options.origin
      restitution: 1
      drift: 1
    @pe = new famous.physics.PhysicsEngine()
    @collision = new famous.physics.constraints.Collision
      restitution: .8
      drift: 0.1
    famous.inputs.GenericSync.register
      'mouse': famous.inputs.MouseSync
      'touch': famous.inputs.TouchSync
    @addDragger()
    @addBubbles()
  addDragger: ->
    @dragger = new Dragger()
    @pe.addBody @dragger.body
    (@add @dragger.mod).add @dragger.shape
    sync = new famous.inputs.GenericSync ['mouse', 'touch']
    @dragger.shape.pipe sync
    sync.on 'update', (data) =>
      @dragger.position[0] += data.delta[0]
      @dragger.position[1] += data.delta[1]
      @dragger.body.setPosition @dragger.position
  addBubbles: ->
    [0...@options.numBodies].map (i) =>
      famous.utilities.Timer.setTimeout (@addBubble.bind @, i)
      , (i + 1) * 500
  addBubble: (i) ->
    bubble = new Bubble()
    (@add bubble.mod).add bubble.shape
    bubble.mod.transformFrom ->
      bubble.body.getTransform()
    @pe.attach @collision, @pe.getBodies(), bubble.body
    @pe.attach @gravity, bubble.body
    @pe.attach [
      @walls.components[0]
      @walls.components[1]
      @walls.components[2]
      @walls.components[3]
    ] , bubble.body
    @pe.addBody bubble.body
