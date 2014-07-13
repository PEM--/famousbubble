class @AppView extends famous.core.View
  DEFAULT_OPTIONS:
    numBodies: 10
    gravity: [0, 0.0015, 0]
  constructor: (@options)->
    @constructor.DEFAULT_OPTIONS = @DEFAULT_OPTIONS
    super @options
    surf = new famous.core.Surface
      size: [400, 400]
      properties:
        backgroundColor: '#FFDC00'
        borderRadius: '8px'
    mod = new famous.core.Modifier
      origin: [.5, .5]
    @add(mod).add surf
    @gravity = new famous.physics.forces.Force @options.gravity
    @ceiling = new famous.physics.constraints.Wall
      normal: [0, 1, 0]
      distance: 200
      restitution: 0
    @floor = new famous.physics.constraints.Wall
      normal: [0, -1, 0]
      distance: 200
      restitution: 0
    @left = new famous.physics.constraints.Wall
      normal: [1, 0, 0]
      distance: 200
      restitution: 0
    @right = new famous.physics.constraints.Wall
      normal: [-1, 0, 0]
      distance: 200
      restitution: 0
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
    @pe.attach [@right, @left, @floor, @ceiling], bubble.body
    (@pe.attach @collision, @bubbleBodies, bubble.body) if i > 0
    @pe.attach @collision, [bubble.body], @dragger.body
    @bubbleBodies.push bubble.body

  addBubbles: ->
    [0...@options.numBodies].map (i) =>
      famous.utilities.Timer.setTimeout (@addBubble.bind @, i), 1000
