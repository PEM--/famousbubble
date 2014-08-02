class @AppView extends famous.core.View
  DEFAULT_OPTIONS:
    numBodies: 10
    gravity: [0, 0.0015, 0]
    size: [400, 400]
    origin: [.5, .5]

  constructor: (@options)->
    @constructor.DEFAULT_OPTIONS = @DEFAULT_OPTIONS
    super @options
    surf = new famous.core.Surface
      size: @options.size
      properties:
        backgroundColor: '#FFDC00'
        borderRadius: '8px'
    mod = new famous.core.Modifier origin: @options.origin
    @add(mod).add surf
    @gravity = new famous.physics.forces.Force @options.gravity
    @walls = new famous.physics.constraints.Walls
      size: @options.size
      origin: @options.origin
    @pe = new famous.physics.PhysicsEngine()
    @collision = new famous.physics.constraints.Collision restitution: 0
    @bubbleBodies = []
    famous.inputs.GenericSync.register
      'mouse': famous.inputs.MouseSync
      'touch': famous.inputs.TouchSync

  addDragger: ->
    @dragger = new Dragger()
    @pe.addBody @dragger.body
    (@_add @dragger.state).add @dragger.shape
    sync = new famous.inputs.GenericSync ['mouse', 'touch']
    @dragger.shape.pipe sync
    sync.on 'update', (data) =>
      @dragger.position[0] += data.delta[0]
      @dragger.position[1] += data.delta[1]
      @dragger.body.setPosition @dragger.position

  addBubble: (i) =>
    bubble = new Bubble()
    @pe.addBody bubble.body
    bubble.state.transformFrom =>
      @gravity.applyForce bubble.body
      bubble.body.getTransform()
    (@add bubble.state).add bubble.shape
    @pe.attach [
      @walls.components[0]
      @walls.components[1]
      @walls.components[2]
      @walls.components[3]
    ] , bubble.body
    (@pe.attach @collision, @bubbleBodies, bubble.body) if i > 0
    @pe.attach @collision, [bubble.body], @dragger.body
    @bubbleBodies.push bubble.body

  addBubbles: ->
    [0...@options.numBodies].map (i) =>
      famous.utilities.Timer.setTimeout (@addBubble.bind @, i), 1000
